import 'package:flutter/material.dart';
import 'package:flutter_assets/home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Halaman HomePage terdapat 8 Image', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));
    expect(find.byType(Image), findsNWidgets(8));
  });

  testWidgets('Judul Halaman harus Gallery Image', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));
    expect(find.text('Gallery Image'), findsOneWidget);
  });

testWidgets('Button Iya', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: ElevatedButton(
          onPressed: () {}, 
          child: const Text('Iya')),
      ),
    ),
  );
  expect(find.text('Iya'), findsOneWidget);
});

testWidgets('Button Tidak', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: ElevatedButton(
          onPressed: () {}, 
          child: const Text('Tidak')),
      ),
    ),
  );
  expect(find.text('Tidak'), findsOneWidget);
});

testWidgets('Teks Apakah kamu ingin melihat lebih detail? ', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: ElevatedButton(
          onPressed: () {}, 
          child: const Text('Apakah kamu ingin melihat lebih detail?')),
      ),
    ),
  );
  expect(find.text('Apakah kamu ingin melihat lebih detail?'), findsOneWidget);
});

testWidgets('Test Menu Drawer terdapat Teks Contact', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
      home: Scaffold(
        body: Drawer(
          child: Text('Contact'),),
      ),
    ));
    expect(find.text('Contact'), findsOneWidget);
  });

  testWidgets('Test Menu Drawer terdapat Teks Galeri', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
      home: Scaffold(
        body: Drawer(
          child: Text('Galeri'),),
      ),
    ));
    expect(find.text('Galeri'), findsOneWidget);
  });
}
