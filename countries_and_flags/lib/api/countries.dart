import 'package:countries_and_flags/api/http_client_provider.dart';
import 'package:countries_and_flags/countries_and_flags.dart';
import 'package:countries_and_flags/src/providers/search_providers.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
RickAndMortyApi rickAndMortyApi(CountriesAndFlags ref) {
  final client = ref.watch(httpClientProvider);
  return RickAndMortyApi(client);
}

class RickAndMortyApi {
  const RickAndMortyApi(this.client);
  final Dio client;

  Future<CharactersResponseModel> list(
    Map<String, dynamic>? queryParameters,
  ) async {
    final response = await client.get(
      '/character',
      queryParameters: queryParameters,
    );
    return CharactersResponseModel.fromJson(response.data);
  }
}

class CharactersResponseModel { 
  final List<CharacterModel> results;

  CharactersResponseModel(this.results);

  factory CharactersResponseModel.fromJson(Map<String, dynamic> json) {
    final results = List<Map<String, dynamic>>.from(json['results']);
    return CharactersResponseModel(
      results.map((e) => CharacterModel.fromJson(e)).toList(),
    );
  }
}
