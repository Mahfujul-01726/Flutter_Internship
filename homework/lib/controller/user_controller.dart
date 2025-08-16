import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/user_model.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  var user =
      UserModel(
        name: "Mahfuj",
        age: 25,
        imageUrl: "assets/icons/profile.svg",
      ).obs;
  
  // Add a separate reactive variable for image path
  var profileImagePath = "".obs;
  // Add a variable to store image bytes for web
  var profileImageBytes = Rx<Uint8List?>(null);

  void increaseAge() {
    user.update((val) {
      val?.age += 1;
    });
    Get.snackbar("Updated", "Age increased");
  }

  void decreaseAge() {
    user.update((val) {
      if (val!.age > 0) val.age -= 1;
    });
  }

  void resetAge() {
    user.update((val) {
      val?.age = 0;
    });
  }

  // Pick and update profile image
  Future<void> pickProfileImage() async {
    try {
      // Show dialog to choose between camera and gallery
      await Get.defaultDialog(
        title: "Select Image Source",
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () {
                Get.back();
                _pickImageFromSource(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () {
                Get.back();
                _pickImageFromSource(ImageSource.gallery);
              },
            ),
          ],
        ),
      );
    } catch (e) {
      Get.snackbar('Error', 'Failed to show image picker: $e');
    }
  }

  Future<void> _pickImageFromSource(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );
      
      if (pickedFile != null) {
        if (kIsWeb) {
          // For web, read the image as bytes
          final bytes = await pickedFile.readAsBytes();
          profileImageBytes.value = bytes;
          profileImagePath.value = pickedFile.path;
          user.update((val) {
            val?.imageUrl = pickedFile.path;
          });
        } else {
          // For mobile/desktop, verify the file exists
          final file = File(pickedFile.path);
          if (await file.exists()) {
            profileImagePath.value = pickedFile.path;
            user.update((val) {
              val?.imageUrl = pickedFile.path;
            });
          } else {
            Get.snackbar(
              'Error', 
              'Selected image file does not exist.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
            return;
          }
        }
        
        Get.snackbar(
          'Profile Updated', 
          'Your profile photo has been updated.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'No Image Selected', 
          'Please select an image.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      String errorMessage = 'Failed to pick image';
      if (e.toString().contains('permission')) {
        errorMessage = 'Permission denied. Please allow camera/gallery access in settings.';
      }
      
      Get.snackbar(
        'Error', 
        '$errorMessage: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 4),
      );
    }
  }
}
