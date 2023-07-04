// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prologic_29/Agent/data/controller/expired_property_controller.dart';
import 'package:prologic_29/data/Services/constants.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:sizer/sizer.dart';

import '../../../My Widgets/tag_widget.dart';
import '../../../utils/constants/app_urls.dart';
import '../../../utils/constants/fonts.dart';

class Expiryppost extends StatelessWidget {
  var expiredpostcontroller = Get.put(ExpiredPropertyController());
  Expiryppost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        centerTitle: true,
        title: Text("Expired Post", style: AppTextStyles.heading1),
      ),
      body: Obx(() => expiredpostcontroller.expiredpost.value
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.appthem,
            ))
          : expiredpostcontroller.expiredpostmsg.value != ''
              ? Center(
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              expiredpostcontroller.expiredproperty;
                            },
                            icon: const Icon(
                              Icons.refresh,
                              color: AppColors.appthem,
                            )),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Text(expiredpostcontroller.expiredpostmsg.value),
                      ],
                    ),
                  ),
                )
              : expiredpostcontroller.expiredproperties.data!.isEmpty
                  ? nopostexist
                  : ListView.builder(
                      padding: const EdgeInsets.only(bottom: 10),
                      itemCount:
                          expiredpostcontroller.expiredproperties.data!.length,
                      itemBuilder: ((context, index) {
                        String dateTimeString = expiredpostcontroller
                            .expiredproperties.data![index].createdAt
                            .toString();
                        DateTime dateTime = DateTime.parse(dateTimeString);
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(dateTime);
                        List<String> tags = expiredpostcontroller
                            .expiredproperties.data![index].tags
                            .toString()
                            .split(',')
                            .map((tag) => tag.trim())
                            .toList();
                        return Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 222, 222, 222)),
                            margin: EdgeInsets.only(
                                top: index == 0 ? 1.0.h : 2.0.h),
                            //  height: 45.0.h,
                            width: 100.0.w,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //--------Agent image and name, message button
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(
                                      children: [
                                        // CircleAvatar(
                                        //   backgroundImage: NetworkImage(
                                        //       '${AppUrls.assetuserbaseUrl}${ expiredpostcontroller.expiredproperties.data![index].user!.profileImage}'),
                                        // ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 93.w,
                                              child: Text(
                                                '${expiredpostcontroller.expiredproperties.data![index].adTitle}',
                                                maxLines: 2,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Text(
                                              formattedDate,
                                              style:
                                                  const TextStyle(fontSize: 13),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      spacing: 5,
                                      runSpacing: 2,
                                      children: tags
                                          .map((tag) => Tag(label: tag))
                                          .toList(),
                                    ),
                                  ),
                                  //---------------------Image
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 237, 237, 237),
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.black)),
                                    height: 32.h,
                                    margin: const EdgeInsets.only(
                                        top: 9, bottom: 9),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(9),
                                      child: Center(
                                        child: Image.network(
                                          '${AppUrls.assetbaseUrl}${expiredpostcontroller.expiredproperties.data![index].imagePath}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  //----------------------Description

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      '${expiredpostcontroller.expiredproperties.data![index].description}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),

                                  //---------------------Location
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          size: 22,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        SizedBox(
                                          width: 84.w,
                                          child: Text(
                                            '${expiredpostcontroller.expiredproperties.data![index].location} ',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontFamily: AppFonts.nexaBold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.sp),
                                    child: const Divider(
                                      thickness: 0.5,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              foregroundColor: Colors.black,
                                              backgroundColor:
                                                  const Color(0xFF92AEC6)),
                                          onPressed: () {
                                            expiredpostcontroller
                                                .repostproperty(
                                                    expiredpostcontroller
                                                        .expiredproperties
                                                        .data![index]
                                                        .id);
                                          },
                                          child: const Text('Repost')),
                                      OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              foregroundColor: Colors.black,
                                              backgroundColor:
                                                  const Color(0xFF92AEC6)),
                                          onPressed: () {
                                            expiredpostcontroller.soldproperty(
                                                expiredpostcontroller
                                                    .expiredproperties
                                                    .data![index]
                                                    .id);
                                          },
                                          child: const Text('Sold')),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  )
                                ],
                              ),
                            ));
                      }))),
    );
  }
}
