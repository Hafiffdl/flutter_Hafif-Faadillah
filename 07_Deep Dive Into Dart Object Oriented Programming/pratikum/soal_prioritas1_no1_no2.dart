class Bangunruang {
  int panjang, lebar, tinggi;

  int volume() {
    return panjang * lebar * tinggi;
  }

  Bangunruang(this.panjang, this.lebar, this.tinggi);
}

class Kubus extends Bangunruang{
  int s;

  @override
  int volume() {
    return s * s * s;
  }

  Kubus(this.s) : super(s, s, s);
}

class Balok extends Bangunruang{
  Balok(int panjang, int lebar, int tinggi) : super(panjang, lebar, tinggi);
  @override
  int volume() {
    return panjang * lebar * tinggi;
  }
  }

void main(){
  var volumeKubus = Kubus(22);
  var volumeBalok = Balok(10, 5, 2);

  print('volume Kubus = ${volumeKubus.volume()}');
  print('volume Balok = ${volumeBalok.volume()}');
}