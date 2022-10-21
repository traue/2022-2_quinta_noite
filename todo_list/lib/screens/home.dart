import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _todoList = [];
  final _todoController = TextEditingController();

  Future<File> _abreArquivo() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File('${diretorio.path}/todoList.json');
  }

  Future<String?> _lerDados() async {
    try {
      final arquivo = await _abreArquivo();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _salvarDados() async {
    String dados = json.encode(_todoList);
    final arquivo = await _abreArquivo();
    return arquivo.writeAsString(dados);
  }

  void _adicionaTarefa() {
    Map<String, dynamic> novoTodo = {};
    novoTodo['titulo'] = ''; //vamos pegar do campo onde o usuário digita
    novoTodo['status'] = false;
    //limpar o campo de texto onde o usuário digitou a tarefa
    _todoList.add(novoTodo);
    _salvarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _todoController,
                  maxLength: 90,
                  decoration: const InputDecoration(labelText: 'Nova Tarefa'),
                )),
                SizedBox(
                  height: 45,
                  width: 45,
                  child: FloatingActionButton(
                    child: const Icon(Icons.save),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
