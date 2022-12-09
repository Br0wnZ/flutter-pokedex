import 'package:dio/dio.dart';
import 'package:my_app/models/pokemon_llist_response_model.dart';

class PokedexService {
  final _dio = Dio();
  String url = 'https://pokeapi.co/api/v2/pokemon?limit=50&offset=0';
  Future<dynamic> getPokemonsList() async {
    try {
      final Response response = await _dio.get(url);
      final PokemonListResponse pokemonListResponse =
          PokemonListResponse.fromJson(response.data);
      final List<Pokemon> pokemonList = pokemonListResponse.results!;
      return pokemonList;
    } catch (e) {
      print(e);
    }
  }
}
