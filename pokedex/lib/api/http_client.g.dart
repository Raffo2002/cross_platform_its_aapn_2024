import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_snippet.freezed.dart';
part 'pokemon_snippet.g.dart';

@freezed
class PokemonSnippet with _$PokemonSnippet {
  factory PokemonSnippet({
    required int id,
    required String name,
  }) = _PokemonSnippet;

  factory PokemonSnippet.fromJson(Map<String, dynamic> json) =>
      _$PokemonSnippetFromJson(json);

  get id => null;

  get name => null;
}
