import 'package:flutter/material.dart';
import 'package:flutter_assets/constant/constant.dart';
import 'package:flutter_assets/new_page.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  // Daftar gambar yang akan ditampilkan pada BottomSheet
  List<String> image = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image5.jpg',
    'assets/images/image6.jpg',
    'assets/images/image7.jpg',
    'assets/images/image8.jpg',
  ];

void _showImageBottomSheet(int index) {
    showModalBottomSheet(
      backgroundColor: Colors.deepPurple[400],
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.deepPurple[400]!,
              width: 50.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.deepPurple[400]!,
                      width: 10.0,
                    ),
                  ),
                ),
                child: Image.asset(image[index]), // Menampilkan gambar di BottomSheet
              ),
              Text('Gambar ${index + 1}', 
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
              Text('Apakah kamu ingin melihat lebih detail?', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _navigateToNewPage(image[index]);
                    },
                    child: const Text('Iya'),
                  ),
                  const SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); 
                    },
                    child: const Text('Tidak'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Fungsi untuk pergi ke halaman baru dengan gambar yang dipilih
  void _navigateToNewPage(String image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewPage(image: image),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('List Gallery', style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 2.0,
          ),
          itemCount: image.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _showImageBottomSheet(index);
              },
              child: Image.asset(image[index]),
            );
          },
        ),
      ),
    );
  }
}