import 'package:flutter/material.dart';

class LoadingWidget {
  late BuildContext _context;
  late OverlayEntry _entry;

  final _child = Container(
    color: const Color.fromRGBO(255, 255, 255, 0.7),
    child: const Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(),
      ),
    ),
  );

  LoadingWidget(BuildContext context) {
    _context = context;
    _entry = OverlayEntry(
      builder: (context) => _child,
    );
  }

  void showOverlay() {
    Overlay.of(_context).insert(_entry);
  }

  void hideOverlay() {
    if (_entry.mounted) _entry.remove();
  }
}
