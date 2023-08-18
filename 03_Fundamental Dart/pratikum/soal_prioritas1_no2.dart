import 'dart:io';

void main() {
  double phi = 3.14;
  double jarijari, luas, keliling;

  print('Luas dan keliling lingkaran');

  print('masukan jari-jari:');
  jarijari = double.parse(stdin.readLineSync()!);
  print('===========================================');
  luas = phi * (jarijari * jarijari);

  print('luas lingkaran adalah: $luas');

  print('===========================================');

  keliling = 2 * phi * jarijari;

  print('keliling lingkaran adalah :$keliling ');

  print('============================================');
}