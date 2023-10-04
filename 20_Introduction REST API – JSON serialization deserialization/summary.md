# Introduction REST API – JSON serialization/deserialization

1. REST API (Representatitonal State Transfer Application Programming Interface) merupakan Arsitektural yang memisahkan tampilan dengan proses bisnis, bagian tampilan dengan proses bisnis dapat berikirim data melalui HTTP Request, dan mampu memberikan kemudahan dalam pengembangan aplikasi mobile melalui Flutter

2. HTTP Protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk medis web

Pola Komunikasi 
- Client mengirim request
- server mengolah dan memabalas dengan memberikan response

Struktur Resquest
- Url alamat halaman yang akan diakses
- method (GET, POST, PUT, DELETE) menunjukkan aksi yang diinginkan
- Headder informasi tambahaan terkait request yang dikirimkan
- Body Data yang disertakan bersama request

Struktur Response
- Status Code Kode yang mewakili keseluruhan response. baik sukses maupun gagal
- Header Informasi tambahan terkait response yang diberikan
- Body Data yang di sertakan bersama response

3. Dio (package Dio) sebagai HTTP Client dan dapat Dimanfaatkan untuk melakukan REST API
caranya menggunakan Dio adalah Tambahkan dependency di pubspec.yaml dan run flutter pub get di terminal 

4. Serialisasi JSON proses mengubah objek Dart menjadi format JSON, atau sebaliknya, mengubah data JSON menjadi objek Dart, umum digunakan pada REST API. Serialisasi JSON menggunakan dungsi jsonEncode dari package dart:convert

- Mengubah struktur data ke bentuk JSON
Map/List -> Serialisasi -> JSON

Deserialisasi JSON 
- Mengubah bentuk JSON ke struktur data
JSON -> Deserialisasi -> Map/List