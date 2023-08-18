import 'dart:io';

void main() {
  print("Masukkan Angka: ");
  int angka = int.parse(stdin.readLineSync()!);

  print("Faktor dari $angka adalah: ");
  for (int i = 1; i <= angka; i++) {
    if (angka % i == 0) {
      print(i);
    }
  }
}