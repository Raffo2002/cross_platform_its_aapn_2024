import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/api/api.dart';

final pokemonDetailsProvider =
    FutureProvider.family<PokemonDetails, int>((ref, id) async {
  final api = PokemonApi();
  var height;
  var weight;
  return api.fetchPokemonDetails(
      id: id, name: '', height: height, imageUrl: '', weight:weight);
});

typedef PokemonDetails = ({
  int id,
  String name,
  String imageUrl,
  double height,
  double weight,
});
