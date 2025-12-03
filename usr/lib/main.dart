import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/landing_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/editor_screen.dart';

void main() {
  runApp(const AnimeGameMakerApp());
}

class AnimeGameMakerApp extends StatelessWidget {
  const AnimeGameMakerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Game Maker Studio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/editor': (context) => const EditorScreen(),
      },
    );
  }
}
