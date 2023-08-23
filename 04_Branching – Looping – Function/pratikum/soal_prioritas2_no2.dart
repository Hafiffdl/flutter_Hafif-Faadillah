import 'dart:io';
void main() {
  int i, j, k, n = 10;

  for (i = 0; i <= n - 1; i++) {
    for (j = 0; j < i; j++) {
      stdout.write(" ");
    }
    for (k = i; k <= n - 1; k++) {
      stdout.write("@"  " ");
    }
    stdout.writeln("");
  }
  for (i = n - 1; i >= 0; i--) {
    for (j = 0; j < i; j++) {
      stdout.write(" ");
    }
    for (k = i; k <= n - 1; k++) {
      stdout.write("@"  " ");
    }
    stdout.writeln("");
  }
}