import 'package:flutter/material.dart';

class PokemontypeContainer extends StatefulWidget {
  String tipoPokemon;
  Color? containerColor;
  PokemontypeContainer({
    super.key,
    required this.containerColor,
    required this.tipoPokemon,
  });

  @override
  State<PokemontypeContainer> createState() => _PokemontypeContainerState();
}

class _PokemontypeContainerState extends State<PokemontypeContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 100,
      margin: const EdgeInsets.only(left: 10, bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(20),
        color: widget.containerColor,
      ),
      child: Center(
        child: Text(widget.tipoPokemon),
      ),
    );
  }
}
