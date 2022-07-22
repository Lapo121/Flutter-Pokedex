import 'package:flutter/material.dart';

import '../widget/pokemonTypeContainer.dart';

// ignore: must_be_immutable
class PokemonInfo extends StatefulWidget {
  String name, spriteFront, spriteBack, spriteFrontShiny, spriteBackShiny, id;
  List<String> types;
  Color? colorTypes1, colorTypes2, colorContainer;
  PokemonInfo({
    super.key,
    required this.name,
    required this.id,
    required this.spriteFront,
    required this.spriteBack,
    required this.spriteFrontShiny,
    required this.spriteBackShiny,
    required this.types,
    required this.colorTypes1,
    required this.colorTypes2,
    required this.colorContainer,
  });

  @override
  State<PokemonInfo> createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title:
                Text(widget.name[0].toUpperCase() + widget.name.substring(1)),
            centerTitle: true,
          ),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 310,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          widget.colorTypes1 as Color,
                          widget.colorTypes2 as Color,
                        ],
                      ),
                    ),
                    margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "#${widget.id} ${widget.name.toUpperCase()}",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 160,
                          child: Center(
                            child: Container(
                              width: 160,
                              height: 160,
                              decoration: BoxDecoration(
                                color: Colors.grey[350],
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: Image.network(
                                widget.spriteFront,
                                height: 160,
                                width: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: widget.colorContainer,
                    ),
                    margin: const EdgeInsets.only(
                      top: 20,
                      left: 10,
                      right: 10,
                      bottom: 20,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 70,
                          width: double.infinity,
                          child: Center(
                            child: Text("Front Normal and Shiny Sprite"),
                          ),
                        ),
                        SizedBox(
                          height: 180,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 140,
                                width: 140,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[350],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Image.network(
                                  widget.spriteFront,
                                  height: 160,
                                  width: 160,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                height: 140,
                                width: 140,
                                margin: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[350],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Image.network(
                                  widget.spriteFrontShiny,
                                  height: 160,
                                  width: 160,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                          width: double.infinity,
                          child: Center(
                            child: Text("Back Normal and Shiny Sprite"),
                          ),
                        ),
                        SizedBox(
                          height: 180,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 140,
                                width: 140,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[350],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Image.network(
                                  widget.spriteBack,
                                  height: 160,
                                  width: 160,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                height: 140,
                                width: 140,
                                margin: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[350],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Image.network(
                                  widget.spriteBackShiny,
                                  height: 160,
                                  width: 160,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
