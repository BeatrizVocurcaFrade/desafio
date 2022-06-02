import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/dados_personagem.dart';
import 'package:flutter_application_1/network/api_provider_star_wars.dart';
import '../network/api_provider_star_wars.dart';
import './personagem_page.dart';

class Lista extends StatefulWidget {
  
  const Lista({Key? key, required this.futureData}) : super(key: key);
  final Future<List<DadosPersonagem>>? futureData;
  @override
  State<Lista> createState() => _ListaState(futureData: futureData);
}

class _ListaState extends State<Lista> {
  _ListaState({required this.futureData});
  final Future<List<DadosPersonagem>>? futureData;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DadosPersonagem>>(
        future: widget.futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DadosPersonagem> data = snapshot.data!;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 70,
                      child: Card(
                          elevation: 5,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 280,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    data[index].nome,
                                    style: const TextStyle(fontSize: 19),
                                  ),
                                ),
                              ),
                              IconButton(
                                color: Colors.red,
                                padding: const EdgeInsets.only(left: 57),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Personagem(personagem: data[index])));
                                },
                                icon: const Icon(
                                  Icons.info,
                                  size: 30,
                                ),
                              ),
                            ],
                          )),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Text("Lista ainda não foi achada...");
        });
  }
}

class Desafio extends StatefulWidget {
  const Desafio({Key? key}) : super(key: key);

  @override
  State<Desafio> createState() => _DesafioState();
}

class _DesafioState extends State<Desafio> {
  Future<List<DadosPersonagem>>? futureData;
  List<DadosPersonagem>? filteredList;
  List<DadosPersonagem>? list;

  final TextEditingController _controllerPersonagem = TextEditingController();
  @override
  void initState() {
    super.initState();
    futureData = _buscarPersonagens();
  }

  DadosPersonagem dadosPersonagem =
      DadosPersonagem(nome: "", altura: "", massa: "", anoNascimento: "");

  final Function _buscarPersonagens = ApiProviderStarWars().buscarPersonagens;

  void filtraLista() async {
    // return futureData;
    if (_controllerPersonagem.text != "") {
      list = await futureData;
      filteredList = list!
          .where((pers) =>
              pers.nome.toLowerCase().contains(_controllerPersonagem.text.toLowerCase()))
          .toList();
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controllerPersonagem.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Desafio Extra Page')),
        backgroundColor: const Color.fromRGBO(236, 79, 79, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  SizedBox(
                      width: 318,
                      child: TextFormField(
                        controller: _controllerPersonagem,
                        keyboardType: TextInputType.name,
                        onChanged: (_) {
                          if (_controllerPersonagem.text == "") {
                            setState(() {});
                          }
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Adicionar"),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: IconButton(
                          padding:
                              const EdgeInsets.only(right: 0.001, bottom: 0.01),
                          onPressed: () async {
                            filtraLista();
                            // print('${_controllerPersonagem.text} aaassdfddf');
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 40,
                          )),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
                height: 500,
                child: (_controllerPersonagem.text == "")
                    ? Lista(futureData: futureData)
                    : ListView.builder(
                        itemCount: filteredList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              height: 70,
                              child: Card(
                                  elevation: 5,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 280,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Text(
                                            filteredList![index].nome,
                                            style:
                                                const TextStyle(fontSize: 19),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        color: Colors.red,
                                        padding: const EdgeInsets.only(left: 57),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          Personagem(personagem:
                                                              filteredList![
                                                                  index])));
                                        },
                                        icon: const Icon(
                                          Icons.info,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        })),
          ],
        ),
      ),
    );
  }
}
