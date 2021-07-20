import 'package:flutter/material.dart';

OverlayEntry showOverlay(context) {
  OverlayState? oState = Overlay.of(context);

  OverlayEntry entry = OverlayEntry(
    builder: (context) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.7),
        ),
        child: Center(child: CircularProgressIndicator()),
      );
    },
    opaque: false,
  );

  oState!.insert(entry);
  return entry;
}
