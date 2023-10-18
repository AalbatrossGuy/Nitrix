import 'package:Nitrix/data/themes.dart';
import 'package:Nitrix/pages/feedback.dart';
import 'package:Nitrix/pages/home.dart';
import 'package:Nitrix/pages/online.dart';
import 'package:Nitrix/pages/stats.dart';
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
      themeMode: ThemeMode.light,
      routes: {
        '/': (context) => const HomePage(title: 'Nitrix Home'),
        '/stats': (context) => const statsPage(),
        '/online': (context) => const onlinePage(),
        '/feedback': (context) => const feedbackPage(),
      },
      initialRoute: '/',
    );
  }
}
