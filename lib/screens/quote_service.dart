import 'dart:convert';
import 'package:http/http.dart' as http;

class QuoteService {
  static const String _apiUrl = 'https://api.openai.com/v1/chat/completions';
  static const String _apiKey =
      'sk-proj-40YXMBkRFPrWVpUYaHEYT3BlbkFJHHepjudd5FKxrFqAsf44';

  Future<String> fetchQuote() async {
    final response = await http.get(
      Uri.parse(_apiUrl),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['quote'] ?? 'Stay positive!';
    } else {
      throw Exception('Failed to load quote');
    }
  }
}
