// recommendation_service.dart
// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:openai_flutter/constants/open_ai.dart';
import 'package:openai_flutter/models/open_ai_model.dart';
import 'package:http/http.dart' as http;

class RecommendationService {
  static Future<GPTData> getRecommendation({
    required String camera,
    required String phoneBudget,
    required String internalStorage,
  }) async {
    try {
      var url = Uri.parse("https://api.openai.com/v1/completions");

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey",
      };

      String promptData =
      'Please give me 2 smartphone recommendation with description up to $camera megapixel camera and up to $internalStorage GB storage with budget up to IDR $phoneBudget.';

      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": promptData,
        "max_tokens": 200,
        "temperature": 0.7,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0,
      });

      var response = await http.post(
        url,
        headers: headers,
        body: data,
      );

      if (response.statusCode == 200) {
        return gptDataFromJson(response.body);
      } else {
        print(response.statusCode);
        throw Exception('Failed to get recommendation');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to get recommendation');
    }
  }
}
