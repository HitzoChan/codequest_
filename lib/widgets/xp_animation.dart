import 'package:flutter/material.dart';

/// Shows a small floating XP animation as an OverlayEntry.
class XpAnimation {
  /// Show the floating XP animation. Automatically removes itself.
  static void show(BuildContext context, int xp) {
    final overlay = Overlay.of(context);

    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (context) => _XpOverlay(entry: entry, xp: xp),
    );

    overlay.insert(entry);
  }
}

class _XpOverlay extends StatefulWidget {
  final OverlayEntry entry;
  final int xp;

  const _XpOverlay({required this.entry, required this.xp});

  @override
  State<_XpOverlay> createState() => _XpOverlayState();
}

class _XpOverlayState extends State<_XpOverlay> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _moveUp;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(duration: const Duration(milliseconds: 1400), vsync: this);
    _moveUp = Tween<double>(begin: 0, end: -90).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _fade = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeIn));

    _ctrl.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.entry.remove();
      }
    });

    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Positioned(
      top: media.size.height * 0.25,
      left: 0,
      right: 0,
      child: IgnorePointer(
        ignoring: true,
        child: AnimatedBuilder(
          animation: _ctrl,
          builder: (context, child) {
            return Opacity(
              opacity: _fade.value,
              child: Transform.translate(
                offset: Offset(0, _moveUp.value),
                child: child,
              ),
            );
          },
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.75),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 8, offset: const Offset(0, 4))],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                    ),
                    child: const Icon(Icons.star, color: Colors.white, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '+${widget.xp} XP',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
