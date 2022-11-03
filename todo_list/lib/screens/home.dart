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
  late Map<String, dynamic> _ultimoRemovido;
  late int _indexUltimoRemovido;

  @override
  void initState() {
    super.initState();
    _lerDados().then((value) {
      setState(() {
        _todoList = json.decode(value!);
      });
    });
  }

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
    setState(() {
      Map<String, dynamic> novoTodo = {};
      novoTodo['titulo'] = _todoController.text;
      novoTodo['status'] = false;
      //limpar o campo de texto onde o usuário digitou a tarefa
      _todoList.add(novoTodo);
      _salvarDados();
    });
  }

  Widget widgetTarefa(BuildContext context, int index) {
    return Dismissible(
      key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment(0.9, 0),
          child: Icon(
            Icons.delete_sweep_outlined,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      child: CheckboxListTile(
        title: Text(_todoList[index]['titulo']),
        value: _todoList[index]['status'],
        secondary: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Icon(
            _todoList[index]['status'] ? Icons.check : Icons.error_outline,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        onChanged: (value) {
          setState(() {
            _todoList[index]['status'] = value;
            _salvarDados();
          });
        },
      ),
      onDismissed: (direction) {
        _ultimoRemovido = Map.from(_todoList[index]);
        _indexUltimoRemovido = index;
        _todoList.removeAt(index);
        _salvarDados();

        final snack = SnackBar(
          content: Text('Tarefa \"${_ultimoRemovido['titulo']}\" removida!'),
          duration: const Duration(seconds: 4),
          action: SnackBarAction(
            label: 'Desfazer',
            onPressed: () {
              setState(() {
                _todoList.insert(_indexUltimoRemovido, _ultimoRemovido);
                _salvarDados();
              });
            },
          ),
        );

        //remove uma snackbar, se houver
        ScaffoldMessenger.of(context).removeCurrentSnackBar();

        //mostra a snackbar do último remodivo:
        ScaffoldMessenger.of(context).showSnackBar(snack);
      },
    );
  }

  Future<void> _reordenaLIsta() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _todoList.sort((a, b) {
        if (a['status'] && !b['status']) return 1;
        if (!a['status'] && b['status']) return -1;
        return 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
        centerTitle: true,
      ),
      body: Builder(
          builder: (context) => Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          controller: _todoController,
                          maxLength: 90,
                          decoration:
                              const InputDecoration(labelText: 'Nova Tarefa'),
                        )),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: FloatingActionButton(
                            child: const Icon(Icons.save),
                            onPressed: () {
                              if (_todoController.text.isEmpty) {
                                final snack = SnackBar(
                                    content: const Text('Não pode ser vazia!'),
                                    duration: const Duration(seconds: 4),
                                    action: SnackBarAction(
                                        label: 'Ok',
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .removeCurrentSnackBar();
                                        }));

                                ScaffoldMessenger.of(context)
                                    .removeCurrentSnackBar();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snack);
                              } else {
                                _adicionaTarefa();
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Expanded(
                      child: RefreshIndicator(
                    onRefresh: _reordenaLIsta,
                    child: ListView.builder(
                      itemBuilder: widgetTarefa,
                      itemCount: _todoList.length,
                      padding: const EdgeInsets.only(top: 10),
                    ),
                  ))
                ],
              )),
    );
  }
}
