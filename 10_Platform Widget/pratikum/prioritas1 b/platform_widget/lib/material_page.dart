import 'package:flutter/material.dart';
import 'package:platform_widget/list_contact.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Contact'), 
          ),
        ),
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(contacts[index].name),
              subtitle: Text(contacts[index].phoneNumber),
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text(contacts[index].name[0]),
              ),
              onTap: () {
              },
            );
          }
        ),
      ),
    );
  }
}