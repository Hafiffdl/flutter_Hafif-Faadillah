class Course {
  String judul; 
  String deskripsi;
  Course(this.judul, this.deskripsi);
}

class Student {
  List<Course> daftarCourse = [];
  String nama; 
  String kelas;
  Student(this.nama, this.kelas);

  void tambahCourse(Course course) {
    daftarCourse.add(course);
  }

  void hapusCourse(Course course) {
    print("data course telah di hapus");
    daftarCourse.remove(course);
  }

  void tampilkanDaftarCourse() {
    if (daftarCourse.isEmpty) {
      print("$nama belum mempunyai course.");
    } else {
      print("Daftar course milik $nama, $kelas:");
      for (var course in daftarCourse) {
        print("Judul: ${course.judul}, Deskripsi: ${course.deskripsi}");
      }
    }
  }
}

void main() {
  var course = Course("Javascript", "Javascript untuk pemula");
  var course2 = Course("Flutter", "Widget Flutter");
  var student = Student("Hafif Faadillah", "Kelas C");

  student.tambahCourse(course);
  student.tambahCourse(course2);

  print("\nSetelah menambahkan beberapa Course");
  print("==========================================");

  student.tampilkanDaftarCourse();
  print("==========================================");

  student.hapusCourse(course);
  
  print("\nSetelah menghapus Course");
  print("==========================================");

  student.tampilkanDaftarCourse();
} 