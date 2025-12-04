import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'oauth_config.dart';

// For `clientViaUserConsent` on non-mobile platforms you can use this helper
// to obtain an authenticated `auth.AuthClient`.

class DriveService {
  final String baseUrl;

  DriveService({required this.baseUrl});

  /// Upload a PDF to the backend Drive uploader endpoint
  /// Returns a map with `fileId` and optional `webViewLink`.
  Future<Map<String, dynamic>> uploadPdf(File pdfFile, String moduleId) async {
    final uri = Uri.parse('$baseUrl/api/upload-pdf');

    final request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('file', pdfFile.path, contentType: MediaType('application', 'pdf')));
    request.fields['moduleId'] = moduleId;

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Upload failed: ${response.statusCode} - ${response.body}');
    }
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    return body;
  }

  /// Get an auth client via user consent - note: this flow opens a browser for consent
  static Future<auth.AuthClient> clientViaUserConsent(
      auth.ClientId clientId, List<String> scopes, void Function(String) prompt) async {
    return await auth.clientViaUserConsent(clientId, scopes, prompt);
  }

  /// Convenience wrapper that uses the configured `googleDriveClientId`.
  static Future<auth.AuthClient> clientViaDefaultUserConsent(List<String> scopes, void Function(String) prompt) async {
    final cid = auth.ClientId(googleDriveClientId, googleDriveClientSecret);
    return await clientViaUserConsent(cid, scopes, prompt);
  }

  /// List files on Google Drive using a provided authenticated client
  static Future<List<drive.File>?> listDriveFiles(auth.AuthClient client, {String? folderId}) async {
    final driveApi = drive.DriveApi(client);
    final q = folderId != null ? "'$folderId' in parents" : null;
    final res = await driveApi.files.list(q: q, $fields: 'files(id,name,webViewLink,webContentLink)');
    return res.files;
  }

  /// Direct upload to Drive via [auth.AuthClient]
  static Future<drive.File?> directDriveUpload(auth.AuthClient client, File file, String name, {String? folderId}) async {
    final driveApi = drive.DriveApi(client);
    final metadata = drive.File();
    metadata.name = name;
    if (folderId != null) metadata.parents = [folderId];
    final media = drive.Media(file.openRead(), file.lengthSync(), contentType: "application/pdf");
    final result = await driveApi.files.create(metadata, uploadMedia: media, $fields: 'id,name,webViewLink,webContentLink');
    return result;
  }
}
