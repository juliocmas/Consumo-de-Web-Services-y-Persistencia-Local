import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'pokemon_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final Box favoritesBox = Hive.box('favorites');

  @override
  Widget build(BuildContext context) {
    final favoritePokemons = favoritesBox.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
      ),
      body: ListView.builder(
        itemCount: favoritePokemons.length,
        itemBuilder: (context, index) {
          final pokemon = favoritePokemons[index];
          return ListTile(
            title: Text(pokemon['name']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PokemonDetailScreen(pokemon: pokemon),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
