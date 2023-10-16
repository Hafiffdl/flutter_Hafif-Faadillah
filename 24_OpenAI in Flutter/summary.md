# OpenAI in Flutter

1. OpenAI Introduction 
OpenAI adalah sebuah library yang dapat digunakan untuk memanfaatkan teknologi AI
yang disediakan oleh OpenAI, Library ini nantinya dapat diintegrasikan dengan berbagai aplikasi seperti API, web dan mobile

Keuntungan OpenAI
- Gratis 
- Dapat digunakan di berbagai perangkat
- mudah dipasang, dan jumlah parameter 175 miliar (model davinci 03)

2. Project Overview
- Mendapatkan API Key dari OpenAI
- Membuat project flutter
- Melakukan Instalasi berbagai package: flutter pub add http, flutter pub add intl, flutter pub add envied, flutter pub add --dev envied_generator, dan flutter pub add --dev build_runner
- Membuat file konfigurasi, jika menggunakan Git. Pastikan file .env dan env.g.dart sudah di tambahkan di dalam file .gitignore.
- Membaca file konfigurasi
- Melakukan Generate code untuk membaca .env dengan perintah flutter pub run build_runner build
- Membuat Variabel untuk menyimpan API Key
- Membuat data model
- Membuat komponen service
- Membuat halaman beranda
- Membuta halaman daftar rekomendasi
- Membuat Konfigurasi di main.dart


3. atau dengan cara sederhana
- Daftar di OpenAI: Anda perlu membuat akun di OpenAI dan meminta izin untuk menggunakan API mereka.
- Dapatkan API Key: Setelah akun Anda diizinkan, Anda akan menerima kunci API, yang digunakan untuk mengakses layanan OpenAI.
- Integrasikan dengan Flutter: Dalam proyek Flutter Anda, Anda perlu menginstal plugin http untuk menghubungkan aplikasi Anda dengan API OpenAI. Kemudian, Anda membuat kode dalam aplikasi yang akan mengirim permintaan ke OpenAI dengan menggunakan API Key tersebut.
- Proses Respons: Setelah OpenAI memberi respons, Anda akan menggunakan hasilnya dalam aplikasi Flutter Anda, misalnya, untuk menampilkan teks yang dihasilkan atau untuk melakukan tindakan lain yang sesuai dengan tujuan aplikasi Anda.