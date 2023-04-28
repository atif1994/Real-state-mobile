// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prologic_29/Agent/data/controller/dealer_post_controller.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:prologic_29/custom_widgets/custom_textfield.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:sizer/sizer.dart';

class DealerPostScreen extends StatefulWidget {
  const DealerPostScreen({super.key});

  @override
  State<DealerPostScreen> createState() => _DealerPostScreenState();
}

class _DealerPostScreenState extends State<DealerPostScreen> {
  var dealerPostController = Get.put(DealerPostController());
  var locController = TextEditingController();

  var descController = TextEditingController();

  var tagController = TextEditingController();
  final picker = ImagePicker();
  File? _imageFile;
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        centerTitle: true,
        title: Text("Dealer Post", style: AppTextStyles.heading1),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 4.0.w, right: 4.0.w, top: 3.0.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Location",
                style: AppTextStyles.labelSmall
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 12.sp),
              ),
              SizedBox(height: 0.5.h),
              CustomTextField(
                editingController: locController,
                hintText: "Enter Your Location",
              ),
              SizedBox(height: 1.5.h),
              Text(
                "Add Description",
                style: AppTextStyles.labelSmall
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 12.sp),
              ),
              SizedBox(height: 0.5.h),
              CustomTextField(
                editingController: descController,
                hintText: "Description",
              ),
              SizedBox(height: 1.5.h),
              Text(
                "Add Tag",
                style: AppTextStyles.labelSmall
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 12.sp),
              ),
              SizedBox(height: 1.5.h),
              CustomTextField(
                editingController: tagController,
                hintText: "Enter Tag eg Marla,DHA,B",
              ),
              SizedBox(height: 2.5.h),
              GestureDetector(
                onTap: () {
                  _showBottomSheet(context);
                },
                child: Container(
                  height: 30.0.h,
                  width: 100.0.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.appthem)),
                  child: Center(
                    child: _imageFile == null
                        ? Text(
                            "Select Image",
                            style: AppTextStyles.labelSmall.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 12.sp),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              _imageFile!,
                              fit: BoxFit.fill,
                              width: 100.0.w,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.0.h,
              ),
              Obx(() => CustomButton(
                    isloading: dealerPostController.loadingAddingPost.value,
                    text: "Submit",
                    onPressed: () {
                      dealerPostController.addDealerPost(9, descController.text,
                          locController.text, tagController.text, _imageFile!);
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: AppColors.colorWhite),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          _pickImage(ImageSource.camera);
                        },
                        icon: const Icon(
                          Icons.camera_alt_rounded,
                          color: AppColors.appthem,
                        )),
                    const Text('Camera'),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          _pickImage(ImageSource.gallery);
                        },
                        icon: const Icon(
                          Icons.image,
                          color: AppColors.appthem,
                        )),
                    const Text('Gallery'),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
