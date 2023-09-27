# Flutter State Management (BLoC)

1. Declarative UI artinya flutter membangun UI nya atau tampilannya pada screen untuk mencerminkan keadaan state saat ini
UI the layout of screen = f your build methods (state) the application state

2. State adalah ketika sebuah widget sedang aktif dan widget tersebut menyimpan data di memori. 
- Flutter akan membangun ulang UI nya ketika ada state atau data yang berubah. 
- Ada 2 jenis state dalam flutter, ephemeral state dan app state.

3. Ephemeral State mengacu pada status sementara atau data sementara yang ditangani widget atau komponen Flutter selama pemakaian widget tersebut.

-Digunakan ketika tidak ada bagian lain pada widget tree yang membutuhkan untuk megakses data widgetnya, 
contohnya: -PageView, -BottomNavigationBar, -Switch Button 
-Tidak perlu state management yang kompleks, -Hanya membutuhkan StatefulWidget dengan menggunakan fungsi setState()

4. App State dapat diakses dari berbagai bagian aplikasi dan dapat diubah oleh berbagai widget.
-Digunakan ketika bagian yang lain suatu aplikasi membutuhkan akses ke data state widget contohnya: -Login info, -Pengaturan preferensi pengguna, -Keranjang belanja, dimana informasi yang pengguna pilih di suatu screen yang mana informasi itu akan muncul di screen yang berbeda.

5. Pendekatan State Management 
-setState lebih cocok penggunaannya pada ephemeral state 
-Provider penggunaan untuk state management yang lebih kompleks seperti app state, pendekatan ini direkomendasikan oleh tim flutter karena mudah dipejari. 
-Bloc menggunakan pola stream/observable, untuk memisahkan UI dengan bisnis logic nya.

6. Provider
Class yang perlu di perhatikan dalam penggunaan provider yaitu:
- Dari package Provider: -ChangeNotifierProvider, -MultiProvider, -Consumer
- Built in class dari flutter SDK: -ChangeNotifer

- ChangeNotifier Class yang menambah dan menghapus listeners memanggil notifyListeners().
- ChangeNotifierProvider widget yang membungkus sebuah class. menggunakan create, provider akan menyimpan model yg telah dibuat.

7. BLoC untuk memisahkan antara business logic dengan UI
Cara kerja BLoc, -menerima event sebagai input, -Di analisa dan dikelola di dalam BLoc, -Menghasiilkan state sebagai output.

- Stream - Rangkaian proses secara asynchronous, - Actor utama di dalam BLoc