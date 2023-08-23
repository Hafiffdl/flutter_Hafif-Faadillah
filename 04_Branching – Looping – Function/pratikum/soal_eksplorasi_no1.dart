import 'dart:io';

void main() {

  bool prima(int num) {
  if (num <= 1) {
    return false;
  }
  for (int i = 2; i <= num / 2; i++) {
    if (num % i == 0) {
      return false;
    }
  }
  return true;
}
  print("Mengecek Bilangan Prima");

  stdout.write("Masukkan sebuah bilangan: ");
  int num = int.parse(stdin.readLineSync()!);

  if (prima(num)) {
    print("$num adalah bilangan prima.");
  } else {
    print("$num bukan bilangan prima.");
  }
}