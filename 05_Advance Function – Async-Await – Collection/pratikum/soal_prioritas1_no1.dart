Future<List<int>> nilaipengali(List<int> data, int pengali) async {
  List<int> hasil = [];

  await Future.forEach(data, (int item) async {
    int pengaliItem = item * pengali;
    hasil.add(pengaliItem);
    await Future.delayed(Duration(seconds: 1));
  });

  return hasil;
}

void main() async {
  List<int> dataList = [2, 3, 4, 5, 10];
  int pengali = 10;

  List<int> hasilList = await nilaipengali(dataList, pengali);
  print(hasilList);
}
