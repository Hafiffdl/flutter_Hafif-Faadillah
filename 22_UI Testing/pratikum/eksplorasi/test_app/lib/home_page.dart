import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();

  final List<String> learningItems = [
    'Learn Flutter',
    'Learn ReactJS',
    'Learn VueJS',
    'Learn Tailwind CSS',
    'Learn UI/UX',
    'Learn Figma',
    'Learn Digital Marketing',
  ];
  Map<String, bool> favorites = {};
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('Aplikasi Belajar'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  const Text(
                    'Selamat datang di Aplikasi Belajar Kami!',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  Image.asset(
                    'assets/welcome_page.png',
                    width: 500.0,
                    height: 600.0,
                  ),
                  const SizedBox(height: 20.0),
                  Image.asset(
                    'assets/logo.png',
                    width: 200.0,
                    height: 200.0,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Aplikasi ini memiliki banyak pembelajaran bahasa pemrograman yang dapat membantu kamu dalam membuat Aplikasi sendiri dengan bahasa pemrograman yang kita pelajari.',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Ada beberapa pembelajaran di Aplikasi ini:',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          for (var item in learningItems)
            Card(
              margin: const EdgeInsets.all(16.0),
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/learn.jpg',
                      width: 100.0,
                      height: 50.0,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(item),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: favorites[item] == true ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                favorites[item] = !(favorites[item] == true);
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          Card(
            margin: const EdgeInsets.all(16.0),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('Need to get in touch with us? Enter fill out the form with your inquiry or find department email you like to contact below.'),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: TextFormField(
                              controller: firstNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your first name';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'First Name',
                                hintText: 'First Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: lastNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your last name';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Last Name',
                                hintText: 'Last Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: messageController,
                      maxLines: 3,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your message';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Message',
                        hintText: 'Message',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                        String firstName = firstNameController.text;
                        String lastName = lastNameController.text;
                        String email = emailController.text;
                        String message = messageController.text;

                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Form Data'),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                  Text('First Name: $firstName'),
                                  Text('Last Name: $lastName'),
                                  Text('Email: $email'),
                                  Text('Message: $message'),
                                  ],
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                          firstNameController.clear();
                          lastNameController.clear();
                          emailController.clear();
                          messageController.clear();

                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Data tersimpan'),
                          ));
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}