import 'package:flutter/material.dart';

import 'list_page.dart';
import 'desafio.dart';
import 'gitHub_page.dart';
import './to_do_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home Page')),
        backgroundColor: const Color.fromRGBO(236, 79, 79, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 120.0,
                height: 50.0,
                child: ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(236, 79, 79, 1), // backg
                    textStyle: const TextStyle(fontSize: 18),
              
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const TodolistPage()));
                  },
                  child: const Text('To do List'),
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
                    primary: const Color.fromRGBO(236, 79, 79, 1), // backg
                    textStyle: const TextStyle(fontSize: 18),
              
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ToDoListPage()));
                  },
                  child: const Text('To do List'),
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
                      primary: const Color.fromRGBO(27, 107, 227, 1), // bac
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => const GitHubPage()));
                    },
                    child: const Text('GitHub')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 120.0,
                height: 50.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(80, 237, 124, 1), // back
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => const Desafio()));
                    },
                    child: const Text('Desafio +')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
