import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:pokeinfo_hub/model/pokemon.dart';

class HiveRepo {
  final pokeboxName = 'pokebox';
  void registerAdapter() {
    Hive.registerAdapter(PokemonAdapter());
  }

  Future addPokemonToHive(Pokemon pokemon) async {
    final pokeBox = await Hive.openBox<Pokemon>(pokeboxName);
    await pokeBox.put(pokemon.id, pokemon);
    log('Pokemon added to Hive ${pokemon.name}');
  }

  Future<List<Pokemon>> getAllFavPokemonFromHive() async {
    final pokeBox = await Hive.openBox<Pokemon>(pokeboxName);
    if (pokeBox.isOpen) {
      return pokeBox.values.toList();
    } else {
      return [];
    }
  }

  Future deletePokemonFromHive(String id) async {
    final pokeBox = await Hive.openBox<Pokemon>(pokeboxName);
    await pokeBox.delete(id);
  }
}
