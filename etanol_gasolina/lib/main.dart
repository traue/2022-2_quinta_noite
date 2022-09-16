import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController etanolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();
  String _resultado = 'Informe os dados';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _calculaCombustivelIdeal() {
    double vEtanol = double.parse(etanolController.text.replaceAll(',', '.'));
    double vGasolina =
        double.parse(gasolinaController.text.replaceAll(',', '.'));

    double proporcao = vEtanol / vGasolina;

    //se a proporção for menor do que 0.7, deve-se abastecer com etanol
    setState(() {
      _resultado =
          (proporcao < 0.7) ? 'Abasteça com Etanol' : 'Abasteça com Gasolina';
    });
  }

  void _reset() {
    _formKey.currentState?.reset();
    gasolinaController.text = '';
    etanolController.text = '';
    setState(() {
      _resultado = 'Informe os dados';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Etanol ou Gasolina?',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue[900],
          actions: [
            IconButton(
                onPressed: () {
                  _reset();
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    Icon(
                      Icons.local_gas_station,
                      size: 120,
                      color: Colors.blue[900],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: etanolController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe corretamente o valor do Etanol!';
                        } else {
                          if (double.parse(value.toString().replaceAll(',', '.')) <= 0) {
                            return 'O valor precisa ser positivo!';
                          }
                        }
                        return null;
                      },
                      textAlign: TextAlign.center,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style:
                          TextStyle(color: Colors.lightBlue[800], fontSize: 26),
                      decoration: InputDecoration(
                          labelText: 'Valor do Etanol',
                          labelStyle: TextStyle(color: Colors.blue[900]),
                          errorStyle: const TextStyle(fontSize: 18)),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: gasolinaController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe corretamente o valor da Gasolina!';
                        } else {
                          if (double.parse(value.toString().replaceAll(',', '.')) <= 0) {
                            return 'O valor precisa ser positivo!';
                          }
                        }
                        return null;
                      },
                      textAlign: TextAlign.center,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style:
                          TextStyle(color: Colors.lightBlue[800], fontSize: 26),
                      decoration: InputDecoration(
                          labelText: 'Valor da Gasolina',
                          labelStyle: TextStyle(color: Colors.blue[900]),
                          errorStyle: const TextStyle(fontSize: 18)),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _calculaCombustivelIdeal();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightBlue[900]),
                                child: const Text(
                                  'Verificar',
                                  style: TextStyle(fontSize: 25),
                                )))),
                    Text(
                      _resultado,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.lightBlue[900], fontSize: 26),
                    )
                  ]),
            )));
  }
}
