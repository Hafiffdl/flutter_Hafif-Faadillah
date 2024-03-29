// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_api/models/book_model.dart';
import 'package:rest_api/utils/fetch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BookModel> books = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
    


  @override
  void initState() {
    super.initState();
    Dio()
        .get("https://bookapi-1-v1905306.deta.app/api/v1/books/")
        .then((response) {
      var data = response.data;
      for (var i = 0; i < data.length; i++) {
        books.add(BookModel.fromJson(data[i]));
      }
      setState(() {
        print(response);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    yearController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Screen2', style: GoogleFonts.poppins(fontSize: 20),),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
                Navigator.pushNamed(context, '/screen2'); // Navigasi ke screen 2
              },
            ),
            ListTile(
              title: Text('Screen3', style: GoogleFonts.poppins(fontSize: 20),),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
                Navigator.pushNamed(context, '/screen3'); // Navigasi ke screen 3
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add Book"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: "Title",
                      ),
                    ),
                    TextField(
                      controller: yearController,
                      decoration: const InputDecoration(
                        labelText: "Year",
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      var data = {
                        "book_id": books.length + 1,
                        "title": titleController.text,
                        "year": int.parse(yearController.text),
                      };
                      Dio()
                          .post(
                            "https://bookapi-1-v1905306.deta.app/api/v1/books/",
                            data: jsonEncode(data),
                          )
                          .then((response) {
                        var responseDetail = response.data["detail"];
                        Navigator.pop(context);
                        if (responseDetail["status_code"] == 201) {
                          CherryToast(
                            icon: Icons.alarm_add,
                            themeColor: Colors.amber,
                            title: const Text(""),
                            displayTitle: false,
                            description: const Text("Data Berhasil Ditambahkan",
                            style: TextStyle(color: Colors.black)),
                            toastPosition: Position.bottom,
                            animationDuration:
                            const Duration(milliseconds: 1000),
                            autoDismiss: true,
                          ).show(context);
                          books.add(BookModel.fromJson(response.data["data"]));
                          setState(() {});
                        } else {
                          print("Data Gagal Ditambahkan");
                        }
                        titleController.clear();
                        yearController.clear();
                      });
                    },
                    child: const Text("Save"),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: books.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(books[index].title),
              subtitle: Text(books[index].year.toString()),
              trailing: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Icon Delete Berhasil Ditekan");
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Delete Book"),
                            content: const Text(
                                "Are you sure want to delete this book?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  var response =
                                      await deleteData(books[index].bookId);
                                  var responseDetail = response["detail"];
                                  if (responseDetail["status_code"] == 200) {
                                    CherryToast(
                                      icon: Icons.check,
                                      themeColor: Colors.amber,
                                      title: const Text(""),
                                      displayTitle: false,
                                      description: const Text(
                                          "Data Berhasil Dihapus",
                                          style:
                                              TextStyle(color: Colors.black)),
                                      toastPosition: Position.bottom,
                                      animationDuration:
                                          const Duration(milliseconds: 1000),
                                      autoDismiss: true,
                                    ).show(context);
                                    books.removeAt(index);
                                    setState(() {});
                                  } else {
                                    print("Data Gagal Dihapus");
                                  }
                                  Navigator.pop(context);
                                },
                                child: const Text("Delete"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Icon(Icons.delete),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          titleController.text = books[index].title;
                          yearController.text = books[index].year.toString();
                          return AlertDialog(
                            title: const Text("Edit Book"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: titleController,
                                  decoration: const InputDecoration(
                                    labelText: "Title",
                                  ),
                                ),
                                TextField(
                                  controller: yearController,
                                  decoration: const InputDecoration(
                                    labelText: "Year",
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  var data = {
                                    "book_id": books[index].bookId,
                                    "title": titleController.text,
                                    "year": int.parse(yearController.text),
                                  };
                                  var response = await updateData(
                                      books[index].bookId, data);
                                  var responseDetail = response["detail"];
                                  if (responseDetail["status_code"] == 200) {
                                    CherryToast(
                                      icon: Icons.check,
                                      themeColor: Colors.amber,
                                      title: const Text(""),
                                      displayTitle: false,
                                      description: const Text(
                                          "Data Berhasil Diubah",
                                          style:
                                              TextStyle(color: Colors.black)),
                                      toastPosition: Position.bottom,
                                      animationDuration:
                                          const Duration(milliseconds: 1000),
                                      autoDismiss: true,
                                    ).show(context);
                                    books[index] = BookModel.fromJson(data);
                                    setState(() {});
                                  } else {
                                    print("Data Gagal Diubah");
                                  }
                                  Navigator.pop(context);
                                  titleController.clear();
                                  yearController.clear();
                                },
                                child: const Text("Update"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Icon(Icons.edit),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
