void main() {
  //4 tipos de loops: for; while; do..while e foreach
  //o forech veremos quando entrarmos em listas
  /*
   * Lembrar que:
   * 
   *  i++ => i = i + 1
   *  i+=2 => i = i + 2;
   *  i-- => i = i - 1;
   *  i/=4 => i = i / 4;
   * 
   * */
  //for:
  //início  ;  parada; incremento
  for (int i = 0; i <= 20; i += 2) {
    print('For: $i');
  }

  print('');
  //------------------------------
  int j = 0; //variável de controle
  while (j < 20) {
    //condição de parada
    print('While: $j');
    j += 3; //incremento
  }

  print('');
  //------------------------------

  int k = 0; //variável de controle
  do {
    print('Do: $k');
    k += 4; //incremento
  } while (k <= 32); //condição de parada
}
