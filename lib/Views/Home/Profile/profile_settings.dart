import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prologic_29/Services/constants.dart';

import '../../../Controllers/pick_image_controller.dart';
import '../../../My Widgets/my_button.dart';
import '../../../My Widgets/my_text_field_2.dart';
import '../../profile/profile_screen.dart';

class ProfileSettings extends StatelessWidget {
  File? imageFile;
  ImagePicker imagePicker = ImagePicker();
     ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
   ProfileSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Settings')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
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
                            : NetworkImage(''),
                      )),
                  Positioned(
                    bottom: 0,
                    child: InkWell(
                      child: const Icon(
                        Icons.camera,
                        color: Colors.black,
                        // size: ,
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => bottomSheet(context),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            const MyTextField2(
              label: 'First Name',
            ),
            const MyTextField2(
              label: 'Last Name',
            ),
            const MyTextField2(
              label: 'Email',
            ),
            const MyTextField2(
              label: 'Phone Number',
            ),
             const MyTextField2(
              label: 'Country',
            ),
             const MyTextField2(
              label: 'State or province',
            ),
             const MyTextField2(
              label: 'City',
            ),
            
            MyButton(
              text: 'Update Profile',
              onTap: (){

              },
            ),
          ],
        ),
      ),
    );
  }
  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Select or Capture Photo",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Column(
                  children: const [
                    Icon(
                      Icons.camera,
                      color: Colors.purple,
                    ),
                    Text(
                      "Camera",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.camera, context);
                },
              ),
              SizedBox(
                width: size.width * 0.4,
              ),
              InkWell(
                child: Column(
                  children: const [
                    Icon(
                      Icons.image,
                      color: Colors.deepPurple,
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.gallery, context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> takePhoto(ImageSource source, BuildContext context) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    imageFile = File(pickedImage!.path);
    print(' imagee path:${imageFile}');

    imagePickerController.setImagePath(imageFile!.path);
    Navigator.pop(context);
  }
}
