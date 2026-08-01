import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokeinfo_hub/model/pokemon.dart';
import 'package:pokeinfo_hub/repo/hive_repo.dart';
import 'package:pokeinfo_hub/ui/widgets/rotating_widget.dart';
import 'package:pokeinfo_hub/utils/helpers.dart';

class PokemonDetailScreen extends StatelessWidget {
  PokemonDetailScreen({super.key, required this.pokemon});

  final Pokemon pokemon;
  final HiveRepo hiveRepo = HiveRepo();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Helpers.getPokemonCardColour(
        pokemonType: pokemon.typeofpokemon!.first,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        title: Text(
          pokemon.name!,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await hiveRepo.addPokemonToHive(pokemon);

              if (!context.mounted) return;

              ScaffoldMessenger.of(context).hideCurrentSnackBar();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${pokemon.name} added to Favorites ❤️'),
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: height * 0.02,
            left: width * 0.06,
            child: const RotatingWidget(),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: height * 0.32,
            child: Container(
              width: double.infinity,
              height: height * 0.72,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),

                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      pokemon.xdescription!,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 18),

                    const Divider(thickness: 1),

                    const SizedBox(height: 15),

                    const Text(
                      "Basic Information",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    PokemonDetailRow(
                      title: 'Type',
                      value: pokemon.typeofpokemon!.join(', '),
                    ),

                    PokemonDetailRow(title: 'Height', value: pokemon.height!),

                    PokemonDetailRow(title: 'Weight', value: pokemon.weight!),

                    const SizedBox(height: 15),

                    const Divider(thickness: 1),

                    const SizedBox(height: 15),

                    const Text(
                      "Battle Stats",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    PokemonDetailRow(
                      title: 'Speed',
                      value: pokemon.speed.toString(),
                    ),

                    PokemonDetailRow(
                      title: 'Attack',
                      value: pokemon.attack.toString(),
                    ),

                    PokemonDetailRow(
                      title: 'Defense',
                      value: pokemon.defense.toString(),
                    ),

                    PokemonDetailRow(
                      title: 'Special Attack',
                      value: pokemon.special_attack.toString(),
                    ),

                    const SizedBox(height: 15),

                    const Divider(thickness: 1),

                    const SizedBox(height: 15),

                    const Text(
                      "Weaknesses",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: pokemon.weaknesses!
                          .map((e) => Chip(label: Text(e)))
                          .toList(),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Abilities",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: pokemon.abilities!
                          .map((e) => Chip(label: Text(e)))
                          .toList(),
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.08,
            left: width * 0.18,
            child: Hero(
              tag: pokemon.id!,
              child: CachedNetworkImage(
                imageUrl: pokemon.imageurl!,
                width: 250,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PokemonDetailRow extends StatelessWidget {
  const PokemonDetailRow({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(value, style: const TextStyle(fontSize: 17)),
          ),
        ],
      ),
    );
  }
}
