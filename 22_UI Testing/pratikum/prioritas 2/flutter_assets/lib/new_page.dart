import 'package:flutter/material.dart';
import 'package:flutter_assets/constant/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPage extends StatelessWidget {
  const NewPage({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: secondaryColor,
        title: Text('Image Detail', style: GoogleFonts.poppins(fontSize: 20)),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.5),
                    spreadRadius: 8,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  image,
                  width: 400.0,
                  height: 250.0,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child:Text(
                'Kembali',
                style: GoogleFonts.poppins(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
