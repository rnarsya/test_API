import 'dart:convert';
import 'package:http/http.dart' as http;

import 'character_model.dart';

class ApiDataSource {
  static const String baseUrl = 'https://hp-api.onrender.com/api';

  Future<List<CharactersHP>> fetchCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl/characters'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => CharactersHP.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }

  Future<CharactersHP> fetchCharacterDetail(String characterId) async {
    final response = await http.get(Uri.parse('$baseUrl/characters/$characterId'));

    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      return CharactersHP.fromJson(data);
    } else {
      throw Exception('Failed to load character details');
    }
  }
}
