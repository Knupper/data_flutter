import 'package:flutter/material.dart';
import 'package:flutter_schulung/home_scaffold.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
      ).copyWith(
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
      ).copyWith(
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
      home: const HomeScaffold(),
    );
  }
}
