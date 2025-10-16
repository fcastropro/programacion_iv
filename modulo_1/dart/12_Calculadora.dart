void main() {
  final TablaMultiplicar tabla = TablaMultiplicar(numero: 5);
  print(tabla); 
  tabla.mostrarTabla();
}

class TablaMultiplicar {
  int numero;

  TablaMultiplicar({
    required this.numero,
  });

  void mostrarTabla() {
    for (int i = 1; i <= 10; i++) {
      print("$numero x $i = ${numero * i}");
    }
  }
}
