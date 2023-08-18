import 'dart:io';

void main() {
  String kata, palindrom;

  print('masukan kata : ');

  kata = stdin.readLineSync()!;

  palindrom = kata.split('').reversed.join('');
  print('===========================================================');
  print(palindrom);
  print(kata);
  print('===========================================================');
  if (palindrom == kata) {
    print('kata tersebut palindrom');
    print('===========================================================');
  } else {
    print('kata tersebut BUKAN palindrom');
    print('===========================================================');
  }
}
