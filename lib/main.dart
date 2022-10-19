import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/repositories/pokemon_repositories.dart';
import 'package:flutter_pokedex/container/home_container.dart';

import 'features/home/pages/home_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex Study',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeContainer(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
