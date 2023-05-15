import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

import '../../../data/Controllers/Referral/get_all_referrals.dart';
import '../../../utils/constants/appcolors.dart';
import '../../../utils/constants/fonts.dart';
import '../../../utils/constants/image_resources.dart';
import '../../../utils/styles/app_textstyles.dart';

class GetReferral extends StatelessWidget {
  TextEditingController referfieldcontroller = TextEditingController();
  var getreferral = Get.put(GetRefferal());
  GetReferral({super.key});

  @override
  Widget build(BuildContext context) {
    bool validate = false;

    return Scaffold(
        backgroundColor: AppColors.appthem,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Referrals', style: AppTextStyles.heading1),
          backgroundColor: AppColors.appthem,
        ),
        body: Column(
          children: [
            Container(
                width: 100.0.w,
                decoration: const BoxDecoration(color: AppColors.appthem),
                child: Column(
                  children: [
                    Image.asset('assets/referfriend.png', height: 20.h),
                    const Text('Refer & Earn Money',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontFamily: AppFonts.nexaBold)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 10),
                      child: Row(
                        children: [
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color.fromARGB(255, 114, 120, 133),
                              ),
                              child: TextFormField(
                                controller: referfieldcontroller,
                                decoration: InputDecoration(
                                    // ignore: dead_code
                                    // errorText: validate ? 'Please enter' : null,
                                    suffix: InkWell(
                                      onTap: () {
                                        referfieldcontroller.text.isEmpty
                                            ? showcopyerror()
                                            : {
                                                Clipboard.setData(ClipboardData(
                                                    text: referfieldcontroller
                                                        .text)),
                                                showcopydata()
                                              };
                                      },
                                      child: const Text(
                                        'Copy',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 213, 214, 218)),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 119, 178, 226)),
                              onPressed: () {
                                referfieldcontroller.text.isEmpty
                                    ? showcopyerror()
                                    : Share.share(referfieldcontroller.text);
                              },
                              child: const Text('Share'))
                        ],
                      ),
                    )
                  ],
                )),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              // height: 60.0.h,
              child: Obx(() => getreferral.getrefferalload.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.appthem,
                    ))
                  : getreferral.getrefferalerrormsg != ''
                      ? Center(
                          child: Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      getreferral.getrefferal();
                                    },
                                    icon: const Icon(
                                      Icons.refresh,
                                      color: AppColors.appthem,
                                    )),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Text(getreferral.getrefferalerrormsg.value),
                              ],
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: getreferral.referral.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade300),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                        radius: 28,
                                        backgroundImage:
                                            AssetImage(AppImageResources.abt)
                                        // NetworkImage("${AppUrls.baseUrl2}${getreferral.referral.data![index].avatar['url']}"),
                                        ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${getreferral.referral.data![index].firstName!} ${getreferral.referral.data![index].firstName!}",
                                      style: const TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
            ))
          ],
        ));
  }

  showcopydata() {
    Fluttertoast.showToast(
        msg: '${referfieldcontroller.text} is copied',
        gravity: ToastGravity.TOP);
  }

  showcopyerror() {
    Fluttertoast.showToast(
        msg: 'Please Enter Referral Code',
        backgroundColor: const Color.fromARGB(255, 165, 37, 27),
        gravity: ToastGravity.TOP);
  }
}
