# Flutter Navigation

1. Navigation adalah proses untuk berpindah halaman dalam sebuat aplikasi flutter. Navigation ini sangat memudahkan pengguna untuk berinteraksi dengan halaman halaman lainnya yg ada pada aplikasi flutter tersebut.

2. Navigation Dasar

- Navigator.push() digunakan untuk melakukan perpindahan halaman ke halaman lainnya di dalem aplikasi flutter. kasus nya seperti menekan tommbol berteks (iya) jika di tekan maka akan berpindah halaman.

- Navigator.pop() digunakan untuk kembali ke halaman sebelumnya pada aplikasi flutter.
kasus nya seperti menekan tombol Kembali.

Mengirim Data ke halaman baru 
- Menggunakan parameter constructor halaman.

3. Navigation dengan Named Routes // Tiap halaman memiliki alamat yang disebut route

- Navigator.pushNamed() untuk melakukan perpindahan halaman ke halaman lainnya dengan menggunakan (named routes).

4. Mendaftarkan Route 
- Tambahkan initialRoute dan routes pada MaterialApp dengan simbol '/'
- Tiap route adalah fungsi yg membentuk halaman

Contoh perpindahan halaman Navigator.of(context).pushNamed('/secondpage')