// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GitHubPage extends StatefulWidget {
  const GitHubPage({Key? key}) : super(key: key);

  @override
  State<GitHubPage> createState() => _GitHubPageState();
}

Future<Album> fetchAlbum(String name) async {
  final response =
      await http.get(Uri.parse('https://api.github.com/users/ ${name}'));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class _GitHubPageState extends State<GitHubPage> {
  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('GitHubPage')),
        backgroundColor: const Color.fromRGBO(236, 79, 79, 1),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://avatars.githubusercontent.com/u/71016898?v=4"),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(1000),
                  ),
                ),
              ),
              Text(
                "Usuário: ",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Text("Nome: ",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              Text("Descrição: ",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _textFieldController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Adiciona nome do git',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 120.0,
                  height: 50.0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(236, 79, 79, 1), // bac
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const GitHubPage()));
                      },
                      child: const Text('Buscar')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                 child: Image.network("https://avatars.githubusercontent.com/u/71016898?v=4")
//               ),
//               image: DecorationImage(
//                 Bord
//                 image: Image.network("https://avatars.githubusercontent.com/u/71016898?v=4")
//                 )
               
//               const Text('Usuario: Beatriz'),
//               const Text('Usuario: Beatriz'),
//               const Text('Usuario: Beatriz'),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextFormField(
//                   decoration: const InputDecoration(labelText: 'Nome'),
//                 ),
//               )
//             ],
//           ),