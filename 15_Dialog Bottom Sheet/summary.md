# Dialog Bottom Sheet

1. Aplikasi Task Management adalah aplikasi yg dapat menambahkan dan menghapus kegiatan di aplikasi tersebut

Disini ada beberapa TODO sebagai berikut:
- TODO 1: Membuat model untuk informasi yang mau disimpan, dengan buat folder models dan didalam nya dibuat file dart baru seperti task_model.dart
- TODO 2: Mmebuat Task screen, dengan buat folder screens didalamnya dibuat file task_screen.dart
- TODO 3: Membuat Empty Screen, dengan buat file task_empty_screen.dart di folder screens
- TODO 4: Tmabahkan package provider di pubspec.yaml
- TODO 5: Membuat Task Manager, dengan buat file task_manager.dart di folder models dan tambahkan method deletTask dan addTask
- TODO 6: Pada main.dart tambahkan TaskManager sebagai provider
- TODO 7: Pada tas_screen.dart membuat fungsi buildTaskScreen, akan me-return antara Task Screen yang ada datanya atau yang kosong, maka panggil fungsinya di body
- TODO 8: Membuat Task Item Screen, buat file baru task_item_screen.dart di dalam folder screens dan tambahkan property onCreate
- TODO 9: Pada task_screen.dart buat FloatingActionButton, untuk navigasi ke TaskItemScreen
- TODO 10: Pada task_item_screen.dart tambahkan state properti, initState, dan dispose
- TODO 11: Pada task_item_screen.dart buat buildNameField dan panggil fungsinya di Listview
- TODO 12: Pada task_item_screen.dart buat buildButton dan panggil fungsinya di Listview dengan buildButton()
- TODO 13: Membuat Task Item Card, buat folder baru components lalu didalamnya buat file dart baru yaitu task_item_card.dart
- TODO 14: Pada task_item_screen.dart tambahkan call back handler di ElevatedButton pada buildButton, dan menambahkan package uuid bisa di download lewat pub.dev
- TODO 15: Membuat Task List Screen, dalam folder screens buat file baru task_list_screen.dart. dan tambahkan build TaskScreen task_screen.dart
- TODO 16: Pada task_list_screen.dart tambahkan properti dibutuhkan pada TaskItemCard untuk melihat task yang sudah dibuat

2. AlertDialog adalah widget yang menampilkan menampilkan popup untuk memeberi tahu pengguna tentang situasi tertentu, dapat digunakan untuk mendapatkan input dari user, membutuhkan helper method showDialog

Cara membuat AlertDialog
- TODO 17: Pada task_item_card.dart tambahkan AlertDialog, memanggil fungsi showDialog di dalam fungsi onPressed pada iconButton, showDialog butuh context dan builder, dibagian builder akan me-return AlertDialog
- AlertDialog sediakan properti seperti content dan actions. content bisa dimasukian widget text, image, dan animation sedangkan actions menambahkan button untuk menerima respon dari user
- TODO 18: Pada task_item_card.dart membuat properti onPressed
- TODO 19: Pada task_list_screen.dart tambahkan properti onPressed pada TaskItemCard, pada body fungsinya ditambahkan method deleteTask,Navigator.pop(context), dan ScaffoldMessenger

3. Bottom Sheet merupakan menu pilihan yang disembunyikan dibagian bawah layar, yang bisa ditarik keatas untuk menampilkan menu layar tersebut. Menggunakan fungsi bawaan flutter showModalBottomSheet dan membutuhkan dua properti, context dan builder

Cara membuat Bottom Sheet
- TODO 20: Pada task_screen.dart membuat Bottom Sheet
- TODO 21: Buat file baru profile_sheet.dart didalam folder components dan buat konten-konten nya
- TODO 22: Pada task_screen.dart mengganti widget Container pada builder showModalBottomSheet menjadi ProfileSheet()