import 'package:flutter/material.dart';
import 'package:king_pong_poc/features/devices/devices_page.dart';

class KingPongRouter extends StatelessWidget {
  const KingPongRouter({super.key});

  @override
  Widget build(BuildContext context) {
    // Very simple router for now.
    // In a real app, use GoRouter or similar.
    return const DevicesPage();
  }
}
