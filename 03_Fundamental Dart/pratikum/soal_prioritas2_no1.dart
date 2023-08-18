import 'dart:io';

void main() {
  String nama1, nama2, nama3;
  print('Gabungan 3 buah nama');

  print('===========================================================');

  print('Masukan nama pertama:');
  nama1 = stdin.readLineSync()!;
  print('Masukan nama kedua:');
  nama2 = stdin.readLineSync()!;
  print('Masukan nama ketiga:');
  nama3 = stdin.readLineSync()!;
  print('===========================================================');
  print('$nama1 $nama2 $nama3');
  print('===========================================================');
}
