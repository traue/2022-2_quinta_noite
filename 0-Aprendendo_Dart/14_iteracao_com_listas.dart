void main() {
  
  List<dynamic> compras = ["Bananas", "Leite", 13, 1.5, false];

  //foreach:
  for(dynamic item in compras) {
    print(item);
  }
  
  print("---");
  
  List<String> alunos = [
    "Jheniffer",
    "Rafael",
    "Thiago",
    "Mikael",
    "Vinicius"
  ];
  
  print(alunos);
  
  //forech interno:
  alunos.sublist(2, 4).forEach((nome) {
    print(nome);
  });
  
}
