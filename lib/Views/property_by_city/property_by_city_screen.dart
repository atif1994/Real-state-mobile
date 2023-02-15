import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../data/Controllers/property_bycity_controller.dart';
import '../../utils/constants/app_urls.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/styles/app_textstyles.dart';
import '../../utils/styles/custom_decorations.dart';

class PropertyByCityScreen extends StatefulWidget {
  int? id;
  String? cityName;

  PropertyByCityScreen({super.key, required this.id, required this.cityName});

  @override
  State<PropertyByCityScreen> createState() => _PropertyByCityScreenState();
}

class _PropertyByCityScreenState extends State<PropertyByCityScreen> {
  final propertybyCityController = Get.put(PropertyByCityController());

  @override
  void initState() {
    propertybyCityController.getPropertyByCity(widget.id!);
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
            : propertybyCityController.errorLoadingPropertyByCity.value != ''
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
                : ListView.builder(
                    itemCount: propertybyCityController
                        .propertybyCityModel.data!.data!.length,
                    padding: EdgeInsets.only(top: 1.0.h, bottom: 1.0.h),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? 2.0.w : 3.0.w,
                                right: index ==
                                        propertybyCityController
                                                .propertybyCityModel
                                                .data!
                                                .data!
                                                .length -
                                            1
                                    ? 2.0.w
                                    : 0.0.w),
                            height: Get.height * .5,
                            width: 50.0.w,
                            decoration: CustomDecorations.mainCon,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 30.0.h,
                                    width: 100.0.w,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      child:
                                          //  Image.asset(
                                          //   "assets/icons.house.png",
                                          //   height: 50,
                                          //   width: 50,
                                          // ),

                                          Image(
                                        image: NetworkImage(
                                            "${AppUrls.baseUrl2}${propertybyCityController.propertybyCityModel.data!.data![index].images!.the1}"
                                            //  "${AppUrls.baseUrl2}${propertybyCityController.propertybyCityModel.data!.data![index].images!.the1}",
                                            ),
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                                SizedBox(
                                  height: 2.0.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 2.0.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          propertybyCityController
                                                  .propertybyCityModel
                                                  .data!
                                                  .data![index]
                                                  .name ??
                                              '',
                                          style: AppTextStyles.labelSmall,
                                        ),
                                        Text(
                                          "Location: ${propertybyCityController.propertybyCityModel.data!.data![index].location ?? ""} ",
                                          style: AppTextStyles.labelSmall
                                              .copyWith(
                                                  color: Colors.grey,
                                                  fontSize: 10.sp),
                                        ),
                                        Text(
                                          "bedRroms: ${propertybyCityController.propertybyCityModel.data!.data![index].numberBedroom ?? ""} ",
                                          style: AppTextStyles.labelSmall
                                              .copyWith(
                                                  color: Colors.grey,
                                                  fontSize: 10.sp),
                                        ),
                                        Text(
                                          "Floor: ${propertybyCityController.propertybyCityModel.data!.data![index].numberFloor ?? ""} ",
                                          style: AppTextStyles.labelSmall
                                              .copyWith(
                                                  color: Colors.grey,
                                                  fontSize: 10.sp),
                                        ),
                                        Text(
                                          "Bathrooms: ${propertybyCityController.propertybyCityModel.data!.data![index].numberBathroom ?? ""} ",
                                          style: AppTextStyles.labelSmall
                                              .copyWith(
                                                  color: Colors.grey,
                                                  fontSize: 10.sp),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      "Rs: ${propertybyCityController.propertybyCityModel.data!.data![index].price ?? ''}",
                                      style: AppTextStyles.labelSmall,
                                    ),
                                    Container(
                                      height: 7.0.w,
                                      width: 7.0.w,
                                      decoration: BoxDecoration(
                                          color: AppColors.appthem,
                                          borderRadius:
                                              BorderRadius.circular(300)),
                                      child: const Center(
                                          child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 14,
                                      )),
                                    ),
                                    SizedBox(
                                      width: 2.0.w,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })));
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