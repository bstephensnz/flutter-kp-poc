import 'package:flutter/material.dart';

class ClubShell extends StatelessWidget {
  final Widget child;

  const ClubShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Club Mode')),
      body: child,
    );
  }
}
