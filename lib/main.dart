import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(const PokedexApp());
}

class PokedexApp extends StatefulWidget {
  const PokedexApp({super.key});

  @override
  State<PokedexApp> createState() => _PokedexAppState();
}

class _PokedexAppState extends State<PokedexApp> {
  int contatore = 1;
  Color color1 = Colors.red, color2 = Colors.red;
  List<String> pokemon = [
    "Bulbasaur",
    "Ivysaur",
    "Venusaur",
    "Charmander",
    "Charmeleon",
    "Charizard",
    "Squirtle",
    "Wartortle",
    "Blastoise",
    "Caterpie",
    "Metapod",
    "Butterfree",
    "Weedle",
    "Kakuna",
    "Beedrill",
    "Pidgey",
    "Pidgeotto",
    "Pidgeot",
    "Rattata",
    "Raticate",
    "Spearow",
    "Fearow",
    "Ekans",
    "Arbok",
    "Pikachu",
    "Raichu",
    "Sandshrew",
    "Sandslash",
    "Nidoran♀",
    "Nidorina",
    "Nidoqueen",
    "Nidoran♂",
    "Nidorino",
    "Nidoking",
    "Clefairy",
    "Clefable",
    "Vulpix",
    "Ninetales",
    "Jigglypuff",
    "Wigglytuff",
    "Zubat",
    "Golbat",
    "Oddish",
    "Gloom",
    "Vileplume",
    "Paras",
    "Parasect",
    "Venonat",
    "Venomoth",
    "Diglett",
    "Dugtrio",
    "Meowth",
    "Persian",
    "Psyduck",
    "Golduck",
    "Mankey",
    "Primeape",
    "Growlithe",
    "Arcanine",
    "Poliwag",
    "Poliwhirl",
    "Poliwrath",
    "Abra",
    "Kadabra",
    "Alakazam",
    "Machop",
    "Machoke",
    "Machamp",
    "Bellsprout",
    "Weepinbell",
    "Victreebel",
    "Tentacool",
    "Tentacruel",
    "Geodude",
    "Graveler",
    "Golem",
    "Ponyta",
    "Rapidash",
    "Slowpoke",
    "Slowbro",
    "Magnemite",
    "Magneton",
    "Farfetch'd",
    "Doduo",
    "Dodrio",
    "Seel",
    "Dewgong",
    "Grimer",
    "Muk",
    "Shellder",
    "Cloyster",
    "Gastly",
    "Haunter",
    "Gengar",
    "Onix",
    "Drowzee",
    "Hypno",
    "Krabby",
    "Kingler",
    "Voltorb",
    "Electrode",
    "Exeggcute",
    "Exeggutor",
    "Cubone",
    "Marowak",
    "Hitmonlee",
    "Hitmonchan",
    "Lickitung",
    "Koffing",
    "Weezing",
    "Rhyhorn",
    "Rhydon",
    "Chansey",
    "Tangela",
    "Kangaskhan",
    "Horsea",
    "Seadra",
    "Goldeen",
    "Seaking",
    "Staryu",
    "Starmie",
    "Mr. Mime",
    "Scyther",
    "Jynx",
    "Electabuzz",
    "Magmar",
    "Pinsir",
    "Tauros",
    "Magikarp",
    "Gyarados",
    "Lapras",
    "Ditto",
    "Eevee",
    "Vaporeon",
    "Jolteon",
    "Flareon",
    "Porygon",
    "Omanyte",
    "Omastar",
    "Kabuto",
    "Kabutops",
    "Aerodactyl",
    "Snorlax",
    "Articuno",
    "Zapdos",
    "Moltres",
    "Dratini",
    "Dragonair",
    "Dragonite",
    "Mewtwo",
    "Mew"
  ];
  Map<String, dynamic> pokemonData = {
    "name": "",
    "sprite": "",
    "type1": "",
    "type2": null,
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pokedex",
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          body: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: 151,
                  itemBuilder: (BuildContext context, int index) {
                    getPokemonData(pokemon[contatore].toLowerCase());
                    contatore++;
                    return Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            color1,
                            color2,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(pokemonData["name"]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setColorForType() {
    switch (pokemonData["type1"]) {
      case 'normal':
        color1 = Colors.brown[400]!;
        break;
      case 'fire':
        color1 = Colors.red;
        break;
      case 'water':
        color1 = Colors.blue;
        break;
      case 'grass':
        color1 = Colors.green;
        break;
      case 'electric':
        color1 = Colors.amber;
        break;
      case 'ice':
        color1 = Colors.cyanAccent[400]!;
        break;
      case 'fighting':
        color1 = Colors.orange;
        break;
      case 'poison':
        color1 = Colors.purple;
        break;
      case 'ground':
        color1 = Colors.orange[300]!;
        break;
      case 'flying':
        color1 = Colors.indigo[200]!;
        break;
      case 'psychic':
        color1 = Colors.pink;
        break;
      case 'bug':
        color1 = Colors.lightGreen[500]!;
        break;
      case 'rock':
        color1 = Colors.grey;
        break;
      case 'ghost':
        color1 = Colors.indigo[400]!;
        break;
      case 'dark':
        color1 = Colors.brown;
        break;
      case 'dragon':
        color1 = Colors.indigo[800]!;
        break;
      case 'steel':
        color1 = Colors.blueGrey;
        break;
      case 'fairy':
        color1 = Colors.pinkAccent[100]!;
        break;
    }

    if (pokemonData["type2"] == null) {
      color2 = color1;
      return;
    }

    switch (pokemonData["type2"]) {
      case 'normal':
        color2 = Colors.brown[400]!;
        break;
      case 'fire':
        color2 = Colors.red;
        break;
      case 'water':
        color2 = Colors.blue;
        break;
      case 'grass':
        color2 = Colors.green;
        break;
      case 'electric':
        color2 = Colors.amber;
        break;
      case 'ice':
        color2 = Colors.cyanAccent[400]!;
        break;
      case 'fighting':
        color2 = Colors.orange;
        break;
      case 'poison':
        color2 = Colors.purple;
        break;
      case 'ground':
        color2 = Colors.orange[300]!;
        break;
      case 'flying':
        color2 = Colors.indigo[200]!;
        break;
      case 'psychic':
        color2 = Colors.pink;
        break;
      case 'bug':
        color2 = Colors.lightGreen[500]!;
        break;
      case 'rock':
        color2 = Colors.grey;
        break;
      case 'ghost':
        color2 = Colors.indigo[400]!;
        break;
      case 'dark':
        color2 = Colors.brown;
        break;
      case 'dragon':
        color2 = Colors.indigo[800]!;
        break;
      case 'steel':
        color2 = Colors.blueGrey;
        break;
      case 'fairy':
        color2 = Colors.pinkAccent[100]!;
        break;
    }
  }

  void getPokemonData(String nome_pokemon) async {
    var url = Uri.https("pokeapi.co", "/api/v2/pokemon/$nome_pokemon");
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body) as Map<String, dynamic>;
    setState(
      () => {
        pokemonData.update("name", (value) => json["name"]),
        pokemonData.update(
            "sprite", (value) => json["sprites"]["front_default"]),
        pokemonData.update(
            "type1", (value) => json["types"][0]["type"]["name"]),
      },
    );
    try {
      pokemonData.update("type2", (value) => json["types"][1]["type"]["name"]);
    } catch (e) {
      pokemonData.update("type2", (value) => null);
    }
    setColorForType();
  }
}

/*
Flexible(
                child: ListView.builder(
                  itemCount: contatore,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: double.infinity,
                      height: 70,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [],
                        ),
                      ),
                    );
                  },
                ),
              ),




*/
