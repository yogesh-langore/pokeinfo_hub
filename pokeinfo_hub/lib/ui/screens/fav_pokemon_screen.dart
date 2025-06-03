import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokeinfo_hub/model/pokemon.dart';
import 'package:pokeinfo_hub/repo/hive_repo.dart';
import 'package:pokeinfo_hub/ui/screens/pokemon_detail_screen.dart';
import 'package:pokeinfo_hub/utils/helpers.dart';


class FavPokemonScreen extends StatefulWidget {
  const FavPokemonScreen({super.key});

  @override
  State<FavPokemonScreen> createState() => _FavPokemonScreenState();
}

class _FavPokemonScreenState extends State<FavPokemonScreen> {
  List<Pokemon> favPokemon = [];
  final HiveRepo hiveRepo = HiveRepo();

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      favPokemon = await hiveRepo.getAllFavPokemonFromHive();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Fav Pokemon'),
              expandedTitleScale: 1.5,
              background: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/International_Pok%C3%A9mon_logo.svg/800px-International_Pok%C3%A9mon_logo.svg.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          favPokemon.isNotEmpty
              ? SliverList.builder(
                  itemCount: favPokemon.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => PokemonDetailScreen(
                                pokemon: favPokemon[index])));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 5.0, bottom: 5.0),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Helpers.getPokemonCardColour(
                                pokemonType:
                                    favPokemon[index].typeofpokemon!.first),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              CachedNetworkImage(
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                                imageUrl: favPokemon[index].imageurl!,
                                width: 75,
                                fit: BoxFit.fitWidth,
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    favPokemon[index].name!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    favPokemon[index].typeofpokemon!.first,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  HiveRepo().deletePokemonFromHive(
                                      favPokemon[index].id!);
                                  favPokemon.removeAt(index);
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : SliverToBoxAdapter(
                  child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      child: const CircularProgressIndicator()),
                ),
        ],
      ),
    );
  }
}
