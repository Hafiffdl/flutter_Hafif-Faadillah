void main() {
  List<int> nilai = [7, 5, 3, 5, 2, 1];

  int total = 0;
  for (int n in nilai){
    total += n;
  }

  double rataRata = total / nilai.length;
  int hasilrataRata = rataRata.ceil();

  print("Input: $nilai");
  print("Output: $hasilrataRata");
}