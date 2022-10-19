import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';
import 'package:flutter_pokedex/common/repositories/pokemon_repositories.dart';
import 'package:flutter_pokedex/features/home/pages/home-error.dart';
import 'package:flutter_pokedex/features/home/pages/home_loading.dart';
import 'package:flutter_pokedex/features/home/pages/home_pages.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key, required this.repository});
  final IPokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return HomeLoading();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomePage(list: snapshot.data!);
          }
          if (snapshot.hasError) {
            return HomeError(error: snapshot.error.toString());
          }

          return Container();
        });
  }
}
