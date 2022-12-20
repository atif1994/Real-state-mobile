import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prologic_29/Services/my_shared_preferences.dart';
import 'package:prologic_29/Views/Drawer/contactus.dart';

import '../../Controllers/auth_controller.dart';
import '../../Controllers/pick_image_controller.dart';
import '../profile/profile_page.dart';
import '../profile/profile_screen.dart';

class MyDrawer extends StatelessWidget {
  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: InkWell(
            onTap: () {
              Get.to(const Profile_Page());
            },
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Obx(() => CircleAvatar(
                        radius: 80,
                        backgroundImage: imagePickerController
                                    .isImagePathSet.value ==
                                true
                            ? FileImage(
                                    File(imagePickerController.imagePath.value))
                                as ImageProvider
                            : NetworkImage(
                                imagePickerController.imagePath.value),
                      )),
                ],
              ),
            ),
          )),
          ListTile(
            title: const Text('About Us'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Area Guides'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => contactus(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Log out'),
            onTap: () {
              MySharedPreferences.clearData();
              Get.find<AuthController>().isUserSignedIn();
            },
          ),
        ],
      ),
    );
  }
}
