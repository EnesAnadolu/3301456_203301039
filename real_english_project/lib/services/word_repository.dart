import 'package:http/http.dart' as http;
import 'package:real_english_project/model/word_model.dart';
import 'dart:io';
import 'dart:convert';

import '../model/failure.dart';


class WordRepository{

  static const String _baseUrl = 'https://api.notion.com/v1/';

  final http.Client _client;
  final String id = 'a24209f809724b3aaa0cde33d2f09c74';
  final String apiKey = 'secret_lpH3OETYp5Vbh68IfcuVawrIB8dBPBnzCGd1HtucFew';

  WordRepository({http.Client? client}) : _client = client ?? http.Client();

  void dispose() {
    _client.close();
  }

  Future<List<WordModel2>> getWords() async {
    try {
      final url =
          '${_baseUrl}databases/${id}/query';
      final response = await _client.post(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader:
          'Bearer ${apiKey}',
          'Notion-Version': '2022-02-22',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return (data['results'] as List)
            .map((e) => WordModel2.fromMap(e))
            .toList();
        //..sort((a, b) => b.date.compareTo(a.date));
      } else {
        throw const Failure(message: 'Something went wrong!');
      }
    } catch (_) {
      throw const Failure(message: 'Something went wrong!');
    }
  }
}
