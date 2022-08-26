//operações matemáticas
void main() {
  
  double x = 1.5;
  double y = 2.5;
  int z = 2;
  
  double resultado = (x + y) * z;
  
  print(resultado);
  
  //Lembre-se que o Dart respeita as regras matemáticas
  
  
  int a = 10;
  double b = 3;
  resultado = a * b;
  
  //Dart possui implementado TODAS as operações matemáticas básicas +, -, /, *
  
  print(resultado.toStringAsFixed(3));
  
  //Dart também implementa o "módulo"...:
  
  a = 23;
  int restoDivisao = a % 7; //-> Resto da divisão
  
  print(restoDivisao);
  
  int parteInteira = a ~/ 7; //parte inteira de uma divisão
  print(parteInteira);
  
}