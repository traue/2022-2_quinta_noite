void main() {
  print(falarDados(
    "Mikael",
    mostrarHorario: false,
    fumante: true)
 );
}

falarDados(String nome,{String? sobrenome, int? idade, bool? fumante, mostrarHorario = true}) {
  String texto;
  
  if(sobrenome != null) {
    texto = "Olá $nome $sobrenome, tudo bem? Seja bem-vinde!";
  } else {
    texto = "Olá $nome, tudo bem? Seja bem-vinde!";
  }
  
  if(idade != null) {
    texto += "\nAh! legal, vi que você tem $idade anos!";
  }
  
  if(fumante != null) {
    texto += fumante ? "\nHmm.. você fuma!" : "\nHmm.. você não fuma. Legal!";
  }
  
  
  if(mostrarHorario) {
    texto += "\nAgora são: ${DateTime.now()}";
  }

  return texto;
}
