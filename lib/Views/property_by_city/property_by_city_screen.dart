// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../data/Controllers/property_bycity_controller.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/constants/image_resources.dart';
import '../../utils/styles/app_textstyles.dart';
import '../../utils/styles/custom_decorations.dart';
import '../Property_by_id/property_by_id.dart';

class PropertyByCityScreen extends StatefulWidget {
  int? id;
  String? cityName;

  PropertyByCityScreen({super.key, required this.id, required this.cityName});

  @override
  State<PropertyByCityScreen> createState() => _PropertyByCityScreenState();
}

class _PropertyByCityScreenState extends State<PropertyByCityScreen> {
  final propertybyCityController = Get.put(PropertyByCityController());
  // final likeController = Get.put(PostLikeController());
  // var postCommentsController = Get.put(PostCommentsController());
  // var getLatestCommentsController = Get.put(GetLatestCommnets());

  int? uid;
  final List<TextEditingController> _controllers = [];

  void _refresh() {
    propertybyCityController.getPropertyByCity(widget.id!);
  }

  void getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      uid = pref.getInt("userid") ?? 0;
    });
  }

  @override
  void initState() {
    propertybyCityController.getPropertyByCity(widget.id!);
    getUserId();
    // PropertyByCityService.getPropertyByCityServiceImages(widget.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(
        "********************************property by City**************${widget.id} ${widget.cityName}");
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.cityName}", style: AppTextStyles.heading1),
          backgroundColor: AppColors.appthem,
        ),
        body: Obx(() => propertybyCityController.loadingPropertyByCity.value
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.appthem,
                  ))
                : propertybyCityController.errorLoadingPropertyByCity.value !=
                        ''
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                propertybyCityController
                                    .getPropertyByCity(widget.id!);
                              },
                              icon: const Icon(Icons.refresh)),
                          Text(propertybyCityController
                              .errorLoadingPropertyByCity.value),
                        ],
                      ))
                    : GetBuilder<PropertyByCityController>(
                        init: PropertyByCityController(),
                        initState: (_) {},
                        builder: (controller) {
                          return ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              _controllers.add(TextEditingController());

                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 5.0.w,
                                        right: 5.0.w,
                                        top: index == 0 ? 1.0.h : 2.0.h),
                                    //  height: 45.0.h,
                                    width: 100.0.w,
                                    decoration: CustomDecorations.mainCon,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(children: [
                                          SizedBox(
                                            height: 200,
                                            width: 100.w,

                                            // ignore: prefer_const_constructors
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10)),
                                              child: Image.asset(
                                                AppImageResources.property,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ]),
                                        SizedBox(
                                          width: 2.0.h,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 3.5.h,
                                                width: 22.0.w,
                                                decoration: BoxDecoration(
                                                    color: AppColors.appthem,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            300)),
                                                child: Center(
                                                    child: Text(
                                                  propertybyCityController
                                                      .propertybyCityModel
                                                      .data!
                                                      .data![index]
                                                      .id
                                                      .toString(),
                                                  style: AppTextStyles
                                                      .labelSmall
                                                      .copyWith(
                                                          color: AppColors
                                                              .colorWhite),
                                                )),
                                              ),
                                              Text(
                                                  " ${propertybyCityController.propertybyCityModel.data!.data![index].price}",
                                                  style: AppTextStyles.heading1
                                                      .copyWith(
                                                          color: AppColors
                                                              .colorblack,
                                                          fontSize: 10.sp))
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 2.0.w,
                                          ),
                                          child: Text(
                                            propertybyCityController
                                                    .propertybyCityModel
                                                    .data!
                                                    .data![index]
                                                    .description ??
                                                "",
                                            style:
                                                AppTextStyles.heading1.copyWith(
                                              color: AppColors.colorblack,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.0.h,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(right: 2.0.w),
                                          child: Row(
                                            // crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: 2.0.w,
                                              ),
                                              Image.asset(
                                                AppImageResources.bed,
                                                height: 2.0.h,
                                              ),
                                              SizedBox(
                                                width: 2.0.w,
                                              ),
                                              Text(
                                                propertybyCityController
                                                        .propertybyCityModel
                                                        .data!
                                                        .data![index]
                                                        .numberBedroom ??
                                                    "",
                                                style: AppTextStyles.labelSmall
                                                    .copyWith(fontSize: 9.sp),
                                              ),
                                              SizedBox(
                                                width: 2.0.w,
                                              ),
                                              Image.asset(
                                                AppImageResources.bath,
                                                height: 2.0.h,
                                              ),
                                              SizedBox(
                                                width: 2.0.w,
                                              ),
                                              Text(
                                                propertybyCityController
                                                        .propertybyCityModel
                                                        .data!
                                                        .data![index]
                                                        .numberBathroom ??
                                                    "",
                                                style: AppTextStyles.labelSmall
                                                    .copyWith(fontSize: 9.sp),
                                              ),
                                              SizedBox(
                                                width: 2.0.w,
                                              ),
                                              Image.asset(
                                                AppImageResources.plots,
                                                height: 2.0.h,
                                              ),
                                              SizedBox(
                                                width: 2.0.w,
                                              ),
                                              Text(
                                                propertybyCityController
                                                        .propertybyCityModel
                                                        .data!
                                                        .data![index]
                                                        .square ??
                                                    "",
                                                style: AppTextStyles.labelSmall
                                                    .copyWith(fontSize: 9.sp),
                                              )
                                            ],
                                          ),
                                        ),
                                        const Divider(),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.asset(
                                                AppImageResources.loc,
                                                height: 2.0.h,
                                              ),
                                              SizedBox(
                                                width: 2.0.w,
                                              ),
                                              SizedBox(
                                                width: 40.w,
                                                child: Text(
                                                  propertybyCityController
                                                          .propertybyCityModel
                                                          .data!
                                                          .data![index]
                                                          .location ??
                                                      "",
                                                  style:
                                                      AppTextStyles.labelSmall,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 17.0.w,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(() => PropertyByID(
                                                        id: propertybyCityController
                                                            .propertybyCityModel
                                                            .data!
                                                            .data![index]
                                                            .id,
                                                      ));
                                                },
                                                child: Container(
                                                  height: 3.5.h,
                                                  width: 22.0.w,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.appthem,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              300)),
                                                  child: Center(
                                                      child: Text(
                                                    "View ",
                                                    style: AppTextStyles
                                                        .labelSmall
                                                        .copyWith(
                                                            color: AppColors
                                                                .colorWhite),
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 24.0.w,
                                  ),
                                  // Container(
                                  //   margin: EdgeInsets.only(
                                  //       right: 5.0.w,
                                  //       left: 5.0.w,
                                  //       top: index == 0 ? 1.0.h : 2.0.h),
                                  //   height: 6.0.h,
                                  //   width: 100.w,
                                  //   decoration: CustomDecorations.mainCon,
                                  //   child: Row(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.spaceEvenly,
                                  //       children: [
                                  //         d == 1
                                  //             ? const Icon(
                                  //                 Icons.favorite,
                                  //                 color: Colors.red,
                                  //               )
                                  //             : IconButton(
                                  //                 onPressed: () async {
                                  //                   likeController.getPostLike(
                                  //                       propertybyCityController
                                  //                           .propertybyCityModel
                                  //                           .data!
                                  //                           .data![index]
                                  //                           .id
                                  //                           .toString(),
                                  //                       uid!);

                                  //                   _refresh();

                                  //                   // print(
                                  //                   //     "detector call ==========${newsfeedController.newsfeedmodel.data!.data![index].likesOnProperties?[0].isliked}");
                                  //                   // setState(() {
                                  //                   //   newsfeedController
                                  //                   //       .getnewsfeed(pagekey);
                                  //                   // });
                                  //                 },
                                  //                 icon: const Icon(
                                  //                   Icons.favorite_border,
                                  //                 )),

                                  //         // const Icon(Icons.favorite_border_outlined),
                                  //         GestureDetector(
                                  //           onTap: () {
                                  //             likeController.getPostLike(
                                  //                 propertybyCityController
                                  //                     .propertybyCityModel
                                  //                     .data!
                                  //                     .data![index]
                                  //                     .id
                                  //                     .toString(),
                                  //                 uid!);
                                  //             setState(() {});
                                  //           },
                                  //           child: Text(
                                  //             "Likee",
                                  //             style: AppTextStyles.labelSmall
                                  //                 .copyWith(
                                  //               fontSize: 13.sp,
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         SizedBox(
                                  //           width: 3.0.w,
                                  //         ),
                                  //         const Icon(Icons.comment_outlined),
                                  //         // Image.asset(
                                  //         //   AppImageResources.bed,
                                  //         //   height: 4.0.h,
                                  //         // ),
                                  //         InkWell(
                                  //           onTap: () async {
                                  //             getLatestCommentsController
                                  //                 .getLatestCommnets(
                                  //                     propertybyCityController
                                  //                         .propertybyCityModel
                                  //                         .data!
                                  //                         .data![index]
                                  //                         .id!);
                                  //             await Future.delayed(
                                  //                 const Duration(
                                  //                     milliseconds: 400));
                                  //             _showModelSheet(
                                  //                 context,
                                  //                 propertybyCityController
                                  //                     .propertybyCityModel
                                  //                     .data!
                                  //                     .data![index]
                                  //                     .id!);
                                  //           },
                                  //           child: Text(
                                  //             "Comment",
                                  //             style: AppTextStyles.labelSmall,
                                  //           ),
                                  //         ),
                                  //         SizedBox(
                                  //           width: 3.0.w,
                                  //         ),
                                  //         const Icon(Icons.share),
                                  //         // Image.asset(
                                  //         //   AppImageResources.bed,
                                  //         //   height: 3.0.h,
                                  //         // ),
                                  //         Text(
                                  //           "Share",
                                  //           style: AppTextStyles.labelSmall,
                                  //         )
                                  //       ]),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(
                                  //       right: 4.0.w, left: 4.0.w, top: 2.0.h),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceAround,
                                  //     children: [
                                  //       Expanded(
                                  //         child: CustomTextField(
                                  //           editingController:
                                  //               _controllers[index],
                                  //           hintText: 'Write Comment....',
                                  //         ),
                                  //       ),
                                  //       SizedBox(
                                  //         width: 3.0.w,
                                  //       ),
                                  //       Container(
                                  //         height: 12.0.w,
                                  //         width: 12.0.w,
                                  //         decoration: BoxDecoration(
                                  //             color: AppColors.appthem,
                                  //             borderRadius:
                                  //                 BorderRadius.circular(300)),
                                  //         child: Center(
                                  //           child: IconButton(
                                  //               color: AppColors.colorWhite,
                                  //               onPressed: () {
                                  //                 postCommentsController
                                  //                     .postComments(
                                  //                         index,
                                  //                         propertybyCityController
                                  //                             .propertybyCityModel
                                  //                             .data!
                                  //                             .data![index]
                                  //                             .id,
                                  //                         uid,
                                  //                         _controllers[index]
                                  //                             .text);

                                  //                 _controllers[index].clear();
                                  //               },
                                  //               icon: const Icon(
                                  //                 Icons.send,
                                  //                 size: 20,
                                  //               )),
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  // )
                                ],
                              );

                              ///////////
                            },
                            itemCount: propertybyCityController
                                .propertybyCityModel.data?.data!.length,
                          );
                        })

            //  ListView.builder(
            //     itemCount: propertybyCityController
            //         .propertybyCityModel.data!.data!.length,
            //     padding: EdgeInsets.only(top: 1.0.h, bottom: 1.0.h),
            //     scrollDirection: Axis.vertical,
            //     itemBuilder: (context, index) {
            //       return GestureDetector(
            //         onTap: () {},
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Container(
            //             margin: EdgeInsets.only(
            //                 left: index == 0 ? 2.0.w : 3.0.w,
            //                 right: index ==
            //                         propertybyCityController
            //                                 .propertybyCityModel
            //                                 .data!
            //                                 .data!
            //                                 .length -
            //                             1
            //                     ? 2.0.w
            //                     : 0.0.w),
            //             height: Get.height * .5,
            //             width: 50.0.w,
            //             decoration: CustomDecorations.mainCon,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Container(
            //                     height: 30.0.h,
            //                     width: 100.0.w,
            //                     decoration: const BoxDecoration(
            //                       borderRadius: BorderRadius.only(
            //                         topLeft: Radius.circular(10),
            //                         topRight: Radius.circular(10),
            //                       ),
            //                     ),
            //                     child: ClipRRect(
            //                       borderRadius: const BorderRadius.only(
            //                         topLeft: Radius.circular(10),
            //                         topRight: Radius.circular(10),
            //                       ),
            //                       child:
            //                           //  Image.asset(
            //                           //   "assets/icons.house.png",
            //                           //   height: 50,
            //                           //   width: 50,
            //                           // ),

            //                           Image(
            //                         image: NetworkImage(
            //                             "${AppUrls.baseUrl2}${propertybyCityController.propertybyCityModel.data!.data![index].images!.the1}"
            //                             //  "${AppUrls.baseUrl2}${propertybyCityController.propertybyCityModel.data!.data![index].images!.the1}",
            //                             ),
            //                         fit: BoxFit.cover,
            //                       ),
            //                     )),
            //                 SizedBox(
            //                   height: 2.0.h,
            //                 ),
            //                 Row(
            //                   // mainAxisAlignment:
            //                   //     MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     SizedBox(
            //                       width: 2.0.w,
            //                     ),
            //                     Column(
            //                       crossAxisAlignment:
            //                           CrossAxisAlignment.start,
            //                       children: [
            //                         Text(
            //                           propertybyCityController
            //                                   .propertybyCityModel
            //                                   .data!
            //                                   .data![index]
            //                                   .name ??
            //                               '',
            //                           style: AppTextStyles.labelSmall,
            //                         ),
            //                         Text(
            //                           "Location: ${propertybyCityController.propertybyCityModel.data!.data![index].location ?? ""} ",
            //                           style: AppTextStyles.labelSmall
            //                               .copyWith(
            //                                   color: Colors.grey,
            //                                   fontSize: 10.sp),
            //                         ),
            //                         Text(
            //                           "bedRroms: ${propertybyCityController.propertybyCityModel.data!.data![index].numberBedroom ?? ""} ",
            //                           style: AppTextStyles.labelSmall
            //                               .copyWith(
            //                                   color: Colors.grey,
            //                                   fontSize: 10.sp),
            //                         ),
            //                         Text(
            //                           "Floor: ${propertybyCityController.propertybyCityModel.data!.data![index].numberFloor ?? ""} ",
            //                           style: AppTextStyles.labelSmall
            //                               .copyWith(
            //                                   color: Colors.grey,
            //                                   fontSize: 10.sp),
            //                         ),
            //                         Text(
            //                           "Bathrooms: ${propertybyCityController.propertybyCityModel.data!.data![index].numberBathroom ?? ""} ",
            //                           style: AppTextStyles.labelSmall
            //                               .copyWith(
            //                                   color: Colors.grey,
            //                                   fontSize: 10.sp),
            //                         )
            //                       ],
            //                     ),
            //                     const Spacer(),
            //                     Text(
            //                       "Rs: ${propertybyCityController.propertybyCityModel.data!.data![index].price ?? ''}",
            //                       style: AppTextStyles.labelSmall,
            //                     ),
            //                     Container(
            //                       height: 7.0.w,
            //                       width: 7.0.w,
            //                       decoration: BoxDecoration(
            //                           color: AppColors.appthem,
            //                           borderRadius:
            //                               BorderRadius.circular(300)),
            //                       child: const Center(
            //                           child: Icon(
            //                         Icons.arrow_forward_ios,
            //                         color: Colors.white,
            //                         size: 14,
            //                       )),
            //                     ),
            //                     SizedBox(
            //                       width: 2.0.w,
            //                     )
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       );
            // })
            ));
  }

  // void _showModelSheet(BuildContext context, int pid) {
  //   showModalBottomSheet(
  //       backgroundColor: Colors.transparent,
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //           height: 30.0.h,
  //           width: 100.0.w,
  //           decoration: const BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(10),
  //                   topRight: Radius.circular(10))),
  //           child: Container(
  //               margin: const EdgeInsets.all(10),
  //               height: 20.0.h,
  //               width: 100.0.w,
  //               //   color: Colors.red,
  //               child: Obx(
  //                 () => getLatestCommentsController.loadingCommnets.value
  //                     ? const Center(
  //                         child: CircularProgressIndicator(
  //                         color: AppColors.appthem,
  //                       ))
  //                     : getLatestCommentsController.error.value != ""
  //                         ? Column(
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               IconButton(
  //                                   onPressed: () {
  //                                     getLatestCommentsController
  //                                         .getLatestCommnets(pid);
  //                                   },
  //                                   icon: const Icon(Icons.refresh)),
  //                               SizedBox(
  //                                 height: 1.0.h,
  //                               ),
  //                               Text(getLatestCommentsController.error.value),
  //                             ],
  //                           )
  //                         : getLatestCommentsController
  //                                 .commnetsModel.data!.isEmpty
  //                             ? const Center(child: Text("No Commnets Yet"))
  //                             : ListView.builder(
  //                                 itemCount: getLatestCommentsController
  //                                     .commnetsModel.data!.length,
  //                                 itemBuilder: (context, index) {
  //                                   return Column(
  //                                     children: [
  //                                       Padding(
  //                                         padding: const EdgeInsets.all(8.0),
  //                                         child: Row(
  //                                           children: [
  //                                             Container(
  //                                               height: 12.0.w,
  //                                               width: 12.0.w,
  //                                               decoration: BoxDecoration(
  //                                                   borderRadius:
  //                                                       BorderRadius.circular(
  //                                                           300)),
  //                                               child: ClipRRect(
  //                                                 borderRadius:
  //                                                     BorderRadius.circular(
  //                                                         300),
  //                                                 child: Image.asset(
  //                                                     "assets/user.png"),
  //                                               ),
  //                                             ),
  //                                             SizedBox(
  //                                               width: 3.0.w,
  //                                             ),
  //                                             Expanded(
  //                                               child: Container(
  //                                                 decoration: BoxDecoration(
  //                                                     color: Colors.grey[200],
  //                                                     borderRadius:
  //                                                         BorderRadius.circular(
  //                                                             10)),
  //                                                 child: Padding(
  //                                                   padding:
  //                                                       const EdgeInsets.all(
  //                                                           8.0),
  //                                                   child: Row(
  //                                                     crossAxisAlignment:
  //                                                         CrossAxisAlignment
  //                                                             .start,
  //                                                     children: [
  //                                                       Column(
  //                                                         crossAxisAlignment:
  //                                                             CrossAxisAlignment
  //                                                                 .start,
  //                                                         children: [
  //                                                           Text(
  //                                                             getLatestCommentsController
  //                                                                     .commnetsModel
  //                                                                     .data![
  //                                                                         index]
  //                                                                     .user!
  //                                                                     .username ??
  //                                                                 "",
  //                                                             style: AppTextStyles
  //                                                                 .appbar
  //                                                                 .copyWith(
  //                                                                     color: Colors
  //                                                                         .black,
  //                                                                     fontWeight:
  //                                                                         FontWeight
  //                                                                             .bold),
  //                                                           ),
  //                                                           SizedBox(
  //                                                             width: 70.0.w,
  //                                                             child: Text(
  //                                                               getLatestCommentsController
  //                                                                       .commnetsModel
  //                                                                       .data![
  //                                                                           index]
  //                                                                       .comment ??
  //                                                                   "",
  //                                                               maxLines: 4,
  //                                                               style:
  //                                                                   AppTextStyles
  //                                                                       .appbar
  //                                                                       .copyWith(
  //                                                                 color: Colors
  //                                                                     .black,
  //                                                               ),
  //                                                             ),
  //                                                           )
  //                                                         ],
  //                                                       ),
  //                                                     ],
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             )
  //                                           ],
  //                                         ),
  //                                       ),
  //                                       const Divider()
  //                                     ],
  //                                   );
  //                                 }),
  //               )),
  //         );
  //       });
  // }
}

// DateFormat("dd-MM-yyyy").format(DateTime.parse(
//                                 propertybyyidController
//                                     .propertybyIDmodel.data!.city!.createdAt
//                                     .toString())),


// Container(
//             margin: EdgeInsets.only(
//               right: 5.0.w,
//               left: 5.0.w,
//             ),
//             height: 6.0.h,
//             width: 100.w,
//             decoration: CustomDecorations.mainCon,
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // Image.asset(
//                   //   AppImageResources.bed,
//                   //   height: 4.0.h,
//                   // ),

//                   const Icon(Icons.favorite_border_outlined),
//                   Text(
//                     "Like",
//                     style: AppTextStyles.labelSmall.copyWith(
//                       fontSize: 13.sp,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 3.0.w,
//                   ),
//                   const Icon(Icons.comment_outlined),
//                   // Image.asset(
//                   //   AppImageResources.bed,
//                   //   height: 4.0.h,
//                   // ),
//                   Text(
//                     "Comment",
//                     style: AppTextStyles.labelSmall,
//                   ),
//                   SizedBox(
//                     width: 3.0.w,
//                   ),
//                   const Icon(Icons.share),
//                   // Image.asset(
//                   //   AppImageResources.bed,
//                   //   height: 3.0.h,
//                   // ),
//                   Text(
//                     "Share",
//                     style: AppTextStyles.labelSmall,
//                   )
//                 ]),
//           ),