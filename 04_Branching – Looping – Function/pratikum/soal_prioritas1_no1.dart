import 'dart:io';
void main() {
  print("Masukkan : ");
  int nilai = int.parse(stdin.readLineSync()!);
  String hasil;

  if (nilai > 70) {
    hasil = "Nilai A";
  } else if (nilai > 40) {
    hasil = "Nilai B";
  } else if (nilai > 0) {
    hasil = "Nilai C";
  } else {
    hasil = "";
  }
  print(hasil);
}