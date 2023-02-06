import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';

import '../../../data/Controllers/user_profile_section_controller/image_update_controller.dart';
import '../../../utils/constants/appcolors.dart';
import '../../../utils/styles/app_textstyles.dart';

class profileImage extends StatelessWidget {
  var imageupdatecontroller = Get.put(UpdateImageController());
  profileImage({super.key});
  File? imageTemp;
  ImagePicker imagePicker = ImagePicker();
  Future<void> cameraimg() async {
    final img = await imagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      imageTemp = File(img.path);
    }
  }

  Future<void> galleryimg() async {
    final img = await imagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      imageTemp = File(img.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        centerTitle: true,
        title: Text("Image", style: AppTextStyles.heading1),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (() {
                    cameraimg();
                  }),
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all()),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.camera_alt,
                          size: 26,
                        ),
                        Text('Camera')
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    galleryimg();
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all()),
                    child: Column(
                      children: const [
                        Icon(Icons.image, size: 26),
                        Text('Gallery')
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // const Spacer(),
            // imageTemp == null? SizedBox():
            // SizedBox(
            //     height: 100,
            //     width: 100,
            //     child: Image.file(
            //       imageTemp!.absolute,
            //       fit: BoxFit.cover,
            //     )),
            const Spacer(),
            CustomButton(
              onPressed: () {
                imageupdatecontroller.updateprofileimage(imageTemp);
              },
              text: 'Upload Image',
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
