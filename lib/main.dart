import 'package:flutter/material.dart';
import 'package:pretium_replica/presentation/routing/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pretium Replica',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal[800]!,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll<Color?>(
              Colors.white,
            ),
            backgroundColor: WidgetStatePropertyAll<Color?>(
              Colors.teal[800],
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.teal[800],
        ),
      ),
      routerConfig: router,
    );
  }
}
