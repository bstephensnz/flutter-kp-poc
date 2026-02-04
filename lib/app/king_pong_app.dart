import 'package:flutter/material.dart';
import 'package:king_pong_poc/app/app_config.dart';
import 'package:king_pong_poc/app/router.dart';
import 'package:king_pong_poc/experiences/fun/fun_theme.dart';

class KingPongApp extends StatelessWidget {
  final AppConfig config;

  const KingPongApp({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    // In the future, this would switch themes/shells based on config.experience
    return MaterialApp(
      title: 'King Pong HID PoC',
      theme: FunTheme.light, // Default to Fun theme for now
      home: const KingPongRouter(),
    );
  }
}
