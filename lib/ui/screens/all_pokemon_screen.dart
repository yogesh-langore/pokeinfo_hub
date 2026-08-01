import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeinfo_hub/model/pokemon.dart';
import 'package:pokeinfo_hub/providers/pokemon_future_provider.dart';
import 'package:pokeinfo_hub/theme/theme_provider.dart';
import 'package:pokeinfo_hub/ui/screens/fav_pokemon_screen.dart';
import 'package:pokeinfo_hub/ui/screens/pokemon_detail_screen.dart';
import 'package:pokeinfo_hub/utils/helpers.dart';
import 'package:pokeinfo_hub/ui/widgets/pokemon_search_delegate.dart';

class AllPokemon extends ConsumerStatefulWidget {
  const AllPokemon({super.key});

  @override
  ConsumerState<AllPokemon> createState() => _AllPokemonState();
}

class _AllPokemonState extends ConsumerState<AllPokemon> {
  String? selectedType;

  final List<Map<String, dynamic>> pokemonTypes = [
    {"label": "Fire", "color": Colors.red},
    {"label": "Water", "color": Colors.blue},
    {"label": "Grass", "color": Colors.green},
    {"label": "Electric", "color": Colors.amber},
    {"label": "Poison", "color": Colors.deepPurple},
    {"label": "Ground", "color": Colors.brown},
    {"label": "Fighting", "color": Colors.orange},
    {"label": "Rock", "color": Colors.grey},
  ];

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Pokemon>> pokemonData = ref.watch(
      pokemonFutureProvider,
    );

    return pokemonData.when(
      data: (pokemonList) {
        List<Pokemon> filteredPokemon = selectedType == null
            ? pokemonList
            : pokemonList.where((pokemon) {
                return pokemon.typeofpokemon!.contains(selectedType);
              }).toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text('PokeInfo_Hub'),
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: PokemonSearchDelegate(pokemonList),
                  );
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const FavPokemonScreen()),
                  );
                },
                icon: const Icon(Icons.favorite),
              ),
              IconButton(
                onPressed: () {
                  ref.read(themeProvider.notifier).toggleTheme();
                },
                icon: const Icon(Icons.lightbulb),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemCount: pokemonTypes.length,
                    itemBuilder: (context, index) {
                      final type = pokemonTypes[index];

                      final bool isSelected = selectedType == type["label"];

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedType == type["label"]) {
                              selectedType = null;
                            } else {
                              selectedType = type["label"];
                            }
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: type["color"],
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              type["label"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 12),

                Expanded(
                  child: GridView.builder(
                    itemCount: filteredPokemon.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                    itemBuilder: (context, index) {
                      final pokemon = filteredPokemon[index];

                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  PokemonDetailScreen(pokemon: pokemon),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Helpers.getPokemonCardColour(
                              pokemonType: pokemon.typeofpokemon!.first,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 2,
                                right: 2,
                                child: Image.asset(
                                  'images/pokeball.png',
                                  width: 175,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),

                              Positioned(
                                bottom: 2,
                                right: 2,
                                child: Hero(
                                  tag: pokemon.id!,
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        ),
                                    imageUrl: pokemon.imageurl!,
                                    width: 150,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),

                              Positioned(
                                top: 10,
                                left: 10,
                                child: Text(
                                  pokemon.name!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              Positioned(
                                top: 40,
                                left: 10,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.35),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    pokemon.typeofpokemon!.first,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(
          body: Center(
            child: Text(
              'Failed to load data\n$error',
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
      loading: () {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
