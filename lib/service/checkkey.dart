import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

Future<bool> checkAPIKey(String openaikey) async {
  final url = Uri.parse('https://api.openai.com/v1/engines/davinci');
  final headers = {'Authorization': 'Bearer $openaikey'};

  try {
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse.containsKey('id') && jsonResponse['id'] == 'davinci') {
        return true;
      }
    }
  } catch (e) {}

  return false; //false
}