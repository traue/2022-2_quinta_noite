import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<String> _cidades = [
    "Aracaju",
    "Belém",
    "Belo Horizonte",
    "Boa Vista",
    "Brasilia",
    "Campo Grande",
    "Cuiaba",
    "Curitiba",
    "Florianópolis",
    "Fortaleza",
    "Goiânia",
    "João Pessoa",
    "Macapá",
    "Maceió",
    "Manaus",
    "Natal",
    "Palmas",
    "Porto Alegre",
    "Porto Velho",
    "Recife",
    "Rio Branco",
    "Rio de Janeiro",
    "Salvador",
    "São Luis",
    "São Paulo",
    "Teresina",
    "Vitória"
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UniClima"), //vamos alterar já já,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            DropdownSearch<String>(
              items: _cidades,
              //paramos aqui
            )
          ]
        )
      ),
    );
  }
}