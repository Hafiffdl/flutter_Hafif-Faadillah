import 'package:dio/dio.dart';

Future<String> fetchData() async {
    try {
      final response = await Dio().get('https://api.dicebear.com/7.x/pixel-art/svg');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Gagal mengambil data dari API');
      }
    } catch (e) {
      throw Exception('Gagal mengambil data dari API: $e');
    }
  }