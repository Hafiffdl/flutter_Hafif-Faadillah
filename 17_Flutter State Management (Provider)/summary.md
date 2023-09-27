# Flutter State Management (Provider)

1. State merupakan data yang dapat dibaca saat kita membuat sebuah widget dan dapat berubah saat widget sedang aktif dan hanya dimiliki oleh stateful widget karena statefulwidget ini dinamis dalam menginisialisasi data

Memanfaatkan State
- dibuat sebagai property dari class contoh, var number = 0;
- digunakan pada widget saat melakukan build contoh, Text('$number');

Mengubah State
- dengan menggunakan method setState

2. Global State adalah state biasa yang di gunakan pada seluruh widget

3. Provider ini adalah state management dan jika ingin menggunakan provider ini perlu di install terkebih dahulu pada pub.dev

Instalasi Provider
- Menambahkan package provider pada dependencies dalam file pubspec.yaml
- lalu jalankan flutter pub get

Contoh Membuat State Provider
- Buat file bernama contact.dart defisinikan state dalam bentuk kelas seperti, class Contact with ChangeNotifier {}

Mendaftarkan State Provider 
- Import dalam file main.dart
- Daftarkan pada runApp dengan MultiProvider

Menggunakan State dari Provider
- Simpan provider dalam variable 
- Ambil data dari provider melalui getter 