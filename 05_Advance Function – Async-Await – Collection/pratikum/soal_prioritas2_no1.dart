void main() {
  List<List<dynamic>> listOfLists = [
    [1, "data1"],
    [2, "data2"],
    [3, "data3"],
    [4, "data4"],
    [5, "data5"],
  ];

  Map<int, String> mapFromList = {};

  for (var item in listOfLists) {
      mapFromList[item[0]] = item[1];
    }
    
  print("Map from List: $mapFromList");

}