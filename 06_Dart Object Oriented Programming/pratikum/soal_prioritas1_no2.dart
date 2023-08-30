class Mobil {
  double kapasitas;
  double totalMaksimumMuatan = 0;
  List<String> muatan = [];

  Mobil(this.kapasitas);

  void tambahMuatan(String listhewan, double beratHewan) {
    if (totalMaksimumMuatan + beratHewan <= kapasitas) {
      muatan.add(listhewan);
      totalMaksimumMuatan += beratHewan;
      print("$listhewan ditambahkan sebagai muatan dengan Berat: $beratHewan kg");
    } 
    else {
      print("Muatan melebihi kapasitas maksimum!");
    }
  }
  
    double totalMuatan() {
    return totalMaksimumMuatan;
  }
}
void main() {      
  Mobil mobil = Mobil(1500);
  print("Kapasitas mobil: ${mobil.kapasitas} kg");

  mobil.tambahMuatan("Ayam", 500);
  mobil.tambahMuatan("Sapi", 100);
  mobil.tambahMuatan("Kambing", 80);
  
  print("Muatan saat ini: ${mobil.muatan}");
  print("Total berat muatan: ${mobil.totalMuatan()} kg");
}
