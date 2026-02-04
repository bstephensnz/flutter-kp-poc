import 'package:flutter/material.dart';
import 'package:king_pong_poc/platform/input/hid/hid_input_event.dart';
import 'package:king_pong_poc/platform/input/hid/hid_input_service.dart';

class DevicesViewModel extends ChangeNotifier {
  final HidInputService _hidInputService;

  DevicesViewModel({required HidInputService inputService})
      : _hidInputService = inputService {
    _hidInputService.addListener(notifyListeners);
  }

  List<HidInputEvent> get events => _hidInputService.events;
  HidInputEvent? get lastEvent => _hidInputService.lastEvent;
  FocusNode get focusNode => _hidInputService.focusNode;

  void handleKeyEvent(KeyEvent event) {
    _hidInputService.handleKeyEvent(event);
  }

  void clearHelper() {
    _hidInputService.clearEvents();
  }

  void refocus() {
    _hidInputService.refocus();
  }

  @override
  void dispose() {
    _hidInputService.removeListener(notifyListeners);
    super.dispose();
  }
}
