import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;

import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../backend/course_models.dart';

class ModuleDetailScreen extends StatefulWidget {
  final Module module;

  const ModuleDetailScreen({super.key, required this.module});

  @override
  State<ModuleDetailScreen> createState() => _ModuleDetailScreenState();
}

class _ModuleDetailScreenState extends State<ModuleDetailScreen> {
  late YoutubePlayerController _ytController;
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    super.initState();

    // Debug: Print module info
    debugPrint('DEBUG ModuleDetailScreen: Module ID: ${widget.module.moduleId}');
    debugPrint('DEBUG ModuleDetailScreen: Module Title: ${widget.module.title}');
    debugPrint('DEBUG ModuleDetailScreen: pdfUrl: ${widget.module.pdfUrl}');

    final videoId = YoutubePlayer.convertUrlToId(widget.module.youtubeUrl);

    _ytController = YoutubePlayerController(
      initialVideoId: videoId ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: false,
      ),
    );
  }

  @override
  void dispose() {
    _ytController.dispose();
    super.dispose();
  }

  // -------------------------------
  // TEXT TO SPEECH
  // -------------------------------
  void speakSummary() async {
    await _tts.setLanguage("en-US");
    await _tts.setSpeechRate(0.45);
    await _tts.speak(widget.module.summary);
  }

  // ------------------------------------------------
  // DOWNLOAD PDF FROM GOOGLE DRIVE DIRECT LINK
  // ------------------------------------------------
  Future<void> downloadPdfFromDrive() async {
    debugPrint('===== DOWNLOAD PDF DEBUG =====');
    debugPrint('Module ID: ${widget.module.moduleId}');
    debugPrint('Module Title: ${widget.module.title}');
    debugPrint('pdfUrl value: ${widget.module.pdfUrl}');
    debugPrint('pdfUrl is null: ${widget.module.pdfUrl == null}');
    debugPrint('pdfUrl is empty: ${widget.module.pdfUrl?.isEmpty}');
    debugPrint('===========================');
    
    if (widget.module.pdfUrl == null || widget.module.pdfUrl!.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No PDF URL available.")),
      );
      return;
    }

    try {
      final url = widget.module.pdfUrl!;
      final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
        final dir = await getDownloadsDirectory() ?? await getTemporaryDirectory();
        final filePath = "${dir.path}/${widget.module.title}.pdf";

        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("PDF downloaded: $filePath")),
        );

        OpenFile.open(filePath);
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to download PDF.")),
        );
      }
    } catch (e) {
      // Log detailed error for debugging
      // ignore: avoid_print
      debugPrint('Error downloading PDF: $e');

      // Provide actionable UI: allow opening the URL externally or copying it
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (dialogContext) {
          // Capture values that will be used after async gaps so we don't
          // access `BuildContext` across await boundaries.
          final messenger = ScaffoldMessenger.of(context);
          final pdfUrl = widget.module.pdfUrl ?? '';

          return AlertDialog(
            title: const Text('Download failed'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Could not download the PDF. This may be caused by a network or TLS error.'),
                const SizedBox(height: 12),
                Text('URL:\n$pdfUrl', style: const TextStyle(fontSize: 12)),
              ],
            ),
            actions: [
              TextButton(
                child: const Text('Copy URL'),
                onPressed: () async {
                  Navigator.of(dialogContext).pop();
                  await Clipboard.setData(ClipboardData(text: pdfUrl));
                  messenger.showSnackBar(const SnackBar(content: Text('URL copied to clipboard')));
                },
              ),
              TextButton(
                child: const Text('Open in Browser'),
                onPressed: () async {
                  Navigator.of(dialogContext).pop();
                  final url = Uri.parse(pdfUrl);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    messenger.showSnackBar(const SnackBar(content: Text('Unable to open URL')));
                  }
                },
              ),
                  if (kDebugMode)
                TextButton(
                  child: const Text('Try Insecure (Debug)'),
                  onPressed: () async {
                    Navigator.of(dialogContext).pop();
                    // Attempt insecure download only in debug builds
                    await _downloadPdfInsecurely();
                  },
                ),
              TextButton(
                child: const Text('Close'),
                onPressed: () => Navigator.of(dialogContext).pop(),
              ),
            ],
          );
        },
      );
    }
  }

  // DEBUG ONLY: Attempt download while accepting invalid/self-signed certs.
  // This is strictly for local debugging and will NOT run in release builds.
  Future<void> _downloadPdfInsecurely() async {
    if (widget.module.pdfUrl == null || widget.module.pdfUrl!.isEmpty) return;
    try {
      final uri = Uri.parse(widget.module.pdfUrl!);
      final client = HttpClient()
        ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final request = await client.getUrl(uri);
      final response = await request.close();
      if (response.statusCode == 200) {
        final bytes = await consolidateHttpClientResponseBytes(response);
        final dir = await getDownloadsDirectory() ?? await getTemporaryDirectory();
        final filePath = "${dir.path}/${widget.module.title}.pdf";
        final file = File(filePath);
        await file.writeAsBytes(bytes);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Insecure PDF downloaded: $filePath')));
        OpenFile.open(filePath);
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to download (insecure).')));
      }
    } catch (e) {
      // ignore: avoid_print
      debugPrint('Insecure download failed: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Insecure download error: $e')));
    }
  }

  // ------------------------------------------------
  // OPTIONAL: GENERATE LOCAL PDF (NOT FOR DRIVE)
  // ------------------------------------------------
  Future<void> generateLocalPdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Padding(
          padding: const pw.EdgeInsets.all(20),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(widget.module.title,
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  )),
              pw.SizedBox(height: 15),
              pw.Text(
                widget.module.content.isNotEmpty
                    ? widget.module.content
                    : widget.module.summary,
                style: pw.TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );

    final dir = await getTemporaryDirectory();
    final file = File("${dir.path}/${widget.module.title}_Generated.pdf");
    await file.writeAsBytes(await pdf.save());

    OpenFile.open(file.path);
  }

  // Build responsive action buttons: Listen, Download, Open PDF
  Widget _buildActionButtons(BuildContext context) {
    final listenColor = const Color(0xFF3585B5);
    final downloadColor = const Color(0xFF4CAF50);
    final openColor = const Color(0xFF2196F3);

    ButtonStyle actionStyle(Color color) => ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          minimumSize: const Size.fromHeight(52),
        );

    final listenBtn = ElevatedButton.icon(
      onPressed: speakSummary,
      icon: const Icon(Icons.volume_up, color: Colors.white),
      label: const Text('Listen', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
      style: actionStyle(listenColor),
    );

    final downloadBtn = ElevatedButton.icon(
      onPressed: downloadPdfFromDrive,
      icon: const Icon(Icons.picture_as_pdf, color: Colors.white),
      label: const Text('Download PDF', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
      style: actionStyle(downloadColor),
    );

    final openBtn = ElevatedButton.icon(
      onPressed: (widget.module.pdfUrl != null && widget.module.pdfUrl!.isNotEmpty)
          ? () async {
              final messenger = ScaffoldMessenger.of(context);
              final url = Uri.parse(widget.module.pdfUrl!);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                messenger.showSnackBar(const SnackBar(content: Text('Unable to open PDF')));
              }
            }
          : null,
      icon: const Icon(Icons.open_in_new, color: Colors.white),
      label: const Text('Open PDF', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
      style: actionStyle(openColor),
    );

    final quizColor = const Color(0xFF7EC8E3);
    final quizBtn = ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(
          context,
          '/quiz',
          arguments: widget.module.moduleId,
        );
      },
      icon: const Icon(Icons.quiz, color: Colors.white),
      label: const Text('Take Quiz', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
      style: actionStyle(quizColor),
    );

    return LayoutBuilder(builder: (context, constraints) {
      final maxW = constraints.maxWidth;
      // On very narrow widths stack vertically
      if (maxW < 360) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(width: double.infinity, child: listenBtn),
            const SizedBox(height: 10),
            SizedBox(width: double.infinity, child: downloadBtn),
            const SizedBox(height: 10),
            SizedBox(width: double.infinity, child: openBtn),
            const SizedBox(height: 10),
            SizedBox(width: double.infinity, child: quizBtn),
          ],
        );
      }

      // For typical phone widths show two buttons per row using Wrap
      final itemWidth = (maxW - 10) / 2; // subtract spacing

      return Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          SizedBox(width: itemWidth, child: listenBtn),
          SizedBox(width: itemWidth, child: downloadBtn),
          SizedBox(width: itemWidth, child: openBtn),
          SizedBox(width: itemWidth, child: quizBtn),
        ],
      );
    });
  }

  // ------------------------------------------------
  // UI
  // ------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1F2D),

      appBar: AppBar(
        backgroundColor: const Color(0xFF5AB4D8),
        title: Text(
          widget.module.title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _ytController,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.lightBlueAccent,
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Lesson Summary",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF1A3A52),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.module.summary,
                      style: const TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildActionButtons(context),
            ),

            const SizedBox(height: 20),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
