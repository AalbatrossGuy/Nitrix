import 'package:Nitrix/data/themes.dart';
import 'package:Nitrix/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nitrix',
      theme: themes.lightThemeData,
      darkTheme: themes.darkThemeData,
      themeMode: ThemeMode.dark,
      home: const HomePage(
        title: 'Nitrix Home',
      ),
    );
  }
}
