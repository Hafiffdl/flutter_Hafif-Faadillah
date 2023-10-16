import 'package:flutter/material.dart';
import 'package:openai_flutter/models/open_ai_model.dart';

class ResultScreen extends StatelessWidget {
  final GPTData gptResponseData;

  const ResultScreen({
    Key? key,
    required this.gptResponseData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Rekomendasi"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  "Rekomendasi Smartphone",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: gptResponseData.choices.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(gptResponseData.choices[index].text), 
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
