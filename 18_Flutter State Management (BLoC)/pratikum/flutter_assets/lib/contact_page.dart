import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assets/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter_assets/data.dart';
import 'bloc/contact_bloc.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactBloc(),
      child: const ContactPageContent(),
    );
  }
}

class ContactPageContent extends StatefulWidget {
  const ContactPageContent({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ContactPageContentState createState() => _ContactPageContentState();
}

class _ContactPageContentState extends State<ContactPageContent> {
  var formKey = GlobalKey<FormState>();

  String? nama = "";
  String? nomor = "";
  String? filePath;
  Color selectedColor = Colors.blue;

  DateTime? selectedDate = DateTime.now();
  final currentDate = DateTime.now();

  void pickFile() async {
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
    }

    for (var file in platformFiles) {
      _openFile(file);
    }
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    final contactBloc = BlocProvider.of<ContactBloc>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: secondaryColor,
        title: const Text('Contacts'),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              const Center(child: Icon(Icons.phone, size: 30.0)),
              const SizedBox(height: 15.0,),
              const Text('Create new Contact', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              const SizedBox(height: 5.0),
              const Text('Kumpulan Contact di Flutter Alterra Academy', style: TextStyle(fontSize: 15.0)),

              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: primaryColor,
                                labelText: 'Nama',
                                hintText: 'Masukkan Nama',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Masukkan Nama anda';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                nama = value;
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: primaryColor,
                                labelText: "Nomor",
                                hintText: "+62...",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Tolong Masukkan Nomor";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                nomor = value;
                              },
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Date'),
                                    TextButton(
                                      onPressed: () async {
                                        final pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(currentDate.year + 5),
                                        );

                                        setState(() {
                                          if (pickedDate != null){
                                            selectedDate = pickedDate;
                                          }
                                        });
                                      },
                                      child: const Text("Select Date"),
                                    ),
                                  ],
                                ),
                                Text(
                                  DateFormat("dd/MM/yyyy").format(selectedDate!),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 50.0,
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: selectedColor,
                                shape: BoxShape.rectangle,
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(primaryColor)),
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Pick your Color'),
                                      content: SingleChildScrollView(
                                        child: BlockPicker(
                                          pickerColor: selectedColor,
                                          onColorChanged: (value) {
                                            setState(() {
                                              selectedColor = value;
                                            });
                                          },
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Save'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text("Pick Color"),
                            ),
                            // menampilkan warna yang dipilih
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Pick File'),
                                Center(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(primaryColor)),
                                    onPressed: () async {
                                      FilePickerResult? result = await FilePicker.platform.pickFiles();
                                      if (result != null) {
                                        setState(() {
                                          filePath = result.files.single.path;
                                        });
                                      }
                                    },
                                    child: const Text("Pick File and Open File "),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(primaryColor)),
                                      child: const Text('Submit'),
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState!.save();

                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                            content: Text("Data berhasil disimpan"),
                                          ));

                                          // mengirim event untuk menambah kontak
                                          contactBloc.add(AddContactEvent(
                                            Data(
                                              nama: nama,
                                              nomor: nomor,
                                              selectedDate: selectedDate,
                                              selectedColor: selectedColor,
                                              filePath: filePath,
                                            ),
                                          ));

                                          setState(() {});
                                          formKey.currentState!.reset();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Tampilkan dataList dalam ListView
              Column(
                children: [
                  const Text(
                    'List Contact',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  BlocBuilder<ContactBloc, ContactState>(
                    builder: (context, state) {
                      final dataList = state.contacts;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: dataList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final data = dataList[index];
                          final firstName = data.nama?[0] ?? '';
                          return ListTile(
                            title: Text(data.nama ?? ''),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.nomor ?? ''),
                                Text('Date: ${DateFormat("dd/MM/yyyy").format(data.selectedDate ?? DateTime.now())}'),
                                Row(
                                  children: [
                                    const Text('Color: '),
                                    Container(
                                      width: 15,
                                      height: 15,
                                      color: data.selectedColor,
                                    ),
                                  ],
                                ),
                                Text('Path File: ${data.filePath ?? ""}'),
                              ],
                            ),
                            leading: CircleAvatar(
                              backgroundColor: secondaryColor,
                              child: Text(
                                firstName,
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    editData(context, index, contactBloc);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    deleteData(context, index, contactBloc);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deleteData(BuildContext context, int index, ContactBloc contactBloc) {
    // event untuk menghapus data kontak
    contactBloc.add(DeleteContactEvent(index));
  }

  void editData(BuildContext context, int index, ContactBloc contactBloc) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String editedName = contactBloc.state.contacts[index].nama ?? "";
        String editedNomor = contactBloc.state.contacts[index].nomor ?? "";

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
                // simpan perubahan menggunakan event EditContactEvent
                contactBloc.add(EditContactEvent(
                  index,
                  Data(
                    nama: editedName,
                    nomor: editedNomor,
                    selectedDate: contactBloc.state.contacts[index].selectedDate,
                    selectedColor: contactBloc.state.contacts[index].selectedColor,
                    filePath: contactBloc.state.contacts[index].filePath,
                  ),
                ));
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
