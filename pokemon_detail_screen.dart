import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class PokemonDetailScreen extends StatelessWidget {
  final dynamic pokemon;
  final Box favoritesBox = Hive.box('favorites');

  PokemonDetailScreen({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final isFavorite = favoritesBox.containsKey(pokemon['name']);

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon['name']),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              if (isFavorite) {
                favoritesBox.delete(pokemon['name']);
              } else {
                favoritesBox.put(pokemon['name'], pokemon);
              }
              (context as Element).markNeedsBuild(); // Force rebuild to update icon
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Detalles de ${pokemon['name']}'),
      ),
    );
  }
}
