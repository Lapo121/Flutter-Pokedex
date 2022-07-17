import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Pokemon {}

final Map<String, String> pokemonData = {
  "name": "",
};

void getPokemonData(int numero_pokemon) async {
  var url = Uri.https("pokeapi.co", "/api/v2/pokemon/1");
  var response = await http.get(url);
  var json = convert.jsonDecode(response.body) as Map<String, dynamic>;
}

void main() {
  //print(pokemonData);
  print(getPokemonData(3));
}

//Future<Map<String, dynamic>>