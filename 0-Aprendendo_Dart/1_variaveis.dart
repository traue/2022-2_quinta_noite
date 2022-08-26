void main() {
  
  //declaração de variáveis em Dart:
  
  int idade = 35; //variável INTERIA
  String nome = "Thiago G. Traue"; //variável textual (cadeia de caracteres)
  double altura = 1.83; //variável de PONTO FLUTUANTE (real)
  bool fumante = false; //variável BOOLEANA (V/F)
  
  //podemos usar concatenação em prints.. MAS não faremos assim...:
  //print("Olá " + nome + " ah, legal, você tem " + idade.toString() + " anos!");
  
  //Utilizaremos variáveis dentro de cadeias de caracteres SEMPRE com INTERPOLAÇÃO:
  print("Olá $nome! Ah, legal, você tem $idade anos!");
  print("Nossa, você tem $altura m. Legal!");
  
  //Em Dart também temos dois tipos especiais de variáveis: var e dynamic
  
  //o tipo "var" faz com que a variável assuma o PRIMEIRO tipo de dado que ela receber
  var x = 24;
  print(x);
  
  //você agora pode alterar o valor dessa variável para o mesmo tipo, APENAS. Veja:
  x = 1;
  print(x);
  
  //x = "Traue"; //não pode alterar o tipo!!
  
  var y = "Uninove";
  print(y);
  
  y = "Deize";
  print(y);
  
  //y = 10;
  
  //e o Dynamic? Ele assumo qualquer valor, de qualquer tipo em runtime:
  dynamic z = "Rafael";
  print(z);
  
  //posso trocar o tipo de valor de "z". Veja:
  z = 90;
  print(z);
  
}
