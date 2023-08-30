class Tokobuku {
  Map<String, String> dataBuku = {
    "id"      : "01",
    "judul"   : "Dasar-dasar Teknik Informatika",
    "penerbit": "Novega",
    "harga"   : "30000",
    "kategori": "Buku Referensi"
  };

  tambahdata() {
    dataBuku.addAll({
      "id_2"      : "02",
      "judul_2"   : "Pengantar Teknologi Informasi",
      "penerbit_2": "Buhori",
      "harga_2"   : "10000",
      "kategori_2": "Buku Referensi"
    });

    dataBuku.addAll({
      "id_3"      : "03",
      "judul_3"   : "Metode Penelitian Teknik Informatika",
      "penerbit_3": "Ade Johar",
      "harga_3"   : "35000",
      "kategori_3": "Buku Referensi"
    });
  }

  hapusdata() {
    dataBuku.remove("id_2");
    dataBuku.remove("judul_2");
    dataBuku.remove("penerbit_2");
    dataBuku.remove("harga_2");
    dataBuku.remove("kategori_2");
    
    print("\n data buku telah di hapus");
    dataBuku.forEach((key, value) {
      print('$key: $value');
    });
  }

  tampildata() {
    print(dataBuku);
  }
}

void main() {
  var tb = Tokobuku();

  tb.tambahdata();
  tb.dataBuku.forEach((key, value) {
    print('$key: $value');
  });

  tb.hapusdata();
}