import 'dart:io';

void main() {
  double phi = 3.14;
  double luasalas, tinggi, jarijari, volume;

  print('Menghitung Volume Tabung');
  print('===========================================================');

  print('masukan jari-jari alas :');

  jarijari = double.parse(stdin.readLineSync()!);

  luasalas = phi * (jarijari * jarijari);

  print('===========================================================');

  print('Masukan Tinggi Tabung : ');
  tinggi = double.parse(stdin.readLineSync()!);

  volume = luasalas * tinggi;

  print('===========================================================');

  print('Volume dari tabung adalah : $volume');

  print('===========================================================');
}
