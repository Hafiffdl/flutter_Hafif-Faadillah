class Shape{
  int getArea(){
    return 0;
  }
  int getPerimeter(){
    return 0;
  }

}

class Circle implements Shape{
  int radius;

  Circle(this.radius);

  @override
  int getArea() {
    return 3.14.toInt()* radius * radius;
  }

  @override
  int getPerimeter() {
    return 2 * 3.14.toInt()* radius * radius;
  }
}

class Square implements Shape {
  int side;

  Square(this.side);

  @override
  int getArea() {
    return side * side;
  }

  @override
  int getPerimeter() {
    return 4 * side;
  }
}

class Rectangle implements Shape {
  int panjang; 
  int lebar;

  Rectangle(this.panjang, this.lebar);

  @override
  int getArea() {
    return panjang * lebar;
  }

  @override
  int getPerimeter() {
    return 2 * (panjang + lebar);
  }
}

void main(){
  Circle circle = Circle(7);
  Square square = Square(5);
  Rectangle rectangle = Rectangle (10, 5);

  print('Lingkaran: Luas = ${circle.getArea()}, Keliling = ${circle.getPerimeter()}');
  print('Persegi: Luas = ${square.getArea()}, Keliling = ${square.getPerimeter()}');
  print('Persegi Panjang: Luas = ${rectangle.getArea()}, Keliling = ${rectangle.getPerimeter()}');
}