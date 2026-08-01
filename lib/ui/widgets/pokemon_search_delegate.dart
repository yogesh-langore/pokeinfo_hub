import 'package:flutter/material.dart';
import 'package:pokeinfo_hub/model/pokemon.dart';
import 'package:pokeinfo_hub/ui/screens/pokemon_detail_screen.dart';

class PokemonSearchDelegate extends SearchDelegate {
  final List<Pokemon> pokemonList;

  PokemonSearchDelegate(this.pokemonList);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = pokemonList.where((pokemon) {
      return pokemon.name!
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();

    if (results.isEmpty) {
      return const Center(
        child: Text(
          'No Pokémon Found',
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final pokemon = results[index];

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(pokemon.imageurl!),
          ),
          title: Text(pokemon.name!),
          subtitle: Text(
            pokemon.typeofpokemon!.join(', '),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PokemonDetailScreen(
                  pokemon: pokemon,
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = pokemonList.where((pokemon) {
      return pokemon.name!
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final pokemon = suggestions[index];

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(pokemon.imageurl!),
          ),
          title: Text(pokemon.name!),
          subtitle: Text(
            pokemon.typeofpokemon!.join(', '),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PokemonDetailScreen(
                  pokemon: pokemon,
                ),
              ),
            );
          },
        );
      },
    );
  }
}