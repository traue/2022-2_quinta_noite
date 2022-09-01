//FUNÇÕES

/* Assim como a maior parte das linguagens, o Dart implementa os "3 tipos" 
 * de funções:
 * 
 *  - que não retorna nada (void)
 *  - que retornam algo (tipadas)
 *  - em todas função no dart podemos ter entradas ou não de parâmetros
 * 
 * */

void main() {
  
  falarOlaMundo();
  falarOlaMundo();
  
  darBoasVindas("Thiago", "Traue");
  
  double areaC = valorPi() * 16;
  
  print("A área de um círculo de raio 4 é: $areaC");
  
  double areaTerreno = calculaArearetangulo(20, 3);
  print("A área de um terreno de 20m de profundidade e 3m de frente é: $areaTerreno");
  
  print(montaTexto("Thiago", 35));
  
}


//não retorna nada (void) e POSSUI entrada de UM parâmetro
void darBoasVindas(String nome, String sobrenome) {
  print("Olá $nome $sobrenome, seja muito bem-vinde!");
}


//não retorna nada (void) e NÃO POSSUI nenhuma entrada de parâmetros
void falarOlaMundo() {
  print("Olá mundo!");
}

//não possui nenhum parâmetro de entrda, mas espera-se que a função retorne um valor "double"
double valorPi() {
  //...
  return 3.1415; //o retorno deve ser SEMPRE do mesmo tipo da função
}

//possui retorno (neste caso do tipo Double) e possui entrada de parâmetros
double calculaArearetangulo(double base, double altura) {
  double area = base * altura;
  return area;
}

//as entradas (parâmetros) podem ser de qualquer tipo
String montaTexto(String nome, int idade) {
  String texto = "O $nome tem $idade anos";
  return texto;
}


