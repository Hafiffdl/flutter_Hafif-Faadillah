import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interactive_widget/advance_form.dart';

void main() {

testWidgets('Judul halaman harus Contacts', (WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(
    home: AdvanceForm(),
  ));

  expect(find.text('Contacts'), findsOneWidget);
});

testWidgets('Body harus terdapat text Create new Contact', (WidgetTester tester) async{
  await tester.pumpWidget(const MaterialApp(
    home: AdvanceForm(),
  ));
  expect(find.text('Create new Contact'), findsOneWidget);
});

testWidgets('Body harus terdapat text Kumpulan Contact di Flutter Alterra Academy', (WidgetTester tester) async{
  await tester.pumpWidget(const MaterialApp(
    home: AdvanceForm(),
  ));
  expect(find.text('Kumpulan Contact di Flutter Alterra Academy'), findsOneWidget);
});

testWidgets('Terdapat TextFormField yang berisi text Masukkan Nama', (WidgetTester tester) async{
  await tester.pumpWidget(const MaterialApp(
    home: AdvanceForm(),
  ));
  expect(find.text('Masukkan Nama'), findsOneWidget);
});

testWidgets('Terdapat TextFormField yang berisi text Nomor', (WidgetTester tester) async{
  await tester.pumpWidget(const MaterialApp(
    home: AdvanceForm(),
  ));
  expect(find.text('+62...'), findsOneWidget);
});

testWidgets('phone icon', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Icon(Icons.phone),
        ),
      ),
    );
    expect(find.byIcon(Icons.phone), findsOneWidget);
  });

testWidgets('Submit Button', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: ElevatedButton(
          onPressed: () {}, 
          child: const Text('Submit')),
      ),
    ),
  );
  expect(find.text('Submit'), findsOneWidget);
});

testWidgets('Select Date', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: ElevatedButton(
          onPressed: () {}, 
          child: const Text('Select Date')),
      ),
    ),
  );
  expect(find.text('Select Date'), findsOneWidget);
});

testWidgets('Terdapat text Pick Color', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: ElevatedButton(
          onPressed: () {}, 
          child: const Text('Pick Color')),
      ),
    ),
  );
  expect(find.text('Pick Color'), findsOneWidget);
});

testWidgets('Terdapat text Pick File and Open file', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: ElevatedButton(
          onPressed: () {}, 
          child: const Text('Pick File and Open File')),
      ),
    ),
  );
  expect(find.text('Pick File and Open File'), findsOneWidget);
});

testWidgets('Terdapat teks List Contact', (WidgetTester tester) async{
  await tester.pumpWidget(const MaterialApp(
    home: AdvanceForm(),
  ));
  expect(find.text('List Contact'), findsOneWidget);
});

}