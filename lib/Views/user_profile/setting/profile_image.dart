import 'package:flutter/material.dart';

import '../../../utils/constants/appcolors.dart';
import '../../../utils/styles/app_textstyles.dart';

class profileImage extends StatelessWidget {
  const profileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        centerTitle: true,
        title: Text("Image", style: AppTextStyles.heading1),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: const [Icon(Icons.camera_alt), Text('Camera')],
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: const [Icon(Icons.image), Text('Gallery')],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
