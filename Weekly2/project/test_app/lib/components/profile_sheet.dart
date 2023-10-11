import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/screen/login_screen.dart';

class ProfileSheet extends StatefulWidget {
  const ProfileSheet({Key? key}) : super(key: key);

  @override
  State<ProfileSheet> createState() => _ProfileSheetState();
}

class _ProfileSheetState extends State<ProfileSheet> {
  late SharedPreferences loginData;
  String username = '';

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/logo.png'),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              username,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.grey),
              ),
              onPressed: () {
                loginData.setBool('login', true);
                loginData.remove('username');
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (route) => false,
                );
              },
              child: Text(
                'Log Out',
                style: GoogleFonts.poppins(fontSize: 17,
                color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
