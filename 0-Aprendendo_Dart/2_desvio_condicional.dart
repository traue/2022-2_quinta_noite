void main() {
  String nome = "Thiago G. Traue";
  bool fumante = false;
  
  
  //desvio condicional
//   if(fumante) { //condição BOOLEANA
//     print("O $nome fuma!");
//   } else { //SENÃO
//     print("O $nome não fuma!");
//   }
  
  //para casos como o mostrado acima, vamo preferir usar o TERNÁRIO
  //SINTAXE: <condição> ? <execução se verdadeira> : <execução se falso>
  
  print(fumante ? "O $nome fuma!" : "O $nome não fuma!");
  
  //switch
  int x = 777;
  
  switch(x) { //ESCOLHA
    case 10: 
      print("É dez!");
      break;
    case 20: 
      print("É vinte!");
      break;
    case 30: 
      print("É trinta!");
      break;
    default:
      print("Nao sei que numero é este!");
      break;
  }
  
  //é o mesmo que...:
  if(x == 10) {
    print("É dez!");
  } else if(x == 20) {
    print("É vinte!");
  } else if(x == 30) {
    print("É trinta!");
  } else {
    print("Nao sei que numero é este!");
  }
  
}