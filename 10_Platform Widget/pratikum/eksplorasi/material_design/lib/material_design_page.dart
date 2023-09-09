import 'package:flutter/material.dart';
import 'package:material_design/constant/constant.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          actions: [
            IconButton(
              onPressed: () {}, icon: const Icon(Icons.search),
              )
          ],
          title: const Center(
            child: Text('My Flutter App'),
          ),
        ),
        body: ListView(
          children: ListTile.divideTiles(
      context: context,
      tiles: const [
        ListTile(
          title: Text('Learn Flutter'),
        ),
        ListTile(
          title: Text('Learn ReactJS'),
        ),
        ListTile(
          title: Text('Learn VueJS'),
        ),
        ListTile(
          title: Text('Learn Tailwind CSS'),
        ),
        ListTile(
          title: Text('Learn UI/UX'),
        ),
        ListTile(
          title: Text('Learn Figma'),
        ),
        ListTile(
          title: Text('Learn Digital Marketing'),
        ),
      ]
  ).toList(),
        ),  
        bottomNavigationBar: BottomNavigationBar(
          
          backgroundColor: primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),

          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Information'),
        ]),
        floatingActionButton: FloatingActionButton(
        onPressed: () {}, backgroundColor: secondaryColor, foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      )
      )
    );
  }
}