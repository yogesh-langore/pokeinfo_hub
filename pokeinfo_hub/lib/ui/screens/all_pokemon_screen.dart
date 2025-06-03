import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeinfo_hub/model/pokemon.dart';
import 'package:pokeinfo_hub/providers/pokemon_future_provider.dart';
import 'package:pokeinfo_hub/theme/theme_provider.dart';
import 'package:pokeinfo_hub/ui/screens/fav_pokemon_screen.dart';
import 'package:pokeinfo_hub/ui/screens/pokemon_detail_screen.dart';
import 'package:pokeinfo_hub/utils/helpers.dart';

class AllPokemon extends ConsumerWidget {
  const AllPokemon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Pokemon>> pokemonData =
        ref.watch(pokemonFutureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('PokeInfo_Hub'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const FavPokemonScreen()));
            },
            icon: const Icon(
              Icons.favorite,
            ),
          ),
          IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
            icon: const Icon(
              Icons.lightbulb,
            ),
          ),
        ],
      ),
      body: pokemonData.when(
          data: (pokemonList) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  itemCount: pokemonList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => PokemonDetailScreen(
                                  pokemon: pokemonList[index],
                                )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Helpers.getPokemonCardColour(
                              pokemonType:
                                  pokemonList[index].typeofpokemon!.first),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                                bottom: 10,
                                right: 10,
                                child: Image.asset(
                                  'images/pokeball.png',
                                  width: 150,
                                  fit: BoxFit.fitWidth,
                                )),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Hero(
                                tag: pokemonList[index].id!,
                                child: CachedNetworkImage(
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                  imageUrl: pokemonList[index].imageurl!,
                                  width: 150,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Positioned(
                                left: 20,
                                top: 50,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 7),
                                    child: Text(
                                      pokemonList[index].typeofpokemon!.first,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )),
                            Positioned(
                                top: 20,
                                left: 20,
                                child: Text(
                                  pokemonList[index].name!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  }),
            );
          },
          error: (error, stk) {
            return Center(
              child: Text('Failed to load data $error'),
            );
          },
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
