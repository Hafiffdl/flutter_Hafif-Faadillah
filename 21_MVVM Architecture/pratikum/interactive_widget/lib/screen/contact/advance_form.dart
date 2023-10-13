import 'package:flutter/material.dart';
import 'package:interactive_widget/constant/constant.dart';
import 'package:interactive_widget/screen/contact/advance_form_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AdvanceForm extends StatelessWidget {
  const AdvanceForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AdvanceFormViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Center(child: Text('Contacts')),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              const Center(child: Icon(Icons.phone, size: 30.0)),
              const SizedBox(height: 15.0),
              const Text('Create new Contact',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5.0),
              const Text('Kumpulan Contact di Flutter Alterra Academy',
                  style: TextStyle(fontSize: 15.0)),
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    Form(
                      key: viewModel.formKey,
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
                                viewModel.nama = value;
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
                                viewModel.nomor = value;
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
                                      onPressed: () {
                                        viewModel.selectDate(context);
                                      },
                                      child: const Text("Select Date"),
                                    ),
                                  ],
                                ),
                                Text(
                                  DateFormat("dd/MM/yyyy").format(viewModel.selectedDate ?? DateTime.now()),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 50.0,
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: viewModel.selectedColor,
                                shape: BoxShape.rectangle,
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(secondaryColor),
                              ),
                              onPressed: () async {
                                viewModel.selectColor(context);
                              },
                              child: const Text("Pick Color", style: TextStyle(color: primaryColor),
                              ),
                            ),
                            // Menampilkan warna yang dipilih
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Pick File'),
                                Center(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(secondaryColor),
                                    ),
                                    onPressed: () async {
                                      viewModel.pickFile();
                                    },
                                    child: const Text("Pick File and Open File", style: TextStyle(color: primaryColor),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(secondaryColor),
                                      ),
                                      child: const Text('Submit', style: TextStyle(color: primaryColor),
                                      ),
                                      onPressed: () {
                                        viewModel.submitData(context);
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
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: viewModel.dataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = viewModel.dataList[index];
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
                            Text('Path File: ${data.filePath}'),
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
                                viewModel.editData(context, index);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                viewModel.deleteData(index);
                              },
                            ),
                          ],
                        ),
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
}
