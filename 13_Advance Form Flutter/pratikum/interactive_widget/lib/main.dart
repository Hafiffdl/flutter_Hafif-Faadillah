import 'package:flutter/material.dart';
import 'package:interactive_widget/advance_form.dart';

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
      home: const AdvanceForm(),
    );
  }
}

