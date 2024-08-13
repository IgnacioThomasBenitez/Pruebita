import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/app/app.dart'; // Asegúrate de que esta ruta sea correcta
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomeScreen displays expected elements', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SmartHomeApp() as Widget);

    // Verify that HomeScreen loads successfully.
    // Example: Check if a specific text or widget is present.
    // Adjust 'Your Expected Text' to a text or widget you expect on HomeScreen.
    expect(find.text('Expected Text'), findsOneWidget);

    // Example: Check if a specific icon or button is present.
    // Adjust the icon or widget to something you expect on HomeScreen.
    expect(find.byIcon(Icons.home), findsOneWidget);

    // Example: Check if a specific widget is present (e.g., a button).
    // Adjust 'Your Button Key' to the key you used in your widget tree.
    expect(find.byKey(Key('your_button_key')), findsOneWidget);
  });
}

class SmartHomeApp {
  const SmartHomeApp();
}
