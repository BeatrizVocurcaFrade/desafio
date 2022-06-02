import 'package:flutter/material.dart';
import '../model/dados_user.dart';
import '../network/api_provider_git.dart';
class GitHubPage extends StatefulWidget {
  const GitHubPage({Key? key}) : super(key: key);

  @override
  State<GitHubPage> createState() => _GitHubPageState();
}


class _GitHubPageState extends State<GitHubPage> {
  final TextEditingController _controllerUsuario = TextEditingController();
  DadosUser dadosUser = DadosUser(
      login: "",
      nome: "",
      bio: "",
      avatarUrl: "https://cdn-icons-png.flaticon.com/512/25/25231.png");
  final estiloPadrao =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  final Function _buscarUsuario = ApiProviderGit().buscarUsuario;

  @override
  void dispose() {
    _controllerUsuario.dispose();
    super.dispose();
  }
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
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(dadosUser.avatarUrl),
                    ),
                    borderRadius: const BorderRadius.all(
                    Radius.circular(1000),
                    ),
                  ),
                ),
              ),
              Text(
                'Usuário: ${dadosUser.login}',
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Text('Nome: ${dadosUser.nome}',
                  style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              Text('Biografia: ${dadosUser.bio}',
                  style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _controllerUsuario,
                    decoration: const InputDecoration(
                      hintText: 'Procurar perfil',
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
                      onPressed: () async {
                      dadosUser = await _buscarUsuario(
                          _controllerUsuario.text, context);
                      setState(() {});
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
