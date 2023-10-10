import 'package:flutter/material.dart';
import 'package:rest_api/screens/home_page.dart';
import 'package:rest_api/screens/screen_2.dart';
import 'package:rest_api/screens/screen_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REST API',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/screen2':(context) => const ScreenPage2(),
        '/screen3':(context) => const ScreenPage3(),
      },
      home: const HomePage(title: 'REST API',)
    );
  }
}


