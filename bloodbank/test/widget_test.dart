// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:bloodbank/models/donor.dart';

void main() {
  group('Blood Bank App Tests', () {
    test('Donor model should create correctly', () {
      final donor = Donor(
        name: 'Test User',
        email: 'test@example.com',
        phone: '+1234567890',
        address: 'Test Address',
        bloodGroup: 'A+',
        imageUrl: 'test_image.jpg',
        lastDonationDate: DateTime(2024, 1, 1),
      );

      expect(donor.name, 'Test User');
      expect(donor.email, 'test@example.com');
      expect(donor.phone, '+1234567890');
      expect(donor.address, 'Test Address');
      expect(donor.bloodGroup, 'A+');
      expect(donor.imageUrl, 'test_image.jpg');
      expect(donor.formattedLastDonationDate, '1/1/2024');
    });

    test('Donor formatted date should work correctly', () {
      final donor = Donor(
        name: 'Test User',
        email: 'test@example.com',
        phone: '+1234567890',
        address: 'Test Address',
        bloodGroup: 'B+',
        imageUrl: 'test_image.jpg',
        lastDonationDate: DateTime(2024, 12, 25),
      );

      expect(donor.formattedLastDonationDate, '25/12/2024');
    });
  });
}
