import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout/constant/constant.dart';

class FlutterForm extends StatefulWidget {
  const FlutterForm({super.key});

  @override
  State<FlutterForm> createState() => _FlutterFormState();
}

class _FlutterFormState extends State<FlutterForm> {
  var formKey = GlobalKey<FormState>();
  
  String? nama = "";
  String? nomor = "";
  List<Data> dataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Center(child: Text('Contacts')),
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Center(child: Icon(Icons.phone, size: 40.0)),
            const SizedBox(height: 15.0,),
            const Text('Create new Contact', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            const SizedBox(height: 8.0), 
            const Text('Kumpulan Contact di Flutter Alterra Academy', style: TextStyle(fontSize: 15.0)),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
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

                              else if (value.trim().split(' ').length < 2) {
                                return 'Nama harus terdiri minimal 2 kata';
                              }

                              for (var word in value.trim().split(' ')) {
                                if (!RegExp(r"^[A-Z][a-z]*$").hasMatch(word)) {
                                  return 'Setiap kata harus diawali huruf kapital';
                                } 
                                if (RegExp(r'[0-9!@#%^&*(),.?":{}|<>]').hasMatch(word)) {
                                  return 'Nama tidak boleh mengandung angka atau karakter khusus';
                                }
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

                              if (!RegExp(r"^\d+$").hasMatch(value)) {
                                return "Nomor harus terdiri dari angka saja";
                              }

                              else if (value.length < 8 || value.length > 15) {
                                return "Nomor harus minimal 8 digit dan maksimal 15 digit";
                              }

                              else if (!value.startsWith("0")) {
                                return "Nomor harus diawali angka 0";
                              }

                              return null;
                            },
                            onSaved: (value) {
                              nomor = value;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(secondaryColor)),
                                child: const Text('Submit'),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();

                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text("Data berhasil disimpan"),
                                    ));

                                    dataList.add(Data(
                                      nama: nama,
                                      nomor: nomor,
                                    ));

                                    setState(() {});
                                    formKey.currentState!.reset();

                                    for (var data in dataList) {
                                      if (kDebugMode) {
                                        print('Nama: ${[data.nama]}, Nomor: ${[data.nomor]}');
                                      }
                                    }
                                  }
                                },
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
            Expanded(
              child: Column(
                children: [
                  const Text(
                    'List Contact',
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: dataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data = dataList[index];
                        final firstName = data.nama?[0] ?? '';

                        return ListTile(
                          title: Text(data.nama ?? ''),
                          subtitle: Text(data.nomor ?? ''),
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
                                  editData(index);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  deleteData(index);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteData(int index) {
    setState(() {
      dataList.removeAt(index);
    });

    for (var data in dataList) {
      if (kDebugMode) {
        print('Nama: ${[data.nama]}, Nomor: ${[data.nomor]}');
      }
    }
  }

  void editData(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String editedName = dataList[index].nama ?? "";
        String editedNomor = dataList[index].nomor ?? "";

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

                setState(() {});
                Navigator.of(context).pop(); 

                for (var data in dataList) {
                  if (kDebugMode) {
                    print('Nama: ${[data.nama]}, Nomor: ${[data.nomor]}');
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
}

class Data {
  Data({required this.nama, this.nomor});

  String? nama;
  String? nomor;
}
