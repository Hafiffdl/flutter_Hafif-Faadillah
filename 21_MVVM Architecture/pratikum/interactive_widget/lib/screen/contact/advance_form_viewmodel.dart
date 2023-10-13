import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:interactive_widget/models/api/contact_api.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:interactive_widget/models/contact_model.dart';

class AdvanceFormViewModel with ChangeNotifier {
  var formKey = GlobalKey<FormState>();
  String? nama = "";
  String? nomor = "";
  String? filePath;
  Color selectedColor = Colors.blue;
  DateTime? selectedDate = DateTime.now();
  final currentDate = DateTime.now();

final ContactApi _contactApi = ContactApi();
  List<ContactModel> dataList = [];

Future<void> fetchContacts() async {
    try {
      dataList = await _contactApi.fetchContacts();
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error');
      }
    }
  }
  
Future<void> pickFile() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ["jpg"],
    allowMultiple: true,
  );
  if (result == null) return;

  List<File> files = result.paths.map((path) => File(path!)).toList();
  List<PlatformFile> platformFiles = result.files;

  for (var i = 0; i < files.length; i++) {
    if (kDebugMode) {
      print(files[i].path);
    }
    if (kDebugMode) {
      print(platformFiles[i].name);
    }
    filePath = files[i].path;
  }

  notifyListeners();
}

  Future<void> selectDate(BuildContext context) async {
  final pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(currentDate.year + 5),
  );

  if (pickedDate != null) {
    selectedDate = pickedDate;

    notifyListeners();
  }
}

Future<void> selectColor(BuildContext context) async {
  Color newColor = selectedColor;  // Simpan warna sebelumnya untuk pengembalian jika perlu
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Pick your Color'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: selectedColor,
            onColorChanged: (value) {
              newColor = value;
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              selectedColor = newColor;
              notifyListeners();
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}

  void deleteData(int index) {
    dataList.removeAt(index);
    notifyListeners();
  }

  void editData(BuildContext context, int index) {
    String editedName = dataList[index].nama ?? "";
    String editedNomor = dataList[index].nomor ?? "";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Contact"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: editedName,
                onChanged: (value) {
                  editedName = value;
                },
                decoration: const InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                initialValue: editedNomor,
                onChanged: (value) {
                  editedNomor = value;
                },
                decoration: const InputDecoration(labelText: 'Nomor'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Simpan perubahan ke dalam dataList
                dataList[index].nama = editedName;
                dataList[index].nomor = editedNomor;

                notifyListeners();

                Navigator.of(context).pop();

                for (var data in dataList) {
                  if (kDebugMode) {
                    print('Nama: ${data.nama}, Nomor: ${data.nomor}, Date: ${DateFormat("dd/MM/yyyy").format(data.selectedDate ?? DateTime.now())}, Warna: ${data.selectedColor}, Path File: ${data.filePath}');
                  }
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
void submitData(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Data berhasil disimpan"),
        ),
      );

      dataList.add(ContactModel(
        nama: nama,
        nomor: nomor,
        selectedDate: selectedDate,
        selectedColor: selectedColor,
        filePath: filePath,
      ));

      formKey.currentState!.reset();

      notifyListeners();
    }
  }
}
