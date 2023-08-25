void main() {
  List<String> data = ['js', 'js', 'js', 'golang', 'python', 'js', 'js', 'golang', 'rust'];

  Map<String, int> frekuensi = hasilFrekuensi(data);

  print("Data Input: $data");
  print("Hasil Frekuensi: $frekuensi");
}
Map<String, int> hasilFrekuensi(List<String> data) {
  Map<String, int> frekuensi = {};

  for (String item in data) {
    if (frekuensi.containsKey(item)) {
      frekuensi[item] = frekuensi[item]! + 1;
    } else {
      frekuensi[item] = 1;
    }
  }
  return frekuensi;
} 