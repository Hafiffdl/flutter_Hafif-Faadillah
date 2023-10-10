// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:rest_api/models/contact_model.dart';


class ScreenPage2 extends StatefulWidget {
  const ScreenPage2({super.key});

  @override
  _ScreenPage2State createState() => _ScreenPage2State();
}

class _ScreenPage2State extends State<ScreenPage2> {
  Contact? contact;

  void fetchData() async {
    final dio = Dio();
    final response = await dio.get(
      "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2",
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = response.data;
      final contactData = Contact.fromJson(data);
      setState(() {
        contact = contactData;
      });
    } else {
      print("Failed to load data.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple[100],
        title: const Text('Prioritas 1 No 2'),
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
            if (contact != null)
              Column(
                children: [
                  Text("ID: ${contact!.id}"),
                  Text("Name: ${contact!.name}"),
                  Text("Phone: ${contact!.phone}"),
                ],
              ),
          ],
        ),
      ),
    );
  }
}