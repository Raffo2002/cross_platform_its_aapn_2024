import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/api/api.dart';
import 'package:pokedex/api/http_client.g.dart';

final pokemonListProvider = FutureProvider<List<PokemonSnippet>>((ref) async {
  final api = PokemonApi();
  return api.fetchPokemonList();
});
