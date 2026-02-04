import 'package:flutter/material.dart';
import 'package:king_pong_poc/app/app_config.dart';
import 'package:king_pong_poc/app/king_pong_app.dart';

void main() {
  const config = AppConfig(experience: AppExperience.fun);
  runApp(const KingPongApp(config: config));
}
