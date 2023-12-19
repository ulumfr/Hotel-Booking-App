import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/views/auth/components/text_field_auth.dart';

void main() {
  testWidgets('TextFieldAuth test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TextFieldAuth(
          controller: TextEditingController(),
          obsecureText: false,
          hintText: "enter your password",
        ),
      ),
    ));

    // Enter some text
    await tester.enterText(find.byType(TextField), 'password');

    await tester.pump();

    final TextField textField = find.byType(TextField).evaluate().first.widget as TextField;
    expect(textField.controller!.text, 'password');
  });
}