//essas variáveis (c e d) são de escopo GLOBAL
int c = 8;
int d = 4;

void main() {
  //essa variáveis são de ESCOPO LOCAL em relação ao "main"
  int x = 10;
  int y = 20;
  
  print(multiplica(x, y));
  
  print(divideGlobal());
  
  void divide(double a, double b) {
    print(a / b);
  }
  
  divide(100, 5);  
 
}


int multiplica(int q, int w) {
  //as variáveis "q e w" de de escopo LOCAL em relação à fução "multiplica"
  return q * w;
}

double divideGlobal() {
  return c / d;
}