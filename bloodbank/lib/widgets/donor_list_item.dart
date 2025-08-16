import 'package:flutter/material.dart';
import '../models/donor.dart';

class DonorListItem extends StatelessWidget {
  final Donor donor;
  final VoidCallback onTap;

  const DonorListItem({super.key, required this.donor, required this.onTap});

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

  Widget _buildFallbackAvatar() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: _getBloodGroupColor(donor.bloodGroup),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: _getBloodGroupColor(donor.bloodGroup).withValues(alpha: 0.1),
          child: donor.imageUrl.startsWith('assets/') 
            ? ClipOval(
                child: Image.asset(
                  donor.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildFallbackAvatar();
                  },
                ),
              )
            : donor.imageUrl.startsWith('http') 
              ? ClipOval(
                  child: Image.network(
                    donor.imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return _buildFallbackAvatar();
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return _buildFallbackAvatar();
                    },
                  ),
                )
              : _buildFallbackAvatar(),
        ),
        title: Text(
          'নাম: ${donor.name}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          'ফোন: ${donor.phone}',
          style: const TextStyle(fontSize: 14),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _getBloodGroupColor(donor.bloodGroup),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            donor.bloodGroup,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
