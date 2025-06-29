import 'package:flutter/material.dart';

/// A simple full-screen semi-transparent overlay with a loading spinner.
/// Call [LoadingOverlay.show] to display and [LoadingOverlay.hide] to remove.
class LoadingOverlay {
  static final _key = GlobalKey<_OverlayEntryWidgetState>();

  static void show(BuildContext context) {
    if (_key.currentState != null) return; // already shown
    final overlay = OverlayEntry(
      builder: (_) => _OverlayEntryWidget(key: _key),
    );
    Overlay.of(context, rootOverlay: true).insert(overlay);
  }

  static void hide() {
    _key.currentState?.remove();
  }
}

class _OverlayEntryWidget extends StatefulWidget {
  const _OverlayEntryWidget({super.key});

  @override
  _OverlayEntryWidgetState createState() => _OverlayEntryWidgetState();
}

class _OverlayEntryWidgetState extends State<_OverlayEntryWidget> {
  late OverlayEntry _self;

  @override
  void initState() {
    super.initState();
    _self = Overlay.of(context)!.widget.key as OverlayEntry;
  }

  void remove() {
    _self.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ModalBarrier(dismissible: false, color: Colors.black45),
      const Center(child: CircularProgressIndicator()),
    ]);
  }
}
