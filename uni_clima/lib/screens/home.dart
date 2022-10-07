import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uni_clima/model/clima_model.dart';
import 'dart:convert';

import 'package:uni_clima/widgets/clima_widget.dart';

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

  String _cidadeSelecionada = "São Paulo";
  late ClimaModel climaModel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    carregaClima();
  }

  carregaClima() async {
    setState(() {
      _isLoading = true;
    });

    const String apiURL = "api.openweathermap.org";
    const String path = "/data/2.5/weather";
    const String appid =
        "52dac29f5abdadd0a09e36fb0f691c49"; //Cole a SUA chave de API
    const String units = "metric";
    const String lang = "pt_br";

    final parametros = {
      "q": _cidadeSelecionada,
      "appid": appid,
      "units": units,
      "lang": lang
    };

    final climaResponse = await http.get(Uri.https(apiURL, path, parametros));

    //apenas para fins de depuracão:
    ("URL Montada: ${climaResponse.request!.url.toString()}");

    if (climaResponse.statusCode == 200) {
      setState(() {
        _isLoading = false;
        climaModel = ClimaModel.fromJson(jsonDecode(climaResponse.body));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UniClima"), //vamos alterar já já,
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: [
        DropdownSearch<String>(
            popupProps: const PopupProps.dialog(
              showSelectedItems: true,
              showSearchBox: true,
            ),
            items: _cidades,
            onChanged: (value) {
              _cidadeSelecionada = value!;
              carregaClima();
            }),
        Expanded(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: const EdgeInsets.all(6),
              child: _isLoading
                  ? const CircularProgressIndicator(
                      strokeWidth: 5,
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                    )
                  : ClimaWidget(climaData: climaModel)),
          Padding(
            padding: const EdgeInsets.all(8),
            child: _isLoading
                ? Text('Carregando....',
                    style: Theme.of(context).textTheme.headline5)
                : IconButton(
                    onPressed: carregaClima,
                    icon: const Icon(Icons.refresh_rounded),
                    color: Colors.blue,
                    tooltip: "Recarregar clima",
                    iconSize: 50,
                  ),
          )
        ]))
      ])),
    );
  }
}
