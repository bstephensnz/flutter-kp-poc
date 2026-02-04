import 'package:flutter/material.dart';

import 'package:king_pong_poc/features/devices/devices_view_model.dart';
import 'package:king_pong_poc/features/devices/widgets/key_event_card.dart';
import 'package:king_pong_poc/platform/input/hid/hid_input_service.dart';
import 'package:king_pong_poc/shared/ui/app_scaffold.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({super.key});

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  // Simple DI for PoC
  late final HidInputService _inputService;
  late final DevicesViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _inputService = HidInputService()..initialize();
    _viewModel = DevicesViewModel(inputService: _inputService);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _inputService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Devices / HID Test',
      body: AnimatedBuilder(
        animation: _viewModel,
        builder: (context, child) {
          final hasFocus = _viewModel.focusNode.hasFocus;
          return KeyboardListener(
            focusNode: _viewModel.focusNode,
            onKeyEvent: _viewModel.handleKeyEvent,
            child: Column(
              children: [
                _buildHeader(hasFocus),
                _buildLastKey(),
                const Divider(),
                Expanded(child: _buildEventList()),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(bool hasFocus) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(
            hasFocus ? Icons.check_circle : Icons.error,
            color: hasFocus ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 8),
          Text(hasFocus ? 'Focus: Active' : 'Focus: LOST'),
          const Spacer(),
          TextButton(
            onPressed: _viewModel.clearHelper,
            child: const Text('Clear'),
          ),
          FilledButton.tonal(
            onPressed: _viewModel.refocus,
            child: const Text('Refocus'),
          ),
        ],
      ),
    );
  }

  Widget _buildLastKey() {
    final event = _viewModel.lastEvent;
    if (event == null) {
      return const SizedBox(
        height: 100,
        child: Center(
          child: Text(
            'Press any key...',
            style: TextStyle(fontSize: 24, color: Colors.grey),
          ),
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.all(24),
      alignment: Alignment.center,
      color: Colors.grey.shade100,
      child: Column(
        children: [
          const Text('Last Pressed', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Text(
            event.logicalKeyLabel ?? '?',
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          Text(
            'Physical: ${event.physicalKeyUsbHidUsage} | Logical: ${event.logicalKeyId}',
            style: const TextStyle(fontFamily: 'Courier', fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildEventList() {
    final events = _viewModel.events;
    if (events.isEmpty) return const SizedBox.shrink();

    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return KeyEventCard(
          event: events[index],
          isLatest: index == 0,
        );
      },
    );
  }
}
