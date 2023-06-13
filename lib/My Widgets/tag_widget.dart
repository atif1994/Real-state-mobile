import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';

import '../Agent/data/controller/dealer_post_controller.dart';

class Tag extends StatelessWidget {
  final String label;

  const Tag({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      // decoration: BoxDecoration(
      //   color: const Color.fromARGB(255, 12, 64, 124),
      //   borderRadius: BorderRadius.circular(20),
      // ),
      child: Text('#$label', style: AppTextStyles.normal),
    );
  }
}

class AddTag extends StatelessWidget {
  final String label;
  final int index;

  const AddTag({Key? key, required this.label, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<DealerPostController>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 12, 64, 124),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.tags.removeAt(index);
            },
            child: const Icon(
              Icons.close,
              color: AppColors.colorWhite,
              size: 21,
            ),
          ),
        ],
      ),
    );
  }
}
