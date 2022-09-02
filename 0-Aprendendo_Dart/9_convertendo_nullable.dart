void main() {
  falarDados(
    "Andre",
    //sobrenome: "Carvalho"
  );
}

//conversão de variáveis para non-nulable:

void falarDados(String nome, {String? sobrenome}) {

  String sobre = sobrenome ?? "Silva";
  
  print("Olá $nome $sobre, tudo bem?");

}