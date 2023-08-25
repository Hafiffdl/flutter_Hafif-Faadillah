Future<int> hitungFaktorial(int faktor) async {
  if (faktor == 0) {
    return 1;
  } else {
    return faktor * await hitungFaktorial(faktor - 1);
  }
}

void main() async {
  int input = 5;

  int hasil = await hitungFaktorial(input);

  print("Input: $input");
  print("Output: $hasil");
}