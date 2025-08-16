import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import '../controller/user_controller.dart';
import 'summary_page.dart';

class UserProfilePage extends StatelessWidget {
  final UserController controller = Get.put(UserController());

  UserProfilePage({super.key});

  Widget _buildProfileImage() {
    return Obx(() {
      // First check if we have a local image path
      if (controller.profileImagePath.value.isNotEmpty) {
        if (kIsWeb) {
          // For web, use image bytes
          if (controller.profileImageBytes.value != null) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.memory(
                controller.profileImageBytes.value!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildDefaultOrNetworkImage();
                },
              ),
            );
          }
        } else {
          // For mobile/desktop, use file path
          File imageFile = File(controller.profileImagePath.value);
          return ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.file(
              imageFile,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return _buildDefaultOrNetworkImage();
              },
            ),
          );
        }
      }

      return _buildDefaultOrNetworkImage();
    });
  }

  Widget _buildDefaultOrNetworkImage() {
    String imageUrl = controller.user.value.imageUrl;

    // Check if it's a network URL
    if (imageUrl.startsWith('http')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[300],
              ),
              child: Center(child: CircularProgressIndicator()),
            );
          },
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
      appBar: AppBar(title: Text('User Profile')),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile image section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100, width: 100, child: _buildProfileImage()),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: controller.pickProfileImage,
                  tooltip: 'Upload Photo',
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Name: ${controller.user.value.name}'),
            Text('Age: ${controller.user.value.age}'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: controller.increaseAge,
                  child: Text('+'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: controller.decreaseAge,
                  child: Text('-'),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "Reset Age",
                  content: Text("Do you want to reset age?"),
                  textConfirm: "Yes",
                  onConfirm: () {
                    controller.resetAge();
                    Get.back();
                  },
                  textCancel: "No",
                );
              },
              child: Text("Reset Age"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.to(() => SummaryPage(
                  user: controller.user.value,
                  imageBytes: controller.profileImageBytes.value,
                ));
              },
              child: Text("Go to Summary Page"),
            ),
          ],
        ),
      ),
    );
  }
}
