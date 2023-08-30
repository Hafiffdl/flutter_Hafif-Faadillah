class Kalkulator {
  double penjumlahan(double a, double b) {
    return a + b;
  }

  double pengurangan(double a, double b) {
    return a - b;
  }

  double perkalian(double a, double b) {
    return a * b;
  }

  double pembagian(double a, double b) {
      return a / b;
    }
  }

void main() {
  Kalkulator kalkulator = Kalkulator();

  double angka1 = 10;
  double angka2 = 2;

  print("Penjumlahan: ${kalkulator.penjumlahan(angka1, angka2)}");
  print("Pengurangan: ${kalkulator.pengurangan(angka1, angka2)}");
  print("Perkalian: ${kalkulator.perkalian(angka1, angka2)}");
  print("Pembagian: ${kalkulator.pembagian(angka1, angka2)}");
}