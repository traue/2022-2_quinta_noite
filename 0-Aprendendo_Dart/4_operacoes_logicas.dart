void main() {
  
  bool a = true;
  bool b = false;
  
  print(a && b); //e => Verdadeiro somente quando AMBAS as condições foram verdadeiras
  print(a || b); //ou => Verdadeiro quando UM dos dois lados é verdadeiro
  print(a == b); //é igual => Será verdadeiro se ambas as condições dorem iguais
  print(a != b); //é diferente => Será verdadeiro quando as condições forem diferentes
  
  print("---");
  
  int x = 1;
  int y = 3;
  
  print(x > y); //verifica se o lado esquerdo é MAIOR que o lado direito
  print(x < y); //verifica se o lado esquerdo é MENOR que o lado direito
  
  print(x >= y); //verifica se o lado esquerdo é MAIOR OU IGUAL que o lado direito
  print(x <= y); //verifica se o lado esquerdo é MENOR OU IGUAL que o lado direito
  
  print(x == y); //Será verdadeiro se ambos os valores forem iguais
  print(x != y); //Será verdadeiro se ambos os valores forem diferentes
  
  //No Dart NÃO EXISTE a implementação do "===" (que verifica se o tipo e o valor são iguais.)
  
}