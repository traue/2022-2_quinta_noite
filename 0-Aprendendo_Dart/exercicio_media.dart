/*  
 * Crie um pequeno programa em Dart que contenha 
 * 3 notas de um aluno e seu nome.
 * O programa deverá calcular a média deste aluno
 * e exibir as seguinte informação 
 * "fulano (o nome do aluno) está aprovado" OU
 * "fulado está reprovado.
 * 
 * Considere uma média = 6
 * 
 * */


void main() {
  String nome = "Josefine";
  double nota1 = 3.5;
  double nota2 = 5.1;
  double nota3 = 4.7;
  
  double media = (nota1 + nota2 + nota3) / 3;
 
  print("O aluno $nome fico com média ${media.toStringAsFixed(2)}");
  
  if(media >= 6) {
    print("Está aprovade!");
  } else {
    print("Está reprovade!");
  }
  
  //Do Sr. Elton:
  print(media >= 6 ? "$nome está aprovado" : "$nome está reprovado");
  
}