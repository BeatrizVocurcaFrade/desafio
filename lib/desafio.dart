import 'package:flutter/material.dart';

class Desafio extends StatefulWidget {
  const Desafio({Key? key}) : super(key: key);

  @override
  State<Desafio> createState() => _DesafioState();
}

class _DesafioState extends State<Desafio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio'),
        backgroundColor: const Color.fromRGBO(236, 79, 79, 1),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                child: Image.network("https://avatars.githubusercontent.com/u/71016898?v=4"),
              ),
              const Text('Usuario: Beatriz'),
              const Text('Usuario: Beatriz'),
              const Text('Usuario: Beatriz'),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
