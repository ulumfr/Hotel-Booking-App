import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/latihan_modul6/login_page.dart';

void main() {
  testWidgets('LoginPage UI Test', (WidgetTester tester) async {
    // Pump the LoginPage widget into the test.
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Verify that the email and password fields exist by looking for their labels.
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    // Enter text into the email TextField.
    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');

    // Enter text into the password TextField.
    await tester.enterText(find.byType(TextField).at(1), 'password');

    // Tap the login button.
    await tester.tap(find.byType(ElevatedButton));

    // Wait for changes in the widget tree.
    await tester.pump();

    // Verify that the login logic is triggered.
    // Here, we might mock the login function and check if it's called when the login button is pressed.
    // For simplicity, let's check if the login button triggers any navigation.

    expect(find.byType(LoginPage), findsOneWidget); // Expect to stay on LoginPage if login is unsuccessful.
    // If the login is successful and navigates to a new screen, change the expectation accordingly.

    // You can add more specific checks based on your app's actual login behavior.
  });
}
