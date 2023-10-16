// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:openai_flutter/screens/result_screen.dart';
import 'package:openai_flutter/services/recommendation_service.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _cameraController = TextEditingController();
  final TextEditingController _internalStorageController = TextEditingController();
  
  bool isLoading = false;

  void _getRecommendations() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await RecommendationService.getRecommendation(
        phoneBudget: _budgetController.text,
        camera: _cameraController.text,
        internalStorage: _internalStorageController.text,

      );
if (mounted) {
  setState(() {
    isLoading = false;
  });
}

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            gptResponseData: result,
          ),
        ),
      );
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Gagal mendapatkan rekomendasi'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Phone Recommendation"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Pilih Recommendation"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _budgetController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Masukkan Budget",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan budget';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _cameraController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: "Masukkan Camera",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan camera';
                      }
                      return null;
                    },
                  ),
                  
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _internalStorageController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: "Masukkan internal storage",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan internal storage';
                      }
                      return null;
                    },
                  ),
                  
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isLoading &&
                  _formKey.currentState!.validate() != false
                      ? const Center(
                        child: CircularProgressIndicator()
                        )
                      : ElevatedButton(
                        onPressed: _getRecommendations,
                          child: isLoading
                            ? const CircularProgressIndicator()
                            : const Text("Dapatkan Rekomendasi"),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}