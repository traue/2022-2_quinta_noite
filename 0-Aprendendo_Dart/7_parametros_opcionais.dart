void main() {
  print(falarDados(
    "Mikael",
    idade: 20,
    mostrarHorario: false,
    fumante: true,
    sobrenome: "Borges")
 );
}

falarDados(String nome,
    {String sobrenome = "Silva", 
     int idade = 0, 
     bool fumante = false, 
     mostrarHorario = true}) {
  
  String texto = "Olá $nome $sobrenome, tudo bem? Seja bem-vinde!";
  texto += "\nAh! legal, vi que você tem $idade anos!";
  texto += fumante ? "\nHmm.. você fuma!" : "\nHmm.. você não fuma. Legal!";
  
  if(mostrarHorario) {
    texto += "\nAgora são: ${DateTime.now()}";
  }

  return texto;
}
