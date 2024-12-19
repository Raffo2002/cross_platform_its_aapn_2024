import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/api/http_client.g.dart';
import 'package:pokedex/api/models/details.dart';

class PokemonApi {
  static const _baseUrl = 'https://pokeapi.co/api/v2';

  /// Fetch the list of Pokémon snippets.
  Future<List<PokemonSnippet>> fetchPokemonList() async {
    final response = await http.get(Uri.parse('$_baseUrl/pokemon?limit=10000'));

    if (response.statusCode != 200) {
      throw Exception('Failed to load Pokémon list');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final results = data['results'] as List;

    return results.map((entry) {
      final url = entry['url'] as String;
      final split = url.split('/');
      final id = int.parse(split[split.length - 2]); // Extract ID from URL.
      return PokemonSnippet(id: id, name: entry['name']);
    }).toList();
  }

  /// Fetch the details of a specific Pokémon.
Future <PokemonDetails> fetchPokemonDetails({required String name, required double height, required String imageUrl, required double weight, required int id}) async {
  final response = await http.get(Uri.parse('$_baseUrl/pokemon/$id'));

  if (response.statusCode != 200) {
    throw Exception('Failed to load Pokémon details');
  }

  final data = jsonDecode(response.body) as Map<String, dynamic>;
  return fetchPokemonDetails (
    id: data['id'] as int,
    name: data['name'] as String,
    imageUrl: data['sprites']['front_default'] as String,
    height: (data['height'] as num) / 10.0, // Convert decimeters to meters.
    weight: (data['weight'] as num) / 10.0, // Convert hectograms to kilograms.
  );
}

}
