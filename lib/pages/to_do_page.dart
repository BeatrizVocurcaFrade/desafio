import 'dart:math';

import 'package:flutter/material.dart';
import '../model/to_do.dart';

class TodolistPage extends StatefulWidget {
  const TodolistPage({Key? key}) : super(key: key);

  @override
  State<TodolistPage> createState() => _TodolistPageState();
}

class _TodolistPageState extends State<TodolistPage> {
  final descricaoController = TextEditingController();
  List<ToDo> listDeTarefas = [];

  void adicionarNovaTarefa() {
    bool igual = false;
    listDeTarefas.forEach((element) {
      if (descricaoController.text.toLowerCase() == element.name?.toLowerCase()) {
        igual = true;
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Alerta'),
            content: const Text('Não é possível adicionar duas tarefas iguais'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancelar'),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        
      }
    });
    if(igual) return;
    ToDo tarefa = ToDo(
      name: descricaoController.text,
      id: Random().nextInt(100).toString(),
      status: true,
    );
    if (descricaoController.text != '') {
      listDeTarefas.add(tarefa);
    }
    setState(() {});
  }

  void deletaTarefa(String index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("To do list")),
        backgroundColor: const Color.fromRGBO(236, 79, 79, 1),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                height: 80,
                width: 320,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    controller: descricaoController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Adicionar"),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  adicionarNovaTarefa();
                },
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ],
          ),
          Container(
            height: 10,
          ),
          SizedBox(
            height: 500,
            child: ListView.builder(
                itemCount: listDeTarefas.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      height: 70,
                      child: Card(
                          elevation: 3,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 280,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    "${listDeTarefas[index].name}",
                                    style: const TextStyle(fontSize: 19),
                                  ),
                                ),
                              ),
                              IconButton(
                                color: listDeTarefas[index].status!
                                    ? Colors.red
                                    : Colors.green,
                                onPressed: () {
                                  setState(() {
                                    if (listDeTarefas[index].status == true) {
                                      listDeTarefas[index].status = false;
                                    } else {
                                      listDeTarefas[index].status = true;
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.check_circle,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    listDeTarefas.removeWhere((tarefa) =>
                                        tarefa.id ==
                                        listDeTarefas[index].id.toString());
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          )),
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
