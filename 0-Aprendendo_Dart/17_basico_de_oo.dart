/*
 * Todo objeto possui ao menos três coisas:
 * 
 *  - Nome
 *  - Caradcterísticas
 *  - Comportamentos
 * 
 * Em programação uma classe é como um "MOLDE" para que os 
 * objetos sejam criados e utilizados.
 * 
 * */

class Pessoa {
  //atributos (características)
  String nome;
  int idade;
  double altura;
  bool fumante;

  //construtor da classe
//   Pessoa(String? nome, int? idade, double? altura, bool? fumante) {
//     this.nome = nome;
//     this.idade = idade;
//     this.altura = altura;
//     this.fumante = fumante;
//   }

  Pessoa(
      {required this.nome,
      required this.idade,
      required this.altura,
      required this.fumante});

  //named constructor
  Pessoa.nascer({required this.nome, required this.altura})
      : idade = 0,
        fumante = false;

  void fazerAniversario() {
    print("Ôba, festinha!");
    idade++; //é o mesmo que idade = idade + 1;
  }
}

void main() {
  Pessoa p1 =
      Pessoa(nome: "Thiago Traue", altura: 1.83, fumante: false, idade: 35);

  print("O nome do meliante é ${p1.nome}");
  print("O meliante tem ${p1.idade} anos!");
  print("O meliante tem ${p1.altura}m de altura!");
  print(p1.fumante ? "O meliante fuma" : "O meliante não fuma");

  p1.fazerAniversario();

  print("Agora o ${p1.nome} tem ${p1.idade} anos!");
  
  Pessoa nenem = Pessoa.nascer(nome: "Enzo", altura: 0.40);
  
  print("Nasceu o ${nenem.nome}!");
  print("Ele nasceu com ${nenem.altura}cm");
  print("${nenem.fumante}");
  print("${nenem.idade}");
  
  nenem.fazerAniversario();
  print("${nenem.idade}");
}
