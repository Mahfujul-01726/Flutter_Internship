// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:homework/view/user_profile_page.dart';

void main() {
  testWidgets('User profile page test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(GetMaterialApp(home: UserProfilePage()));

    // Verify that our user profile page loads
    expect(find.text('User Profile'), findsOneWidget);
    expect(find.text('Name: Mahfuj'), findsOneWidget);
    expect(find.text('Age: 25'), findsOneWidget);

    // Tap the '+' button to increase age
    await tester.tap(find.text('+'));
    await tester.pump();

    // Verify that age has incremented
    expect(find.text('Age: 26'), findsOneWidget);
  });
}
