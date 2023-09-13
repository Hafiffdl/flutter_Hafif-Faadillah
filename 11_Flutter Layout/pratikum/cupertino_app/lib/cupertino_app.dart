import 'package:flutter/cupertino.dart';
import 'package:cupertino_app/cupertino_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final _themeDart = const CupertinoThemeData.raw(
    Brightness.dark, 
    null, 
    null, 
    null, 
    null, 
    null, 
    null,
    );

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: _themeDart,
      home: const HomePage(),
    );
  }
}