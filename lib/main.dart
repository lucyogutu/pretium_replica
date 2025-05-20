import 'package:flutter/material.dart';
import 'package:pretium_replica/Presentation/onboarding/pages/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pretium Replica',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal[800]!,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(
              Colors.white,
            ),
            backgroundColor: WidgetStatePropertyAll(
              Colors.teal[800],
            ),
          ),
        ),
      ),
      home: const OnboardingPage(),
    );
  }
}
