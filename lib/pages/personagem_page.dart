import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/dados_personagem.dart';
import 'package:flutter_application_1/network/api_provider_star_wars.dart';
import '../network/api_provider_star_wars.dart';

class Personagem extends StatefulWidget {
  const Personagem({Key? key, required this.personagem}) : super(key: key);
  final DadosPersonagem personagem;
  @override
  State<Personagem> createState() => _PersonagemState(personagem: personagem);

  // final DadosPersonagem personagem;
  //  Personagem(this.personagem);

  // @override
  // State<Personagem> createState() => _PersonagemState();
}

class _PersonagemState extends State<Personagem> {
  _PersonagemState({required this.personagem});
  final DadosPersonagem personagem;
  Future<List<DadosPersonagem>>? futureData;
  // Future<List<DadosPersonagem>>? futureData;

  @override
  void initState() {
    super.initState();
    futureData = _buscarPersonagens();
  }

  final TextEditingController _controllerUsuario = TextEditingController();
  DadosPersonagem dadosPersonagem =
      DadosPersonagem(nome: "", altura: "", massa: "", anoNascimento: "");

  final estiloPadrao =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  final Function _buscarPersonagens = ApiProviderStarWars().buscarPersonagens;

  @override
  void dispose() {
    _controllerUsuario.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Personagem Extra Page')),
        backgroundColor: const Color.fromRGBO(236, 79, 79, 1),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text('Nome: ${widget.personagem.nome}',
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.bold))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text('Altura: ${widget.personagem.altura}',
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.bold))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text('Massa: ${widget.personagem.massa}',
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.bold))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                      'Ano de nascimento: ${widget.personagem.anoNascimento}',
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.bold))),
            ),
          ],
        ),
      )),
    );
  }
}
