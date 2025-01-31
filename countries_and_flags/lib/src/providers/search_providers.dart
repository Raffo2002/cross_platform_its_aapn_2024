import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


@riverpod
FutureOr<List<CharacterModel>> search(Ref ref, String? query) async {
  final api = ref.watch(CountriesAndFlagsApi.provider);
  final filtersNotifierProvider = Provider<FilterModel>((ref) => FilterModel('defaultName', 'defaultCca2'));
  final FilterModel filter = ref.watch(filtersNotifierProvider);
  final name = filter.name;
  final cca2 = filter.cca2;

  final queryParams = {
    if (query != null) 'flags': query,
    'name': name.name,
    'cca2': cca2.cca2,
  };
  final result = await api.list(queryParams);
  return result.results;
}

extension on String {
  get name => null;
  
  get cca2 => null;
}

class FilterModel {
  final String name;
  final String cca2;

  FilterModel(this.name, this.cca2);
}

class CountriesAndFlagsApi {
  final String baseUrl;
  final Client client;
  
  static ProviderListenable provider = Provider((ref) => CountriesAndFlagsApi('https://restcountries.com/v3.1/', Client()));

  CountriesAndFlagsApi(this.baseUrl, this.client);

  Future<ApiResponse> list(Map<String, String> queryParams) async {
    final response = await client.get(
      Uri.parse('$baseUrl/character'),
      queryParams,
    );
    return ApiResponse.fromJson(response.body);
  }
}

class Client {
  get(Uri parse, Map<String, String> queryParams) {}
}

class ApiResponse {
  final List<CharacterModel> results;

  ApiResponse(this.results);

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List;
    return ApiResponse(
      results.map((e) => CharacterModel.fromJson(e)).toList(),
    );
  }
}

class CharacterModel {
  final String name;
  final String cca2;

  CharacterModel(this.name, this.cca2);

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      json['name'] as String,
      json['cca2'] as String,
    );
  }
}