import 'package:flutter/material.dart';
import 'package:flutter_assets/bloc/contact_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_assets/contact_page.dart';
import 'package:flutter_assets/gallery_page.dart';
import 'package:flutter_assets/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assets',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/contact': (context) => const ContactPage(),
        '/gallery': (context) => const GalleryPage(),
      },
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ContactBloc()),
        ],
        child: const HomePage(),
      ),
    );
  }
}
