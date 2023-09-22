# Assets

1. Assets file yang di bundled dan di-deploy dengan aplikasi, dan dapat diakses saat runtime. Jenis assets yang umum digunakan seperti, data statis (misalnya, file JSON), file konfigurasi, icons, dan images (JPEG, WebP, GIF, WebP/GIF animasi, PNG, BMP, dan WBMP) serta font file (ttf)

Menentukan Assets
- Menggunakan pubspec.yaml
- Pada pubspec.yaml yang terletak di root project, agar assets yang dibutuhkan aplikasi dapat di gunakan, dan gunakan karakter "/" untuk memasukan semua assets yang di butuhkan dibawah satu directory name yaitu 
assets:
  - assets/

2. Image file yang mendukung format gambar (JPEG, WebP, GIF, WebP/GIF animasi, PNG, BMP, dan WBMP). image ini akan membuat aplikasi kita menjadi lebih menarik dilihat dan juga image dapat di tampilkan melalui project assets dan internet.

Loading Image
Cara pertama
- Gunakan widget Image
- Menggunakan property image dengan class AssetsImage()

Loading Image
Cara kedua
- Menggunakan method Image.assets() agar mendapatkan image yg sudah ada di dalam project/folder assets
- Menggunakan method Image.network() dapat mengambil image melalui internet dengan url nya saja

3. Font ini merupakan style dari font yang menjadi keunikan pada aplikasi, contohnya font poppins. penentuan font yang mau dipakai biasanya oleh UI designer. penerapan font menggunakan custom font atau dari package seperti, package google_font pada pub.dev

Cara menggunakan Custom Font
- Cari dan Download font di https://fonts.google.com/ yang sering dipakai.
- Import file .ttf
- Daftar kan font tersebut di pubspec.yaml
- Mengatur font sebagai default aplikasi contoh, home: ThemeData(fontFamily: 'Rowdies')
- Gunakan font di widget contoh, pada widget Text bagian fontFamily: 'Rowdies'

Cara menggunakan Font dari package
- Tambahkan font google_fonts di dependencies di pubspec.yaml
- import package di file dart
- Gunakan font dengan memanggil GoogleFonts.namaFont()