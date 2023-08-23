import 'dart:io';
 
void main() {
  var i = 1;
  while (i <= 9) {
    
    var j = 1;
    while (j <= 9) {
      stdout.write(i * j);
      stdout.write('  ');
      j++;
    }
    stdout.write('\n');
    i++;
  }
}