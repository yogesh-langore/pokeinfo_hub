import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeinfo_hub/model/pokemon.dart';
import 'package:pokeinfo_hub/repo/pokemon_repo.dart';


final pokemonFutureProvider =
    FutureProvider.autoDispose<List<Pokemon>>((ref) async {
  return await ref.watch(pokemonRepoProvider).getAllPokemon();
});
