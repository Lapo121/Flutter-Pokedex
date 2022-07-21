import 'package:flutter/material.dart';
import '../model/pokemon.dart';

class PokemonPage extends StatefulWidget {
  List<Pokemon> pokemon;

  PokemonPage({
    super.key,
    required this.pokemon,
  });

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.pokemon.length,
      itemBuilder: (context, index) {
        return widget.pokemon[index];
      },
    );
  }
}
