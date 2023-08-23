import 'dart:io';

void main() {
  print("Masukkan Angka: ");
  int angka1 = int.parse(stdin.readLineSync()!);

  print("Faktor dari $angka1 adalah: ");
  for (int i = 1; i <= angka1; i++) {
    if (angka1 % i == 0) {
      print(i);
    }
  }
  print("Masukkan Angka: ");
  int angka2 = int.parse(stdin.readLineSync()!);

  print("Faktor dari $angka2 adalah: ");
  for (int i = 1; i <= angka2; i++) {
     if (angka2 % i == 0) {
      print(i);
    }
  }
  print("Masukkan Angka: ");
  int angka3 = int.parse(stdin.readLineSync()!);

  print("Faktor dari $angka3 adalah: ");
  for (int i = 1; i <= angka3; i++) {
     if (angka3 % i == 0) {
      print(i);
    }
  }
}



