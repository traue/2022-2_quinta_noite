void main() {
  
  Map<String, double> notas = {
    "Jheniffer": 10,
    "Isaias": 8.4,
    "Thiago": 10,
    "Fulano": 4.3,
    "Rafael": 6.3
  };
  
  print(notas);
  
  notas["Isaias"] = 6.5;
  
  notas["Vinicius"] = 9;
  
  print(notas);
  
  //No dart NORMALMENTE declaramos maps assim:
  Map<String, dynamic> teste;
  
  teste = {
    "Bla": 10,
    "Ble": "Ola Mundo",
    "Teste": 10.5,
    "Traue": "Thiago",
    "Apple": 9000
  };
  
  print(teste);
  
  notas.remove("Jheniffer");
  
  print(notas);
}