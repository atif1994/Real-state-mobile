// ignore_for_file: unused_local_variable, avoid_print, use_build_context_synchronously, avoid_unnecessary_containers, unused_field

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prologic_29/data/Services/constants.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import '../../../utils/constants/appcolors.dart';
import '../data/controller/dealer_page_controller.dart';

class DealerPageUI extends StatefulWidget {
  const DealerPageUI({super.key});

  @override
  State<DealerPageUI> createState() => _DealerPageUIState();
}

class _DealerPageUIState extends State<DealerPageUI> {
  var dealerpostController = Get.put(DealerPageController());
  final List<TextEditingController> _controllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dealer Page', style: AppTextStyles.heading1),
        backgroundColor: AppColors.appthem,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 2.0.h,
          ),
          Obx(() => dealerpostController.loadingShowPost.value
              ? Padding(
                  padding: EdgeInsets.only(top: 20.0.h),
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.appthem,
                  )),
                )
              : dealerpostController.errorShowPost.value != ''
                  ? Center(
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  dealerpostController.showDealerPage;
                                },
                                icon: const Icon(
                                  Icons.refresh,
                                  color: AppColors.appthem,
                                )),
                            SizedBox(
                              height: 1.0.h,
                            ),
                            Text(dealerpostController.errorShowPost.value),
                          ],
                        ),
                      ),
                    )
                  : dealerpostController.dealerPageModel.data!.isEmpty
                      ? nopostexist
                      : ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var dealerpost = dealerpostController
                                .dealerPageModel.data![index];
                            String dateTimeString = dealerpostController
                                .dealerPageModel.data![index].createdAt
                                .toString();
                            DateTime dateTime = DateTime.parse(dateTimeString);
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(dateTime);
                            List<String> tags = dealerpost.tags
                                .toString()
                                .split(',')
                                .map((tag) => tag.trim())
                                .toList();

                            _controllers.add(TextEditingController());

                            return Column(children: [
                              Container(
                                  decoration: const BoxDecoration(
                                      color:
                                          Color.fromARGB(255, 222, 222, 222)),
                                  margin: EdgeInsets.only(
                                      top: index == 0 ? 1.0.h : 2.0.h),
                                  //  height: 45.0.h,
                                  width: 100.0.w,
                                  child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //--------Agent image and name, message button
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: Row(
                                                children: [
                                                  // CircleAvatar(
                                                  //   backgroundImage: NetworkImage(
                                                  //       '${AppUrls.assetuserbaseUrl}${dealerpost.user!.profileImage}'),
                                                  // ),
                                                  const SizedBox(
                                                    width: 6,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${dealerpost.user!.firstName} ${dealerpost.user!.lastName}',
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        formattedDate,
                                                        style: const TextStyle(
                                                            fontSize: 13),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),

                                            //-------------------Title
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 9.0, top: 4),
                                              child: Text(
                                                '${dealerpost.adTitle}',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            //--------------------Tags
                                            // Padding(
                                            //   padding: const EdgeInsets.all(8.0),
                                            //   child: Wrap(
                                            //     spacing: 5,
                                            //     runSpacing: 2,
                                            //     children: tags
                                            //         .map((tag) => Tag(label: tag))
                                            //         .toList(),
                                            //   ),
                                            // ),
                                            //---------------------Image
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 237, 237, 237),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.black)),
                                              height: 32.h,
                                              margin: const EdgeInsets.only(
                                                  top: 9, bottom: 9),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                                child: Center(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      showimage(index);
                                                    },
                                                    child: Image.network(
                                                      '${AppUrls.assetbaseUrl}${dealerpost.imagePath}',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            //----------------------Description

                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Text(
                                                '${dealerpost.description}',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 3,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),

                                            //---------------------Location
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                                      '${dealerpost.location} ',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontFamily: AppFonts
                                                              .nexaBold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ])))
                            ]);
                          },
                          padding: const EdgeInsets.only(bottom: 15),
                          itemCount:
                              dealerpostController.dealerPageModel.data!.length,
                        ))
        ],
      )),
    );
  }

  showimage(index) {
    showDialog(
        barrierLabel: 'Dealer Page',
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            content: Builder(
              builder: (context) {
                // Get available height and width of the build area of this widget. Make a choice depending on the size.

                return InteractiveViewer(
                  child: Image.network(
                    '${AppUrls.assetbaseUrl}${dealerpostController.dealerPageModel.data![index].imagePath}',
                    height: 100.h,
                    width: 100.w,
                  ),
                );
              },
            ),
          );
        });
  }

  showToast(String message) {
    return Fluttertoast.showToast(msg: message);
  }
}
