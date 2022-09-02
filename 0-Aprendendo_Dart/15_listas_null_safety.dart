void main() {
  
  List<String> minhaLista = []; //construi uma lista vazia aqui
  
  minhaLista.add("Bla");
  
  print(minhaLista);
  
  List<String>? minhaLista2;
  
  if(minhaLista2 != null) {
    minhaLista2.add("Uninine");
  } else {
    minhaLista2 = [];
    minhaLista2.add("Uninine");
  }
  
  print(minhaLista2);
  
  List<String?> minhaLista3 = [];
  minhaLista3.add("Abobrinha");
  minhaLista3.add(null);
  
  print(minhaLista3);
  
  List<String?>? minhaLista4;
  //minhaLista4.add(null);
  if(minhaLista4 != null) {
    minhaLista4.add(null);
  } else {
    minhaLista4 = [];
    minhaLista4.add(null);
    minhaLista4.add("Isaias");
  }
  
  print(minhaLista4);
}