import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/donor.dart';

class DonorDetailsDialog extends StatelessWidget {
  final Donor donor;

  const DonorDetailsDialog({
    super.key,
    required this.donor,
  });

  Color _getBloodGroupColor(String bloodGroup) {
    switch (bloodGroup) {
      case 'A+':
      case 'A-':
        return Colors.red;
      case 'B+':
      case 'B-':
        return Colors.blue;
      case 'AB+':
      case 'AB-':
        return Colors.purple;
      case 'O+':
      case 'O-':
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(20),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Large donor image
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(donor.imageUrl),
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(height: 20),
            
            // Blood group (highlighted)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: _getBloodGroupColor(donor.bloodGroup),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                donor.bloodGroup,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Donor details
            _buildDetailRow('নাম:', donor.name),
            const SizedBox(height: 12),
            _buildDetailRow('ইমেইল:', donor.email),
            const SizedBox(height: 12),
            _buildClickablePhoneRow('ফোন:', donor.phone),
            const SizedBox(height: 12),
            _buildDetailRow('ঠিকানা:', donor.address),
            const SizedBox(height: 12),
            _buildDetailRow('শেষ রক্তদান:', donor.formattedLastDonationDate),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('বন্ধ করুন'),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildClickablePhoneRow(String label, String phone) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => _makePhoneCall(phone),
            child: Text(
              phone,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}