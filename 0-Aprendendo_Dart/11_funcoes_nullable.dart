void main() {
  print(falarNome("Jheniffer") ?? "Oi visitante");
}

String? falarNome (String nome) {
  if (nome == "Jheniffer") {
    return "Oi Jheniffer";
  }
}