// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class ScreenPage3 extends StatefulWidget {
  const ScreenPage3({super.key});

  @override
  _ScreenPage3State createState() => _ScreenPage3State();
}

class _ScreenPage3State extends State<ScreenPage3> {
  String responseText = '';

  void fetchData() async {
    final dio = Dio();
    const url = 'https://jsonplaceholder.typicode.com/posts/1';

    final data = {
      'id': 1,
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    };

    try {
      final response = await dio.put(
        url,
        data: data,
      );

      if (response.statusCode == 200) {
        setState(() {
          responseText = '${response.data}';
        });
      } else {
        setState(() {
          responseText = 'Failed to update post';
        });
      }
    } catch (e) {
      setState(() {
        responseText = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        centerTitle: true,
        title: const Text('Prioritas 1 No 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: fetchData,
              child: const Text('Fetch Data'),
            ),
            const SizedBox(height: 20),
            Text(
              responseText,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}