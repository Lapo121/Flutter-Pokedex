import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:pokedex/screen/home_page.dart';

List<Pokemon> pokemon = [];
Color? _color({required String type}) {
  switch (type) {
    case 'normal':
      return const Color.fromARGB(122, 141, 149, 157);
    case 'fire':
      return const Color.fromARGB(255, 249, 151, 79);
    case 'water':
      return const Color.fromARGB(255, 75, 139, 207);
    case 'grass':
      return const Color.fromARGB(255, 93, 180, 85);
    case 'electric':
      return const Color.fromARGB(255, 238, 204, 56);
    case 'ice':
      return const Color.fromARGB(255, 109, 200, 185);
    case 'fighting':
      return const Color.fromARGB(255, 206, 66, 107);
    case 'poison':
      return const Color.fromARGB(255, 165, 102, 197);
    case 'ground':
      return const Color.fromARGB(255, 212, 116, 64);
    case 'flying':
      return const Color.fromARGB(255, 135, 162, 217);
    case 'psychic':
      return const Color.fromARGB(255, 239, 104, 110);
    case 'bug':
      return const Color.fromARGB(255, 141, 187, 43);
    case 'rock':
      return const Color.fromARGB(255, 191, 177, 133);
    case 'ghost':
      return const Color.fromARGB(255, 78, 101, 168);
    case 'dark':
      return const Color.fromARGB(255, 84, 77, 95);
    case 'dragon':
      return const Color.fromARGB(255, 10, 105, 187);
    case 'steel':
      return const Color.fromARGB(255, 83, 134, 153);
    case 'fairy':
      return const Color.fromARGB(255, 228, 134, 223);
    default:
      return Colors.grey;
  }
}

void main() async {
  for (var i = 1; i <= 870; i++) {
    List<String> types = [];
    print(i);
    var url = Uri.parse("https://pokeapi.co/api/v2/pokemon/$i");
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body) as Map<String, dynamic>;
    try {
      pokemon.add(Pokemon(
        name: json["name"],
        types: [
          json["types"][0]["type"]["name"],
          json["types"][1]["type"]["name"]
        ],
        sprite: json["sprites"]["front_default"],
        colorTypes1: _color(type: json["types"][0]["type"]["name"]),
        colorTypes2: _color(type: json["types"][1]["type"]["name"]),
      ));
    } catch (e) {
      pokemon.add(Pokemon(
        name: json["name"],
        types: [
          json["types"][0]["type"]["name"],
          json["types"][0]["type"]["name"]
        ],
        sprite: json["sprites"]["front_default"],
        colorTypes1: _color(type: json["types"][0]["type"]["name"]),
        colorTypes2: _color(type: json["types"][0]["type"]["name"]),
      ));
    }
  }

  runApp(const PokedexApp());
}

class PokedexApp extends StatefulWidget {
  const PokedexApp({super.key});

  @override
  State<PokedexApp> createState() => _PokedexAppState();
}

class _PokedexAppState extends State<PokedexApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pokedex",
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text("Pokedex"),
          ),
          body: ListView.builder(
            itemCount: pokemon.length,
            itemBuilder: (context, index) {
              return pokemon[index];
            },
          ),
        ),
      ),
    );
  }
}


/*





*/