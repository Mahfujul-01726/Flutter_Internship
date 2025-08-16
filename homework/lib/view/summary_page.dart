import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import '../model/user_model.dart';

class SummaryPage extends StatelessWidget {
  final UserModel user;
  final Uint8List? imageBytes;

  const SummaryPage({super.key, required this.user, this.imageBytes});

  Widget _buildProfileImage() {
    String imageUrl = user.imageUrl;

    // First check if we have image bytes (for web)
    if (kIsWeb && imageBytes != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.memory(
          imageBytes!,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return SvgPicture.asset(
              'assets/icons/profile.svg',
              width: 100,
              height: 100,
            );
          },
        ),
      );
    }

    // Check if it's a local file path (for mobile/desktop)
    if (!kIsWeb && (imageUrl.startsWith('/') || imageUrl.contains('cache'))) {
      try {
        if (File(imageUrl).existsSync()) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.file(
              File(imageUrl),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return SvgPicture.asset(
                  'assets/icons/profile.svg',
                  width: 100,
                  height: 100,
                );
              },
            ),
          );
        }
      } catch (e) {
        // File doesn't exist or can't be accessed, fall through to default
      }
    }

    // Check if it's a network URL
    if (imageUrl.startsWith('http')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return SvgPicture.asset(
              'assets/icons/profile.svg',
              width: 100,
              height: 100,
            );
          },
        ),
      );
    }

    // Default to SVG asset (including when imageUrl is the SVG path)
    return SvgPicture.asset(
      'assets/icons/profile.svg',
      width: 100,
      height: 100,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summary')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildProfileImage(),
            const SizedBox(height: 16),
            Text('Name: ${user.name}'),
            Text('Age: ${user.age}'),
          ],
        ),
      ),
    );
  }
}
