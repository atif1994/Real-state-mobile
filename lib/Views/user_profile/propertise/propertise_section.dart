// ignore_for_file: prefer_is_empty, prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:prologic_29/data/Controllers/agent_controller/agent_controller.dart';
import 'package:prologic_29/data/Controllers/user_profile_section_controller/profile_propertise_controller/profile_all_propertise_controller.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/constants/constant_config.dart';
import 'package:prologic_29/utils/constants/image_resources.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class PropertiseSection extends StatefulWidget {
  PropertiseSection({super.key});

  @override
  State<PropertiseSection> createState() => _PropertiseSectionState();
}

class _PropertiseSectionState extends State<PropertiseSection> {
  var profilePropertiseController = Get.put(ProfilePropertiseController());
  List<dynamic> token = [];
  List<dynamic> newTokenList = [];
  var agentController = Get.put(AgentController());
  // var notificationsController = Get.put(Notificationcontroller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getTokens();
    assignData();
  }

  void assignData() async {
    token = await getTokens();

    // print("^^^^^^^^^^^^^^^^^^^^^token are ${token.toString()}");

    for (var v in token) {
      newTokenList.add(v['token']);
    }

    if (kDebugMode) {
      print("#####################################$newTokenList");
    }
  }

  @override
  // ignore: override_on_non_overriding_member
  final bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        title: Text(
          "Properties",
          style: AppTextStyles.heading1,
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: Container(
                margin: EdgeInsets.only(
                    left: 2.0.w, right: 2.0.w, top: 1.0.h, bottom: 1.0.h),
                height: 100.0.h,
                width: 100.0.w,
                decoration: CustomDecorations.mainCon,
                child: Obx(
                  () => profilePropertiseController.loadingPropertise.value
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: AppColors.appthem,
                        ))
                      : profilePropertiseController
                                  .errorLoadingPropertise.value !=
                              ""
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      profilePropertiseController.getPropertise(
                                          profilePropertiseController.userid ??
                                              0);
                                    },
                                    icon: const Icon(Icons.refresh)),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Text(profilePropertiseController
                                    .errorLoadingPropertise.value),
                              ],
                            )
                          : profilePropertiseController
                                      .profilePropertiseModel.data?.length ==
                                  0
                              ? Center(child: Text("No Propertise Found"))
                              : ListView.builder(
                                  itemCount: profilePropertiseController
                                      .profilePropertiseModel.data?.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          top: 1.0.h,
                                          left: 3.0.w,
                                          right: 3.0.w),
                                      decoration: CustomDecorations.mainCon
                                          .copyWith(
                                              border: Border.all(
                                                  color: AppColors.appthem)),
                                      child: ExpansionTile(
                                        title: Row(
                                          children: [
                                            Text(
                                              "ID",
                                              style: AppTextStyles.heading1
                                                  .copyWith(
                                                      color: AppColors.appthem,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 25.0.w,
                                            ),
                                            Text(
                                              profilePropertiseController
                                                  .profilePropertiseModel
                                                  .data![index]
                                                  .id
                                                  .toString(),
                                              style: AppTextStyles.heading1
                                                  .copyWith(
                                                      color: AppColors.appthem,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        subtitle: Row(
                                          children: [
                                            Text(
                                              "Title",
                                              style: AppTextStyles.heading1
                                                  .copyWith(
                                                      color: AppColors.appthem),
                                            ),
                                            SizedBox(
                                              width: 20.0.w,
                                            ),
                                            Text(
                                              profilePropertiseController
                                                  .profilePropertiseModel
                                                  .data![index]
                                                  .name
                                                  .toString(),
                                              style: AppTextStyles.heading1
                                                  .copyWith(
                                                      color: AppColors.appthem),
                                            ),
                                          ],
                                        ),
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                "Plot No",
                                                style: AppTextStyles.heading1
                                                    .copyWith(
                                                        color:
                                                            AppColors.appthem),
                                              ),
                                              SizedBox(
                                                width: 2.0.w,
                                              ),
                                              Text(
                                                profilePropertiseController
                                                    .profilePropertiseModel
                                                    .data![index]
                                                    .plotNumber
                                                    .toString(),
                                                style: AppTextStyles.heading1
                                                    .copyWith(
                                                        color:
                                                            AppColors.appthem),
                                              ),
                                              ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          AppColors.appthem,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          300))),
                                                  onPressed: () {
                                                    agentController.getAgent(
                                                        profilePropertiseController
                                                                .profilePropertiseModel
                                                                .data![index]
                                                                .id ??
                                                            0);
                                                    agentController.propId =
                                                        profilePropertiseController
                                                                .profilePropertiseModel
                                                                .data![index]
                                                                .id ??
                                                            0;

                                                    _showBottomSheet(
                                                        context,
                                                        profilePropertiseController
                                                            .profilePropertiseModel
                                                            .data![index]
                                                            .id
                                                            .toString(),
                                                        profilePropertiseController
                                                                .profilePropertiseModel
                                                                .data![index]
                                                                .name ??
                                                            "");
                                                  },
                                                  child: Text(
                                                    "Assign Agents",
                                                    style: AppTextStyles
                                                        .heading1
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 10.sp),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                )),
          )
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String id, String title) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
              height: 50.0.h,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Obx(() => agentController.loadingAgent.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.appthem,
                      ),
                    )
                  : agentController.errorLoadingAgent.value != ""
                      ? Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  agentController
                                      .getAgent(agentController.propId);
                                },
                                icon: const Icon(Icons.refresh)),
                            Text(agentController.errorLoadingAgent.value),
                          ],
                        )
                      : agentController.agentModel.data!.length == 0
                          ? Center(child: Text("No Agents Found"))
                          : Column(
                              children: [
                                SizedBox(
                                  height: 40.0.h,
                                  //   color: Colors.red,
                                  child: ListView.builder(
                                      padding: EdgeInsets.only(top: 2.0.h),
                                      itemCount: agentController
                                          .agentModel.data!.length,
                                      itemBuilder: ((context, index) {
                                        return Container(
                                          decoration: CustomDecorations.mainCon,
                                          margin: const EdgeInsets.all(7),
                                          height: 40,
                                          width: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                agentController
                                                    .agentModel.data![index].id
                                                    .toString(),
                                                style: AppTextStyles.heading1
                                                    .copyWith(
                                                        color:
                                                            AppColors.appthem),
                                              ),
                                              SizedBox(
                                                width: 65.0.w,
                                                //   color: Colors.red,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    agentController
                                                            .agentModel
                                                            .data![index]
                                                            .username ??
                                                        "",
                                                    style: AppTextStyles
                                                        .heading1
                                                        .copyWith(
                                                            color: AppColors
                                                                .appthem),
                                                  ),
                                                ),
                                              ),
                                              Obx(() => agentController
                                                      .agentModel
                                                      .data![index]
                                                      .isAsign
                                                      .value
                                                  ? IconButton(
                                                      onPressed: () {
                                                        agentController
                                                            .agentModel
                                                            .data![index]
                                                            .isAsign
                                                            .value = false;

                                                        agentController.agents
                                                            .removeAt(index);

                                                        print(agentController
                                                            .agents.length);
                                                      },
                                                      icon: const Icon(
                                                          Icons.done))
                                                  : IconButton(
                                                      onPressed: () {
                                                        agentController
                                                            .agentModel
                                                            .data![index]
                                                            .isAsign
                                                            .value = true;

                                                        //////////////////////

                                                        agentController.agents
                                                            .add(agentController
                                                                .agentModel
                                                                .data![index]
                                                                .id);

                                                        if (kDebugMode) {
                                                          print(agentController
                                                              .agents.length);
                                                        }
                                                      },
                                                      icon: const Icon(
                                                          Icons.add_box)))
                                            ],
                                          ),
                                        );
                                      })),
                                ),
                                Obx(() =>
                                    agentController.loadingAssingerdAgent.value
                                        ? const CircularProgressIndicator()
                                        : Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: CustomButton(
                                              onPressed: () {
                                                agentController
                                                    .assignAgents(context);

                                                agentController.agents.clear();

                                                _sendPushNotitfications(
                                                    "$title property assign to new agents",
                                                    "prologics",
                                                    id);
                                              },
                                              text: "Save",
                                            ),
                                          ))
                              ],
                            )));
        });
  }

////////////////////////////////////////////////////////show push notifications method
  Future<void> _sendPushNotitfications(
      String message, String title, String id) async {
    Map data = {
      "registration_ids": newTokenList,
      "notification": {
        "body": message,
        "title": title,
        "android_channel_id": "pushnotificationapp",
        "image": AppImageResources.applogo,
        "sound": true
      },
      "data": {
        "_id": id,
      }
    };

    var url = "https://fcm.googleapis.com/fcm/send";

    var res = http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json", "Authorization": serverKey},
      body: json.encode(data),
      encoding: Encoding.getByName('utf-8'),
    );
  }

  ////////////////////////////////get token from firebase

  Future<List<dynamic>> getTokens() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection("devicetokens").get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
