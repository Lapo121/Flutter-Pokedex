import 'package:flutter/material.dart';
import 'package:pokedex/widget/pokemonTypeContainer.dart';

class Pokemon extends StatefulWidget {
  String name;
  List<String> types;
  String sprite;
  Color? colorTypes1;
  Color? colorTypes2;

  Pokemon({
    super.key,
    required this.name,
    required this.types,
    required this.sprite,
    required this.colorTypes1,
    required this.colorTypes2,
  });

  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            widget.colorTypes1 as Color,
            widget.colorTypes2 as Color,
          ],
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  width: 240,
                  child: Center(
                    child: Text(widget.name.toUpperCase()),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 240,
                  child: Row(
                    children: [
                      PokemontypeContainer(
                        tipoPokemon: widget.types[0],
                        containerColor: widget.colorTypes1,
                      ),
                      widget.colorTypes1 != widget.colorTypes2
                          ? PokemontypeContainer(
                              tipoPokemon: widget.types[1],
                              containerColor: widget.colorTypes2,
                            )
                          : const Text(""),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
            ),
            child: Image.network(widget.sprite),
          ),
        ],
      ),
    );
  }
}
