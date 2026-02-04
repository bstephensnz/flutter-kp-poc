import 'package:flutter/material.dart';
import 'package:king_pong_poc/platform/input/hid/hid_input_event.dart';

class KeyEventCard extends StatelessWidget {
  final HidInputEvent event;
  final bool isLatest;

  const KeyEventCard({
    super.key,
    required this.event,
    this.isLatest = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isLatest ? Colors.blue.shade50 : null,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        leading: Icon(
          Icons.keyboard,
          color: isLatest ? Colors.blue : Colors.grey,
        ),
        title: Text(
          event.logicalKeyLabel ?? 'Unlabeled',
          style: TextStyle(
            fontWeight: isLatest ? FontWeight.bold : FontWeight.normal,
            fontSize: isLatest ? 18 : 14,
          ),
        ),
        subtitle: Text(
          'ID: ${event.logicalKeyId} | HID: ${event.physicalKeyUsbHidUsage} | ${event.platform}',
          style: const TextStyle(fontSize: 12),
        ),
        trailing: Text(
          _formatTime(event.timestamp),
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final h = time.hour.toString().padLeft(2, '0');
    final m = time.minute.toString().padLeft(2, '0');
    final s = time.second.toString().padLeft(2, '0');
    final ms = time.millisecond.toString().padLeft(3, '0');
    return '$h:$m:$s.$ms';
  }
}
