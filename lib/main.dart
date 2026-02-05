import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const KpHidPocApp());

class KpHidPocApp extends StatelessWidget {
  const KpHidPocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KP HID POC',
      theme: ThemeData(useMaterial3: true),
      home: const HidListenerPage(),
    );
  }
}

class HidListenerPage extends StatefulWidget {
  const HidListenerPage({super.key});

  @override
  State<HidListenerPage> createState() => _HidListenerPageState();
}

class _HidListenerPageState extends State<HidListenerPage> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  // ... keep your state fields and _fmtKey

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KP HID Listener')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('focus: ${_focusNode.hasFocus ? "YES" : "NO"}'),
            const SizedBox(height: 12),
            KeyboardListener(
              focusNode: _focusNode,
              autofocus: true,
              onKeyEvent: (e) {
                setState(() {
                  _last = _fmtKey(e);
                  _ts = DateTime.now();
                });
              },
              child: GestureDetector(
                onTap: () => _focusNode.requestFocus(),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _ts == null ? _last : '$_last\n\ntime: ${_ts!.toIso8601String()}',
                    style: const TextStyle(fontFamily: 'monospace'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

