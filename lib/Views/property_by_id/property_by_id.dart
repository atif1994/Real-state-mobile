import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../data/Controllers/property_controllers/propertyby_id_controller.dart';
import '../../data/Controllers/sendchat_controller/send_chat_controller.dart';
import '../../utils/constants/app_urls.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/constants/image_resources.dart';
import '../../utils/styles/app_textstyles.dart';
import '../../utils/styles/custom_decorations.dart';

class PropertyByID extends StatefulWidget {
  PropertyByID({super.key, this.name, this.id, this.agentId, this.userId});
  int? id;
  String? name;
  int? agentId;
  int? userId;

  @override
  State<PropertyByID> createState() => _PropertyByIDState();
}

class _PropertyByIDState extends State<PropertyByID> {
  final propertybyyidController = Get.put(PropertyByIDController());

  @override
  void initState() {
    propertybyyidController.getPropertyById(widget.id!);

    super.initState();
  }

  final sendChatController = Get.put(SendChatController());
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    final oCcy = NumberFormat("##,##,###", "en_INR");
    return Scaffold(
        appBar: AppBar(
          title: Text(
              propertybyyidController.propertybyIDmodel.data?.name ?? "",
              style: AppTextStyles.heading1),
          backgroundColor: AppColors.appthem,
        ),
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: Container(
        //   padding: const EdgeInsets.symmetric(
        //     vertical: 10,
        //     horizontal: 0,
        //   ),
        //   width: screenWidth,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       SizedBox(
        //         height: 55,
        //         width: 150,
        //         child: FloatingActionButton(
        //           elevation: 5,
        //           onPressed: () {
        //             sendChatController.getSendChatApi(
        //                 userId: widget.userId,
        //                 agentId: widget.agentId,
        //                 msg: "hi");
        //             Get.to(ConversationScreen());
        //             // Get.to(Chating(
        //             //   conId: sendChatController
        //             //       .sendChatModel.data![0].conversationId
        //             //       .toString(),
        //             //   customerId: sendChatController
        //             //       .sendChatModel.data![0].customer!.id
        //             //       .toString(),
        //             //   agentId: sendChatController.sendChatModel.data![0].agent
        //             //       .toString(),
        //             // ));
        //             print(
        //                 "data after send api conid=  ${sendChatController.sendChatModel.data![0].conversationId}  custoid=${sendChatController.sendChatModel.data![0].customer!.id} agent= ${sendChatController.sendChatModel.data![0].agent} ");
        //           },
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(75.0),
        //           ),
        //           heroTag: null,
        //           child: Ink(
        //             decoration: BoxDecoration(
        //               color: Colors.black,
        //               borderRadius: BorderRadius.circular(75.0),
        //             ),
        //             child: Container(
        //               constraints: const BoxConstraints(
        //                 maxWidth: 300.0,
        //                 minHeight: 50.0,
        //               ),
        //               alignment: Alignment.center,
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: const [
        //                   Icon(
        //                     Icons.message,
        //                     color: Colors.white,
        //                   ),
        //                   SizedBox(
        //                     width: 80,
        //                     child: Text(
        //                       "Say Hi",
        //                       textAlign: TextAlign.center,
        //                       style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 15,
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //       )
        //       // FloatingWidget(
        //       //   onPressed: () {
        //       //     print("object");
        //       //     sendChatController.getSendChatApi();
        //       //   },
        //       //   leadingIcon: Icons.mail,
        //       //   txt: "Start Chat",
        //       // ),
        //       // // FloatingWidget(
        //       //   leadingIcon: Icons.phone,
        //       //   txt: "Call",
        //       // ),
        //     ],
        //   ),
        // ),

        body: Obx(() => propertybyyidController.loadingPropertyByID.value
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.appthem,
              ))
            : propertybyyidController.errorLoadingPropertyByID.value != ''
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            propertybyyidController.getPropertyById(widget.id!);
                          },
                          icon: const Icon(Icons.refresh)),
                      Text(propertybyyidController
                          .errorLoadingPropertyByID.value),
                    ],
                  ))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            // color: Color.fromARGB(255, 216, 212, 212)
                          ),
                          height: 33.0.h,
                          width: 100.0.w,
                          child: ListView.builder(
                            padding: const EdgeInsets.only(right: 6),
                            itemCount: propertybyyidController
                                .propertybyIDmodel.data!.images!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: index == 0 ? 12 : 6,
                                    right: 6,
                                    top: 10,
                                    bottom: 10),
                                child: InkWell(
                                  onTap: () {
                                    showimage(index);
                                  },
                                  child: Container(
                                    decoration: CustomDecorations.con2.copyWith(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    height: 25.0.h,
                                    width: 85.0.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        "${AppUrls.baseUrl2}${propertybyyidController.propertybyIDmodel.data!.images![index].toString()}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        // )),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 5.0.h,
                                width: 30.0.w,
                                decoration: BoxDecoration(
                                    color: AppColors.appthem,
                                    borderRadius: BorderRadius.circular(300)),

                                child: Center(
                                    child: Text(
                                  propertybyyidController
                                          .propertybyIDmodel.data!.type!.name ??
                                      "",
                                  style: AppTextStyles.labelSmall
                                      .copyWith(color: AppColors.colorWhite),
                                )),
                                // child: Center(
                                //     child: Text(
                                //   "For sale ",
                                //   style: AppTextStyles.labelSmall
                                //       .copyWith(color: AppColors.colorWhite),
                                // )),
                              ),
                              Flexible(
                                child: Text(
                                    "Rs  ${propertybyyidController.propertybyIDmodel.data!.price ?? ""} PKR",
                                    style: AppTextStyles.heading1.copyWith(
                                        color: AppColors.colorblack,
                                        fontSize: 12.sp)),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 1.0.h, left: 4.0.w),
                              child: Text(
                                propertybyyidController
                                        .propertybyIDmodel.data!.name ??
                                    "",
                                style: AppTextStyles.heading1.copyWith(
                                  color: AppColors.colorblack,
                                ),
                              ),
                              // child: Text(
                              //   'New Property',
                              //   style: AppTextStyles.labelSmall.copyWith(
                              //     color: AppColors.colorblack,
                              //     fontSize: 13.sp,
                              //   ),
                              // ),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 0.5.h, left: 4.0.w),
                                  child: Text(
                                    "Description: ${propertybyyidController.propertybyIDmodel.data!.description ?? ""}",
                                    style: AppTextStyles.labelSmall.copyWith(
                                      color: AppColors.colorblack,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 0.5.h, left: 4.0.w),
                                child: Text(
                                  "Sector and Block Name : ${propertybyyidController.propertybyIDmodel.data!.sectorAndBlockName ?? ""}",
                                  // textAlign: TextAlign.start,
                                  style: AppTextStyles.labelSmall.copyWith(
                                    color: AppColors.colorblack,
                                  ),
                                ),
                              ),
                            ]),
                            Row(children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 0.5.h, left: 4.0.w),
                                child: Text(
                                  "Street Number : ${propertybyyidController.propertybyIDmodel.data!.streetNumber ?? ""}",
                                  // textAlign: TextAlign.start,
                                  style: AppTextStyles.labelSmall.copyWith(
                                    color: AppColors.colorblack,
                                  ),
                                ),
                              ),
                            ]),
                            Row(children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 0.5.h, left: 4.0.w),
                                child: Text(
                                  "Plot Number : ${propertybyyidController.propertybyIDmodel.data!.plotNumber ?? ""}",
                                  style: AppTextStyles.labelSmall.copyWith(
                                    color: AppColors.colorblack,
                                  ),
                                ),
                              ),
                            ]),
                            Row(children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 0.5.h, left: 4.0.w),
                                child: Text(
                                  "Floor Number : ${propertybyyidController.propertybyIDmodel.data!.numberFloor ?? ""}",
                                  style: AppTextStyles.labelSmall.copyWith(
                                    color: AppColors.colorblack,
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                        SizedBox(
                          height: 0.7.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 3.0.w),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 3.0.w,
                              ),
                              Image.asset(
                                AppImageResources.bed,
                                height: 3.0.h,
                              ),
                              SizedBox(
                                width: 3.0.w,
                              ),
                              Text(
                                propertybyyidController.propertybyIDmodel.data!
                                        .numberBedroom ??
                                    "",
                                style: AppTextStyles.heading1.copyWith(
                                  color: AppColors.colorblack,
                                ),
                              ),
                              // Text(
                              //   "3 beds",
                              //   style: AppTextStyles.labelSmall
                              //       .copyWith(fontSize: 11.sp),
                              // ),
                              SizedBox(
                                width: 3.0.w,
                              ),
                              Image.asset(
                                AppImageResources.bath,
                                height: 4.0.h,
                              ),
                              SizedBox(
                                width: 3.0.w,
                              ),
                              Text(
                                propertybyyidController.propertybyIDmodel.data!
                                        .numberBathroom ??
                                    "",
                                style: AppTextStyles.heading1.copyWith(
                                  color: AppColors.colorblack,
                                ),
                              ),
                              SizedBox(
                                width: 3.0.w,
                              ),
                              Image.asset(
                                AppImageResources.plots,
                                height: 3.0.h,
                              ),
                              SizedBox(
                                width: 2.0.w,
                              ),
                              Text(
                                propertybyyidController
                                        .propertybyIDmodel.data!.square ??
                                    "",
                                style: AppTextStyles.heading1.copyWith(
                                  color: AppColors.colorblack,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Row(children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0.5.h, left: 4.0.w),
                            child: Text(
                              'Date Posted : ',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.colorblack,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 0.5.h,
                            ),
                            child: Text(
                              DateFormat("dd-MM-yyyy").format(DateTime.parse(
                                  propertybyyidController.propertybyIDmodel
                                      .data!.category!.createdAt
                                      .toString())),
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.colorblack,
                              ),
                            ),
                          ),
                        ]),

                        Padding(
                          padding: EdgeInsets.only(
                              top: 0.6.h, left: 4.0.w, right: 1.6.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                AppImageResources.loc,
                                height: 3.0.h,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Expanded(
                                  child: Text(
                                      "${propertybyyidController.propertybyIDmodel.data!.location ?? ""} ${propertybyyidController.propertybyIDmodel.data!.city!.name ?? ""}"))
                              // Text(
                              //   propertybyyidController
                              //           .propertybyIDmodel.data!.location ??
                              //       "",
                              //   style: AppTextStyles.heading1.copyWith(
                              //     color: AppColors.colorblack,
                              //   ),
                              // ),
                              // Text(
                              //   " , ${propertybyyidController.propertybyIDmodel.data!.city!.name ?? ""}",
                              //   style: AppTextStyles.heading1.copyWith(
                              //     color: AppColors.colorblack,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  )));
  }

  showimage(index) {
    showDialog(
        // barrierLabel: 'Social Feed',
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

                return Column(
                  children: [
                    Row(
                      children: const [BackButton(), Spacer()],
                    ),
                    InteractiveViewer(
                      child: Image.network(
                        '${AppUrls.baseUrl2}${propertybyyidController.propertybyIDmodel.data!.images![index].toString()}',
                        height: 89.h,
                        width: 100.w,
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        });
  }
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

class FloatingWidget extends StatelessWidget {
  final IconData? leadingIcon;
  final String? txt;
  final Function? onPressed;
  const FloatingWidget({
    Key? key,
    this.onPressed,
    this.leadingIcon,
    this.txt,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 150,
      child: FloatingActionButton(
        elevation: 5,
        onPressed: onPressed!(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(75.0),
        ),
        heroTag: null,
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(75.0),
          ),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 300.0,
              minHeight: 50.0,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  leadingIcon,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    txt.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  final oCcy = NumberFormat("##,##,###", "en_INR");
  var screenWidth = MediaQuery.of(context).size.width;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ItemDetailScreen(

          //       imgpath_index,
          //       imageList,
          //     ),
          //   ),
          //  );
        },
        child: Container(
          height: 160,
          width: screenWidth,
          padding: const EdgeInsets.only(left: 12, right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(" imageList[imgpath_index],"),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 10,
          top: 15,
          bottom: 10,
        ),
        child: Row(
          children: const <Widget>[
            Text(
              " house.amount",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              " house.address",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(
          left: 10,
          top: 0,
          bottom: 10,
        ),
        child: Text(
          "bedrooms / bathrooms /  ft\u00B2",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    ],
  );
}

class MenuWidget extends StatelessWidget {
  final IconData? iconImg;
  final Color? iconColor;
  final Color? conBackColor;
  final Function()? onbtnTap;

  const MenuWidget({
    Key? key,
    @required this.iconImg,
    @required this.iconColor,
    this.conBackColor,
    this.onbtnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onbtnTap!();
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: conBackColor,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Icon(
          iconImg,
          color: iconColor,
        ),
      ),
    );
  }
}
