import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants/appcolors.dart';
import '../../utils/constants/image_resources.dart';
import '../../utils/styles/app_textstyles.dart';
import '../data/controller/about_agent_controller.dart';

class AboutAgent extends StatelessWidget {
  const AboutAgent({super.key});

  @override
  Widget build(BuildContext context) {
    var aboutagentcontroller = Get.put(AboutAgentController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appthem,
          title: Text("About Us", style: AppTextStyles.appbar),
        ),
        body: Obx(
          () => aboutagentcontroller.loadingAboutAgent.value
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.appthem,
                ))
              : aboutagentcontroller.errorAboutAgent.value != ''
                  ? Center(
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  aboutagentcontroller.aboutAgent();
                                },
                                icon: const Icon(
                                  Icons.refresh,
                                  color: AppColors.appthem,
                                )),
                            SizedBox(
                              height: 1.0.h,
                            ),
                            Text(aboutagentcontroller.errorAboutAgent.value),
                          ],
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 15.h,
                          child: ClipRRect(
                              child: aboutagentcontroller
                                          .aboutAgentModel.data!.profileImage ==
                                      null
                                  ? Image.asset(
                                      "assets/user.png",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(aboutagentcontroller
                                      .aboutAgentModel.data!.profileImage)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${aboutagentcontroller.aboutAgentModel.data!.firstName} ${aboutagentcontroller.aboutAgentModel.data!.lastName}",
                          style: AppTextStyles.labelSmall.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          aboutagentcontroller.aboutAgentModel.data!.email
                              .toString(),
                          style:
                              AppTextStyles.labelSmall.copyWith(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'UserName:',
                                  style: AppTextStyles.heading1
                                      .copyWith(color: Colors.black),
                                ),
                                Text(
                                  aboutagentcontroller
                                      .aboutAgentModel.data!.username
                                      .toString(),
                                  style: AppTextStyles.labelSmall
                                      .copyWith(fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Mobile No:',
                                  style: AppTextStyles.heading1
                                      .copyWith(color: Colors.black),
                                ),
                                Text(
                                  aboutagentcontroller
                                      .aboutAgentModel.data!.mobileNo
                                      .toString(),
                                  style: AppTextStyles.labelSmall
                                      .copyWith(fontSize: 15),
                                ),
                              ],
                            )
                          ],
                        ),
                        Image.asset(
                          AppImageResources.abt,
                          height: 40.0.h,
                          width: 80.w,
                        ),
                        Text(
                          'Company Information',
                          style: AppTextStyles.labelSmall.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 15),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Company Name:',
                                    style: AppTextStyles.heading1
                                        .copyWith(color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    aboutagentcontroller.aboutAgentModel.data!
                                        .company!.companyName
                                        .toString(),
                                    style: AppTextStyles.labelSmall
                                        .copyWith(fontSize: 15),
                                  ),
                                ],
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Owner Name:',
                                    style: AppTextStyles.heading1
                                        .copyWith(color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  Text(
                                    aboutagentcontroller.aboutAgentModel.data!
                                        .company!.ownerName
                                        .toString(),
                                    style: AppTextStyles.labelSmall
                                        .copyWith(fontSize: 15),
                                  ),
                                ],
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Address:',
                                    style: AppTextStyles.heading1
                                        .copyWith(color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 35.w,
                                  ),
                                  Text(
                                    aboutagentcontroller.aboutAgentModel.data!
                                        .company!.officeAddress
                                        .toString(),
                                    style: AppTextStyles.labelSmall
                                        .copyWith(fontSize: 15),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
        ));
  }
}
