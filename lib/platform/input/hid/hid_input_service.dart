import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:king_pong_poc/platform/input/hid/hid_input_event.dart';

class HidInputService extends ChangeNotifier {
  final FocusNode focusNode = FocusNode();
  final List<HidInputEvent> _events = [];
  
  List<HidInputEvent> get events => List.unmodifiable(_events);
  
  /// Helper to expose last event for UI convenience
  HidInputEvent? get lastEvent => _events.isNotEmpty ? _events.first : null;

  void initialize() {
    focusNode.requestFocus();
  }

  /// Handles key events from a [KeyboardListener] or [Focus] widget.
  void handleKeyEvent(KeyEvent event) {
    if (event is! KeyDownEvent) return; // Only capture KeyDown for now

    final hidEvent = HidInputEvent(
      timestamp: DateTime.now(),
      logicalKeyLabel: event.logicalKey.keyLabel,
      logicalKeyId: event.logicalKey.keyId,
      physicalKeyUsbHidUsage: event.physicalKey.usbHidUsage,
      platform: defaultTargetPlatform.toString(),
      isRepeat: event is KeyRepeatEvent,
    );

    _events.insert(0, hidEvent);
    
    // Keep only last 50 events to avoid memory growth
    if (_events.length > 50) {
      _events.removeLast();
    }

    notifyListeners();
  }

  void clearEvents() {
    _events.clear();
    notifyListeners();
  }
  
  void refocus() {
    focusNode.requestFocus();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
