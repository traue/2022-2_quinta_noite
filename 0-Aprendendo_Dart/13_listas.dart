void main() {
  List<String> compras = ["Bananas", "Leite", "Alface", "Nutella"];

  print(compras.length);

  print(compras[0]);
  print(compras[1]);
  print(compras[2]);
  print(compras[3]);
  //print(compras[4]);

  print("---");

  //i = i + 1;
  for (int i = 0; i < compras.length; i++) {
    print(compras[i]);
  }

  print("---");

  //inversa...:

  for (int i = compras.length - 1; i >= 0; i--) {
    print(compras[i]);
  }

  print(compras);

  //acrscenta-se sempre ao final...:
  compras.add("Mandioca");
  compras.add("Mallboro");

  print(compras);

  compras.insert(1, "Chocolate");
  compras.insert(2, "Bixxxcoito");

  print(compras);
  
  //só pra mostrar como seria ordenação:
  compras.sort((a, b) => a.compareTo(b));
  
  print(compras);
  
  compras.removeAt(3);
  compras.remove("Nutella");
  
  print(compras);
  
  print(compras.contains("Mandioca"));
}
