
import 'package:dio/dio.dart';
import 'package:interactive_widget/models/contact_model.dart';

class ContactApi {
  final Dio _dio = Dio();
  final String baseUrl = 'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts';

  Future<List<ContactModel>> fetchContacts() async {
    try {
      final response = await _dio.get('$baseUrl/contacts');
      final List<dynamic> jsonList = response.data;

      List<ContactModel> contacts = jsonList.map((json) => ContactModel.fromJson(json)).toList();

      return contacts;
    } catch (e) {
      throw Exception('Failed to load contacts');
    }
  }
}