int hitungTotalHarga(int hargaBuku, int hargaPensil, int hargaTas, int jumlahBuku, int jumlahPensil, int jumlahTas) {
  return (hargaBuku * jumlahBuku) + (hargaPensil * jumlahPensil) + (hargaTas * jumlahTas);
}

void main() {
  var hargaBuku = 10000;
  var hargaPensil = 5000;
  var hargaTas = 100000;

  var jumlahBuku = 1;
  var jumlahPensil = 3;
  var jumlahTas = 2;

  var totalBelanja = hitungTotalHarga(hargaBuku, hargaPensil, hargaTas, jumlahBuku, jumlahPensil, jumlahTas);
  double diskon = hitungDiskon(totalBelanja);
  double hargaSetelahDiskon = totalBelanja - diskon;
  
  print("Total harga sebelum diskon: $totalBelanja");
  print("Diskon 10%: $diskon");
  print("Total harga setelah diskon: $hargaSetelahDiskon");
}
  double hitungDiskon(int totalBelanja) {
  double diskon = 0.1 * totalBelanja; 
  return diskon;
}