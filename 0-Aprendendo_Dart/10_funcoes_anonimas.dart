void main() {
  
  criaBotao(
    "Salvar",
    cliqueDoBotaoSalvar,
    cor: "Verde",
    largura: 80
  );  
  
  print("-----");
  
  criaBotao(
    "Editar",
    () { //função anônima
      print("Ui, fui clicado.. vou editar...");
    },
    cor: "Amarelo"
  );
 
}

void cliqueDoBotaoSalvar() {
  print("Ui, fui clicado.. vou salvar...");
}


void criaBotao(String texto, Function acao, {String? cor, int? largura, int? altura}) {
  print("Estou criando um botão assim...:");
  print(" - Texto: $texto");
  print(" - Cor: ${cor ?? "Cinza"}");
  print(" - Altura: ${altura ?? 50}");
  print(" - Largura: ${largura ?? 100}");
  print(" - Acão de clik: ");
  acao();
}