void main() {
  List<String> data1 = ['amuse', 'tommy kaira', 'spoon', 'HKS', 'litchfield', 'amuse', 'HKS'];
  List<String> data2 = ['JS Racing', 'amuse', 'spoon', 'spoon', 'JS Racing', 'amuse'];

  List<String> hasil1 = data1.toSet().toList();
  List<String> hasil2 = data2.toSet().toList();

  print("Data Input 1: $data1");
  print("Data Output 1: $hasil1");

  print("Data Input 2: $data2");
  print("Data Output 2: $hasil2");
}