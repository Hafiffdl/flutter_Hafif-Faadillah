// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageGenerator extends StatefulWidget {
  const ImageGenerator({Key? key}) : super(key: key);

  @override
  _ImageGeneratorState createState() => _ImageGeneratorState();
}

class _ImageGeneratorState extends State<ImageGenerator> {
  TextEditingController nameController = TextEditingController();
  String imageSvg = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Future<void> generateImage(String name) async {
    String apiUrl;

    if (name == 'Boots') {
      apiUrl =
          'https://api.dicebear.com/7.x/adventurer-neutral/svg?seed=Boots';
    } else if (name == 'Luna') {
      apiUrl = 'https://api.dicebear.com/7.x/adventurer-neutral/svg?seed=Luna';
    } else {
      final List<String> apiUrls = [
        'https://api.dicebear.com/7.x/adventurer-neutral/svg?seed=Jack',
        'https://api.dicebear.com/7.x/adventurer-neutral/svg?seed=Pumpkin',
        'https://api.dicebear.com/7.x/adventurer-neutral/svg?seed=Max',
        'https://api.dicebear.com/7.x/adventurer-neutral/svg?seed=Abby',
        'https://api.dicebear.com/7.x/adventurer-neutral/svg?seed=Princess',
        'https://api.dicebear.com/7.x/adventurer-neutral/svg?seed=Jasmine'
      ];

      final random = Random();
      apiUrl = apiUrls[random.nextInt(apiUrls.length)];
    }

    try {
      final response = await Dio().get(apiUrl);

      if (response.statusCode == 200) {
        setState(() {
          imageSvg = response.data.toString();
        });
      } else {
        throw Exception('Gagal mengambil data gambar SVG. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Image Generator'),
        backgroundColor: Colors.deepPurple[100],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                imageSvg.isNotEmpty
                    ? Column(
                        children: [
                          const Text(
                            'Generated Image',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SvgPicture.string(
                            imageSvg,
                            width: 200,
                            height: 200,
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      generateImage(nameController.text);
                    }
                  },
                  child: const Text('Generate'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
