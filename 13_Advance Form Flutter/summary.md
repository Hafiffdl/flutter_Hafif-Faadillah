# Advance Form Flutter

1. Interactive Widgets
- Interaksi antara aplikasi dan user dan mengumpulkan input dan feedback dari user

2. Date picker widget yg dimana user dapat memasukkan tanggakl seperti, tanggal kelahiran, waktu pemesanan tiket, dan jadwal meeting

Membuat Date Picker 
- menggunakan fungsi bawaan flutter showDatePicker
- fungsi showDatePicker memiliki tipe data future dan menampilkan dialog material date picker
- menambahkan packages intl di pubspec.yaml copy saja dari pub.dev
- mempersiapkan variabel, membangun UI, menambahkan showDatePicker pada onPressed, serta memanggil fungsi setState pada onPressed 

3. Color Picker widget untuk user dapat memilih user

Membuat color picker
- menggunakan packages flutter_colorpicker
- menambahkan packages flutter_colorpicker di pubspec.yaml copy saja dari pub.dev
- mempersiapkan variabel, membangun UI, menambahkan showDialog pada onPressed dengan return widget AlertDialog, import packages flutter_colorpicker dalam file dart
- packages flutter_colorpicker memiliki custom widget yaitu BlockPicker, ColorPicker dan SlidePicker

4. File Picker widget yang dapat mengakses storage dan juga dapat memilih dan membuka file

Membuat File Picker
- menggunakan packages file_picker dan open_file
- menambahkan packages file_picker dan open_file di pubspec.yaml copy saja dari pub.dev
- import packages file_picker dan open_file dalam file dart, membangun Ui, Membuat fungsi untuk mengexplore dan memilih file dari storage
- memanggil fungsi _pickFile didalam onPressed
- membuat fungsi open file, dan mengambil file dari object result dengan memanggilnya di dalam fungsi _pickFile
