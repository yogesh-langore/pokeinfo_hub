import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeinfo_hub/model/pokemon.dart';
import 'package:pokeinfo_hub/networking/dio_client.dart';
import 'package:pokeinfo_hub/utils/constants.dart';


class PokemonRepo {
  final Ref ref;
  PokemonRepo(this.ref);

  Future<List<Pokemon>> getAllPokemon() async {
    try {
      final response = await ref.read(dioProvider).get(POKEMON_API_URL);
      if (response.statusCode == 200) {
        final decodecJson = jsonDecode(response.data);
        final List<Pokemon> _pokemonList = decodecJson
            .map<Pokemon>((pokemon) => Pokemon.fromJson(pokemon))
            .toList();
        log(_pokemonList.length.toString());
        return _pokemonList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

final pokemonRepoProvider = Provider<PokemonRepo>((ref) => PokemonRepo(ref));
