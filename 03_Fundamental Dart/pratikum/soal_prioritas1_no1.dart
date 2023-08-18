import 'dart:io';
void main(){

  print('LUAS DAN KELILING PERSEGI');
 
  double sisi1,luasPersegi, kelilingPersegi;
  print('===================================');
  print('Hitung Luas dan Keliling Persegi');

  print('===================================');
  print('Masukkan Sisi 1');
  sisi1 = double.parse(stdin.readLineSync()!);

  print('sisi 1=$sisi1');
 
  print('===================================');

  luasPersegi = sisi1 * sisi1;
  print('Luas persegi adalah $luasPersegi');
  print('===================================');

  kelilingPersegi = ((sisi1*4));
  print('Keliling persegi adalah $kelilingPersegi');

  print('===================================');
  print('');

  print('LUAS DAN KELILING PERSEGI PANJANG');
  double panjang, lebar, luas, keliling;
  print('=========================================');

  print("Hitung Luas dan keliling persegi panjang");

  print('=========================================');
  print('masukan panjang:');
  panjang = double.parse(stdin.readLineSync()!);

  print('masukan lebar:');
  lebar = double.parse(stdin.readLineSync()!);

  print('panjang=$panjang');
  print('lebar=$lebar');

  print('===================================');

  luas = panjang * lebar;
  print('Luas persegi panjang adalah $luas');
  print('===================================');

  keliling = ((2 * panjang) + (2 * lebar));
  print('Keliling persegi panjang adalah $keliling');

  print('===================================');
  
}