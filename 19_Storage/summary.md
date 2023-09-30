# Storage

1. Penyimpanan Lokal 
- Diperlukan untuk efisiensi penggunaan data internet dan ada beberapa cara untuk implementasi penyimpanan lokal contohnya, Shared Preferences dan Local Database seperti SQLite

2. Shared Preferences 
- menyimpan data yang sederhana sepeti case login dan menyimpan riwayat pencarian
- penyimpanan ini menggunakan format key-value
- menyimpan tipe data dasar seperti teks, angka, dan booelan

Impelementasi Shared Preferences tambahkan package shared_preferences pada pubspec.yaml

3. Local Database (SQLite) adalah database SQL yang kecil, cepat, dan sepenuhnya transaksional.
- menyimpan dan meminta data dalam jumlah besar pada local device
- bersifat privat
- untuk menggunakan SQLite ini memlalui package sqflite pada pub.dev
- SQLite adalah database opensource yang mendukung insert, read, update, dan remove.

Implementasi SQLite dengan cara menambahkan package sqflite dan path pada pubspec.yaml