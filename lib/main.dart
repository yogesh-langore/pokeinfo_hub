import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokeinfo_hub/repo/hive_repo.dart';
import 'package:pokeinfo_hub/theme/app_theme.dart';
import 'package:pokeinfo_hub/theme/theme_provider.dart';
import 'package:pokeinfo_hub/ui/screens/all_pokemon_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  HiveRepo().registerAdapter();
  runApp(
    const ProviderScope(
      child: Pokedex(),
    ),
  );
}

class Pokedex extends ConsumerWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDark = ref.watch(themeProvider);
    return MaterialApp(
      home: const AllPokemon(),
      theme: AppTheme.themeData(isDark: isDark),
    );
  }
}
