class Matematika {
  hasil() {
    print("Hasil KPK: ${KelipatanPersekutuanTerkecil(5, 8).hasil()}");
    print("Hasil FPB: ${FaktorPersekutuanTerbesar(5, 6).hasil()}");
  }
}

class KelipatanPersekutuanTerkecil implements Matematika{
  int x, y;

  KelipatanPersekutuanTerkecil(this.x, this.y);

  @override
  hasil() {
    if (x > y && x != 0 && y != 0) {
      for (int i = x; i <= x * y; i++) {
        if (i % x == 0 && i % y == 0) {
          return i;
        }
      }
    } else if (y > x && x != 0 && y != 0) {
      for (int i = y; i <= x * y; i++) {
        if (i % x == 0 && i % y == 0) {
          return i;
        }
      }
    }
    return 0;
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  int x, y;

  FaktorPersekutuanTerbesar(this.x, this.y);

  @override
  hasil() {
     int max = x > y ? x : y;
    while (true) {
      if (max % x == 0 && max % y == 0) {
        return max;
      }
      max++;
    }
  }
}

void main() {
  Matematika().hasil();
}