import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import'pokemon_list_screen.dart';
void main() async {
  await Hive.initFlutter();
  await Hive.openBox('favorites');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokemonListScreen(),
    );
  }
}
