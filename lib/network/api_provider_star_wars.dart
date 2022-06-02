import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../model/dados_personagem.dart';

class ApiProviderStarWars {
  ApiProviderStarWars();

  Future<List<DadosPersonagem>> buscarPersonagens() async {
    final response =
        await http.get(Uri.parse('https://swapi.dev/api/people'));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> data = map["results"];
      return data.map((data) => DadosPersonagem.fromJson(data)).toList();
      
    } else {
      return throw Exception('Api vazia!');
    }
  }

  Future<DadosPersonagem> buscarPersonagem(DadosPersonagem personagem, BuildContext context) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Buscando personagem...")));
    final response =
        await http.get(Uri.parse('https://swapi.dev/people/$personagem.id'));

    ScaffoldMessenger.of(context).clearSnackBars();

    if (response.statusCode == 200) {
       final Map<String, dynamic> dados = json.decode(response.body);
      final DadosPersonagem dadosPersonagem = DadosPersonagem.fromJson(dados);
      return dadosPersonagem;
      
    } else {
      return throw Exception('Unexpected error occured!');
    }
  }
}