import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonService {
  final String apiUrl = 'https://pokeapi.co/api/v2/pokemon?limit=100';

  Future<List<dynamic>> fetchPokemonList() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }
}
