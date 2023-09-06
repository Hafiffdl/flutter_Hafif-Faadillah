# Platform Widget

1. MaterialApp widget yang memperkenalkan sejumlah widget Navigator, Tema yang diperlukan untuk membangun aplikasi desain material yang digunakan dalam flutter dan widget ini digunakan pada sistem operasi Android.

Struktur MaterialApp
- theme untuk mengatur tema aplikasi
- home sebagai halaman utama mengatur halaman juga dapat dilakukan dengan menggunakan routes dan initialRoute.
- route mendaftarkan halaman pada routes
- initial routes sebagai route utama

2. Scaffold untuk membuat sebuah halaman pada MaterialApp

Membuat tata letak dasar sebuah halaman:
- appBar untuk bar menu bagaian atas halaman
- drawer menu bagian samping halaman
- body bagian utama halaman
- bottomNavigationBar menu bagian bawah halaman

3. CupertinoApp dikembangkan oleh Apple. Hal ini didasarkan pada Pedoman Antarmuka Manusia Apple, yang menerapkan bahasa desain iOS.

Struktur CupertinoApp
- variabel _themeDark untuk menyimpan tema karena Cupertino tidak menyediakan tema seperti pada MaterialApp
- theme untuk mengatur tema aplikasi
- home sebagai halaman utama mengatur halaman

4. CupertinoPageScaffold untuk membuat halaman pada CupertinoApp

Membuat tata letak dasar sebuah halaman pada CupertinoApp
- navigationBar untuk bar menu bagian atas halaman
- child bagian utama halaman 

