import 'package:flutter/material.dart';

class FunShell extends StatelessWidget {
  final Widget child;

  const FunShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}
