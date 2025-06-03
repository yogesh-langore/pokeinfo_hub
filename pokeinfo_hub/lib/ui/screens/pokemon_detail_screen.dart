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
          pokemonType: pokemon.typeofpokemon!.first),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
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
              onPressed: () {
                hiveRepo.addPokemonToHive(pokemon);
              },
              icon: const Icon(Icons.favorite_border_outlined))
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 150,
            left: width / 2 - 125,
            child: Image.asset(
              const RotatingWidget().toString(),
              width: 250,
              fit: BoxFit.fitWidth,
              color: Colors.white,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -10,
            child: Container(
              width: double.infinity,
              height: height * 0.55,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      pokemon.xdescription!,
                    ),
                    PokemonDetailRow(
                        title: 'Type',
                        value: pokemon.typeofpokemon!.join(', ')),
                    PokemonDetailRow(title: 'Height', value: pokemon.height!),
                    PokemonDetailRow(title: 'Weight', value: pokemon.weight!),
                    PokemonDetailRow(
                        title: 'Speed', value: pokemon.speed!.toString()),
                    PokemonDetailRow(
                        title: 'Attack', value: pokemon.attack!.toString()),
                    PokemonDetailRow(
                        title: 'Special Attack',
                        value: pokemon.special_attack!.toString()),
                    PokemonDetailRow(
                        title: 'Defense', value: pokemon.defense.toString()),
                    PokemonDetailRow(
                        title: 'Weaknesses',
                        value: pokemon.weaknesses!.join(', ')),
                    PokemonDetailRow(
                        title: 'Abilities',
                        value: pokemon.abilities!.join('- ')),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: width / 2 - 125,
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
  const PokemonDetailRow({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          width: width * 0.3,
          child: Text(
            '$title:',
            style: Theme.of(context).textTheme.titleSmall!,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
