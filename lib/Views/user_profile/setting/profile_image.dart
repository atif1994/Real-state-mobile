import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../../data/Controllers/user_profile_section_controller/image_update_controller.dart';
import '../../../utils/constants/appcolors.dart';
import '../../../utils/styles/app_textstyles.dart';

class profileImage extends StatefulWidget {
  profileImage({super.key});

  @override
  State<profileImage> createState() => _profileImageState();
}

class _profileImageState extends State<profileImage> {
  var imageupdatecontroller = Get.put(UpdateImageController());

  File? imageTemp;

  ImagePicker imagePicker = ImagePicker();

  Future<void> cameraimg() async {
    final img = await imagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      setState(() {
        imageTemp = File(img.path);
      });
    }
  }

  Future<void> galleryimg() async {
    final img = await imagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      setState(() {
        imageTemp = File(img.path);
      });
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
                  child: Column(
                    children: [
                      Mycontainer(Icons.camera_alt),
                      Text(
                        'Camera',
                        style: AppTextStyles.labelSmall.copyWith(
                            fontSize: 13.sp, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      galleryimg();
                    },
                    child: Column(
                      children: [
                        Mycontainer(Icons.image),
                        Text(
                          'Gallery',
                          style: AppTextStyles.labelSmall.copyWith(
                              fontSize: 13.sp, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              ],
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black)),
                margin: EdgeInsets.symmetric(vertical: 30.sp),
                height: 40.h,
                width: 40.h,
                child: imageTemp == null
                    ? Center(
                        child: Text(
                          'Your Image is here',
                          style: AppTextStyles.labelSmall,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.file(
                          imageTemp!.absolute,
                          fit: BoxFit.cover,
                        ),
                      )),
            Obx(
              () => imageupdatecontroller.loadingupdateimage.value
                  ? CircularProgressIndicator()
                  : imageupdatecontroller.errorloadingupdateimage.value != ""
                      ? Center(
                          child: Text(imageupdatecontroller
                              .errorloadingupdateimage.value),
                        )
                      : CustomButton(
                          onPressed: () {
                            imageupdatecontroller.updateprofileimage(imageTemp);
                          },
                          text: 'Upload Image',
                        ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Mycontainer(icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      // height: 50,
      // width: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: AppColors.colorblack)),
      child: Padding(
        padding: const EdgeInsets.all(23),
        child: Icon(
          icon,
          size: 40,
        ),
      ),
    );
  }
}
