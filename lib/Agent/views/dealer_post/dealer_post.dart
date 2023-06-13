// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prologic_29/Agent/data/controller/dealer_post_controller.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:prologic_29/custom_widgets/custom_textfield.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:sizer/sizer.dart';

import '../../../My Widgets/tag_widget.dart';

class DealerPostScreen extends StatefulWidget {
  const DealerPostScreen({super.key});

  @override
  State<DealerPostScreen> createState() => _DealerPostScreenState();
}

class _DealerPostScreenState extends State<DealerPostScreen> {
  var dealerPostController = Get.put(DealerPostController());

  final picker = ImagePicker();
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      dealerPostController.imageFile.value = File(pickedFile!.path);
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
                "Add Title",
                style: AppTextStyles.labelSmall
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 12.sp),
              ),
              SizedBox(height: 0.5.h),
              CustomTextField(
                editingController: dealerPostController.titleController,
                hintText: "Enter Your Title",
              ),
              SizedBox(height: 1.5.h),
              Text(
                "Add Location",
                style: AppTextStyles.labelSmall
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 12.sp),
              ),
              SizedBox(height: 0.5.h),
              CustomTextField(
                editingController: dealerPostController.locController,
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
                editingController: dealerPostController.descController,
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
                editingController: dealerPostController.tagController,
                suffixicon: GestureDetector(
                    onTap: () {
                      if (dealerPostController.tagController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: 'Please enter tag', gravity: ToastGravity.TOP);
                      } else {
                        dealerPostController.tags
                            .add(dealerPostController.tagController.text);
                        dealerPostController.tagController.clear();
                      }
                    },
                    child: const Icon(
                      Icons.add,
                      color: AppColors.themecolor,
                    )),
                hintText: "Enter Tag eg DHA",
              ),
              const Padding(
                padding: EdgeInsets.only(left: 9, top: 2),
                child: Text(
                  'Press Add(+) button after writing tag.',
                  style: TextStyle(color: Color.fromARGB(255, 113, 113, 113)),
                ),
              ),
              SizedBox(height: 1.5.h),
              Obx(() => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children:
                          dealerPostController.tags.asMap().entries.map((tag) {
                        String item = tag.value;
                        int index = tag.key;
                        return AddTag(
                          label: item,
                          index: index,
                        );
                      }).toList(),
                    ),
                  )),
              SizedBox(height: 2.5.h),
              GestureDetector(
                onTap: () {
                  _showBottomSheet(context);
                },
                child: Obx(() => Container(
                      height: 30.0.h,
                      width: 100.0.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.appthem)),
                      child: Center(
                        child: dealerPostController.imageFile.value == null
                            ? Text(
                                "Select Image",
                                style: AppTextStyles.labelSmall.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  dealerPostController.imageFile.value!,
                                  fit: BoxFit.fill,
                                  width: 100.0.w,
                                ),
                              ),
                      ),
                    )),
              ),
              SizedBox(
                height: 3.0.h,
              ),
              Obx(() => CustomButton(
                    isloading: dealerPostController.loadingAddingPost.value,
                    text: "Submit",
                    onPressed: () {
                      dealerPostController.addDealerPost(
                          dealerPostController.titleController.text,
                          dealerPostController.descController.text,
                          dealerPostController.locController.text,
                          dealerPostController.imageFile.value!);
                    },
                  )),
              SizedBox(
                height: 2.h,
              )
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
