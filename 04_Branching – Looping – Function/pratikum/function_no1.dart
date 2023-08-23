import 'dart:io';

void lingkaran(hasil){
  double phi = 3.14;
  double jarijari, luas;

  print('Luas lingkaran');

  print('Masukan jari-jari:');
  jarijari = double.parse(stdin.readLineSync()!);
  print('=====================================');
  luas = phi * (jarijari * jarijari);

  print('luas lingkaran adalah: $luas');
}

void main(){
  lingkaran('hasil');
}