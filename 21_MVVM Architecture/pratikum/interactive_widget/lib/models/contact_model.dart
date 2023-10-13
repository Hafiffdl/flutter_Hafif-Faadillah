import 'package:flutter/material.dart';

class ContactModel {
  int? id;
  String? nama;
  String? nomor;
  DateTime? selectedDate;
  Color? selectedColor;
  String? filePath;

  ContactModel({
    this.id,
    this.nama,
    this.nomor,
    this.selectedDate,
    this.selectedColor,
    this.filePath,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      nama: json['nama'],
      nomor: json['nomor'],
      selectedDate: DateTime.parse(json['selectedDate']),
      selectedColor: Color(json['selectedColor']),
      filePath: json['filePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'nomor': nomor,
      'selectedDate': selectedDate.toString(),
      'selectedColor': selectedColor?.value,
      'filePath': filePath,
    };
  }
}
