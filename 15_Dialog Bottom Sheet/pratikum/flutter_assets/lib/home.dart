import 'package:flutter/material.dart';
import 'package:flutter_assets/new_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      
  // untuk menampilkan iya atau tidak
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
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text('Gallery Image', style: GoogleFonts.poppins(fontSize: 20),),
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 1.0,
            mainAxisExtent: 160.0,
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
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Contact', style: GoogleFonts.poppins(fontSize: 20),),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
                Navigator.pushNamed(context, '/contact'); // Navigasi ke halaman Contact
              },
            ),
            ListTile(
              title: Text('Galeri', style: GoogleFonts.poppins(fontSize: 20),),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
                Navigator.pushNamed(context, '/galeri'); // Navigasi ke halaman Galeri
              },
            ),
          ],
        ),
      ),
    );
  }
}
