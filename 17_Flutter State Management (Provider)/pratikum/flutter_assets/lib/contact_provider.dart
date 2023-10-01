import 'package:flutter/material.dart';
import 'package:flutter_assets/data.dart';

class ContactProvider extends ChangeNotifier {
  final List<Data> _dataList = [];

  List<Data> get dataList => _dataList;

  void addData(Data data) {
    _dataList.add(data);
    notifyListeners();
  }

  void editData(int index, Data newData) {
    _dataList[index] = newData;
    notifyListeners();
  }

  void deleteData(int index) {
    _dataList.removeAt(index);
    notifyListeners();
  }
}
