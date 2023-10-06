# MVVM Architecture

1. MVVM (Model-View ViewModel) adalah memeisahkan login dengan tampilan (View) ke dalam ViewModel

2. Keuntungan dari MVVM yaitu,
- Reusability jika ada beberapa tampilan yang memerlukan login yang sama dengan tampilannya lainnya maka mereka dapat menggunakan ViewModel yang sama
- Maintainability Mudah dirawat karena pekerjaan terkait tampilan tidak akan tertumpuk bersama logic
- Testability pengujian menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga dapat meningkatkan produktivitas pada pengujian

3. Melakukan MVVM
Struktur Direktori
- Model memliki 2 bagian, yaitu bentuk data yang akan digunakan dan sumber dari data tersebut
- Tiap screen diletakkan dalam sebuah direktori yang didalamnya terdapat View dan ViewModel

Model
- Bentuk data yang akan digunakan, dibuat dalam bentuk class 
- Data-data yang dimuat, diletakkan pada bagian property

Model API
ViewModel 
- Menyimpan data-data dan logic yang diperlukan halaman ContactScreen
- Jika widget lain memerlukan logic yang sama, dapat menggunakan ViewModel ini juga

Mendaftarkan ViewModel
- Menggunakan MultiProvider agar dapat menggunakan banyak ViewModel
- MaterialApp sebagai child utama

View
- Menggunakan Statefulwidget 

Menampilkan Data di ViewM
- Letakkan pada bagian build
- Menggunakan getters yang ada pada ViewModel
- Data dapat langsung ditampilkan pada widgets
