import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:prologic_29/data/Controllers/agent_controller/agent_controller.dart';
import 'package:prologic_29/data/Controllers/user_profile_section_controller/profile_propertise_controller/profile_all_propertise_controller.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';

class PropertiseSection extends StatelessWidget {
  var profilePropertiseController = Get.put(ProfilePropertiseController());
  var agentController = Get.put(AgentController());
  PropertiseSection({super.key});

  @override
  final bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        title: Text(
          "Propertise",
          style: AppTextStyles.heading1,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 2.0.h, left: 2.0.w, right: 2.0.w),
            height: 16.0.h,
            width: 100.0.w,
            decoration: CustomDecorations.mainCon,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search))),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 2.0.w,
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        onPressed: () {},
                        text: "Create",
                      ),
                    ),
                    SizedBox(
                      width: 2.0.w,
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        onPressed: () {
                          profilePropertiseController.getPropertise(
                              profilePropertiseController.userid ?? 0);
                        },
                        text: "Reload",
                      ),
                    ),
                    SizedBox(
                      width: 2.0.w,
                    ),
                  ],
                )
              ],
            ),
          ),
          Flexible(
            child: Container(
                margin: EdgeInsets.only(
                    left: 2.0.w, right: 2.0.w, top: 1.0.h, bottom: 1.0.h),
                height: 70.0.h,
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
                          : ListView.builder(
                              itemCount: profilePropertiseController
                                  .profilePropertiseModel.data?.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      top: 1.0.h, left: 3.0.w, right: 3.0.w),
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
                                                  fontWeight: FontWeight.bold),
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
                                                  fontWeight: FontWeight.bold),
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
                                                    color: AppColors.appthem),
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
                                                    color: AppColors.appthem),
                                          ),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      AppColors.appthem,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
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

                                                _showBottomSheet(context);
                                              },
                                              child: Text(
                                                "Assign Agents",
                                                style: AppTextStyles.heading1
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 10.sp),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                );

                                // Container(
                                //   margin: EdgeInsets.only(
                                //       left: 2.0.w,
                                //       right: 2.0.w,
                                //       top: index == 0 ? 1.0.h : 2.0.h,
                                //       bottom: index == 5 ? 2.0.h : 0.0.h),
                                //   height: 12.0.h,
                                //   width: 100.0.w,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(10),
                                //     color: index % 2 == 0
                                //         ? Colors.grey[400]
                                //         : Colors.grey[300],
                                //   ),
                                //   child: Column(
                                //     children: [
                                //       SizedBox(
                                //         height: 4.0.h,
                                //         width: 100.0.w,
                                //         child: Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.spaceAround,
                                //           children: [
                                //             Text(
                                //               "${profilePropertiseController.profilePropertiseModel.data![index].id ?? ""}",
                                //               style: AppTextStyles.heading1
                                //                   .copyWith(
                                //                       color: AppColors.appthem),
                                //             ),
                                //             Text(
                                //               profilePropertiseController
                                //                   .profilePropertiseModel
                                //                   .data![index]
                                //                   .name
                                //                   .toString(),
                                //               style: AppTextStyles.heading1
                                //                   .copyWith(
                                //                       color: AppColors.appthem),
                                //             ),
                                //             Text(
                                //               profilePropertiseController
                                //                       .profilePropertiseModel
                                //                       .data![index]
                                //                       .type!
                                //                       .name ??
                                //                   "",
                                //               style: AppTextStyles.heading1
                                //                   .copyWith(
                                //                       color: AppColors.appthem),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //       const Divider(),
                                //       SizedBox(
                                //         height: 4.0.h,
                                //         width: 100.0.w,
                                //         child: Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.spaceAround,
                                //           children: [
                                //             const SizedBox(),
                                //             Container(
                                //               height: 12.0.w,
                                //               width: 10.0.w,
                                //               decoration: BoxDecoration(
                                //                   color: Colors.blue,
                                //                   borderRadius:
                                //                       BorderRadius.circular(
                                //                           10)),
                                //               child: const Icon(
                                //                 Icons.note_add,
                                //                 color: Colors.white,
                                //               ),
                                //             ),
                                //             const SizedBox(),
                                //             Container(
                                //               height: 12.0.w,
                                //               width: 10.0.w,
                                //               decoration: BoxDecoration(
                                //                   color: Colors.red,
                                //                   borderRadius:
                                //                       BorderRadius.circular(
                                //                           10)),
                                //               child: const Icon(
                                //                 Icons.delete,
                                //                 color: Colors.white,
                                //               ),
                                //             ),
                                //             const SizedBox(),
                                //             ElevatedButton(
                                //                 style: ElevatedButton.styleFrom(
                                //                     backgroundColor:
                                //                         Colors.green),
                                //                 onPressed: () {
                                //                   agentController.getAgent(
                                //                       profilePropertiseController
                                //                               .profilePropertiseModel
                                //                               .data![index]
                                //                               .id ??
                                //                           0);
                                //                   agentController.propId =
                                //                       profilePropertiseController
                                //                               .profilePropertiseModel
                                //                               .data![index]
                                //                               .id ??
                                //                           0;

                                //                   _showBottomSheet(context);
                                //                 },
                                //                 child: Text(
                                //                   "Assign Agents",
                                //                   style: AppTextStyles.heading1
                                //                       .copyWith(
                                //                           color: Colors.white),
                                //                 )),
                                //             const SizedBox(),
                                //           ],
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // );
                              }),
                )),
          )
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
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
                      : Column(
                          children: [
                            SizedBox(
                              height: 40.0.h,
                              //   color: Colors.red,
                              child: ListView.builder(
                                  padding: EdgeInsets.only(top: 2.0.h),
                                  itemCount:
                                      agentController.agentModel.data!.length,
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
                                                    color: AppColors.appthem),
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
                                                style: AppTextStyles.heading1
                                                    .copyWith(
                                                        color:
                                                            AppColors.appthem),
                                              ),
                                            ),
                                          ),
                                          Obx(() => agentController.agentModel
                                                  .data![index].isAsign.value
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
                                                  icon: const Icon(Icons.done))
                                              : IconButton(
                                                  onPressed: () {
                                                    agentController
                                                        .agentModel
                                                        .data![index]
                                                        .isAsign
                                                        .value = true;

                                                    //////////////////////

                                                    agentController.agents.add(
                                                        agentController
                                                            .agentModel
                                                            .data![index]
                                                            .id);

                                                    print(agentController
                                                        .agents.length);
                                                  },
                                                  icon: const Icon(
                                                      Icons.add_box)))
                                        ],
                                      ),
                                    );
                                  })),
                            ),
                            Obx(() => agentController
                                    .loadingAssingerdAgent.value
                                ? const CircularProgressIndicator()
                                : Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CustomButton(
                                      onPressed: () {
                                        agentController.assignAgents(context);

                                        agentController.agents.clear();
                                      },
                                      text: "Save",
                                    ),
                                  ))
                          ],
                        )));
        });
  }
}
