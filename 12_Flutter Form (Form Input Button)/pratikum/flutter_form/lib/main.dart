import 'package:flutter/material.dart';
import 'package:flutter_layout/flutter_form.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form',
      theme: ThemeData(
      ),
      home: const FlutterForm(),
    );
  }
}

