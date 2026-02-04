enum AppExperience {
  fun,
  club,
}

class AppConfig {
  final AppExperience experience;
  final bool clubModeEnabled;

  const AppConfig({
    required this.experience,
    this.clubModeEnabled = false,
  });

  static const dev = AppConfig(
    experience: AppExperience.fun,
    clubModeEnabled: false,
  );
}
