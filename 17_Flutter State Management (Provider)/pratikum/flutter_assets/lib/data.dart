import 'package:flutter/material.dart';

class Data {
  Data({required this.nama, this.nomor, this.selectedDate, this.selectedColor, this.filePath});

  String? nama;
  String? nomor;
  DateTime? selectedDate;
  Color? selectedColor;
  String? filePath;

}