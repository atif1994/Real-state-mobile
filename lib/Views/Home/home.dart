// ignore_for_file: unused_field

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:prologic_29/Views/Drawer/about_us.dart';
import 'package:prologic_29/Views/Home/Profile/profile.dart';
import 'package:prologic_29/Views/Home/more_places.dart';

import 'package:prologic_29/Views/Notifications/notification_page.dart';
import 'package:prologic_29/Views/Property_by_id/property_by_id.dart';
import 'package:prologic_29/Views/blog/blog.dart';

import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:prologic_29/data/Controllers/property_controllers/featured_property_controller.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/constants/fonts.dart';
import 'package:prologic_29/utils/constants/image_resources.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import '../../custom_widgets/drawer_widget.dart';
import '../../data/Controllers/Notification_Controller/Notification_Controller.dart';
import '../../data/Controllers/property_controllers/cities_controller.dart';
import '../../data/Controllers/sign_in_controller.dart';
import '../../data/Controllers/user_profile_section_controller/image_update_controller.dart';
import '../../data/Services/local_notifications_service.dart';
import '../../utils/constants/app_urls.dart';
import '../AddProperty/add_property.dart';
import 'home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final f = DateFormat('yyyy-MM-dd');
  var dashboardController = Get.put(DashboardController());
  var citiesController = Get.put(CitiesController());
  var notificationController = Get.put(Notificationcontroller());
  var newspostController = Get.put(DashboardController());
  var signinController = Get.put(SignInController());
  var updateImageController = Get.put(UpdateImageController());

  int? cid;

  String? cityName;
  String fname = '';

  String lname = '';
  String email = '';
  String? imgurl;
  String? modelImageUrl = "";
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final labels = ["Buy", "Rent", "Invest"];
  final labels1 = ["Homes", "Plots", "Commercial"];

  final images = [
    AppImageResources.home,
    AppImageResources.plots,
    AppImageResources.commercial
  ];

  final citieseImages = [
    AppImageResources.islamabad,
    AppImageResources.lahore,
    AppImageResources.karachi,
    AppImageResources.faisalabad,
    AppImageResources.pindi,
  ];

  final testimonialImages = [
    AppImageResources.img1,
    AppImageResources.img2,
    AppImageResources.img3,
    AppImageResources.img1,
    AppImageResources.img2,
    AppImageResources.img3,
    AppImageResources.img1,
    AppImageResources.img2,
    AppImageResources.img3,
    AppImageResources.img3,
  ];
  final bool _isContainerExpand = false;
  final int _navBarIndex = 0;
  final int _selectedIndex = 0;
  int _browsPropertyIndex = 0;
  int _browsPropertyIndex1 = 0;

  final List<Widget> _selectedWidget = [
    const HomeScreen(),
    const Profile(),
  ];
  void getCityInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      cid = pref.getInt("cityId");
      cityName = pref.getString("cityName");

      fname = pref.getString("fname") ?? "";
      lname = pref.getString("lname") ?? "";
      email = pref.getString("email") ?? "";
      imgurl = pref.getString("imgurl") ?? "";
      print("baseurl+++${AppUrls.baseUrl2}img url ======$imgurl");
    });
  }

//get uplaod image url with BaseUrl from shared pref
  String? imguploadUrl;
  geUploadtImgUrl() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    imguploadUrl = pref.getString("img");
    print(
        "Dash board uplaod image url Setting screen from Shared pref+++++ $imguploadUrl");
  }

  @override
  void initState() {
    getCityInfo();
    dashboardController.getFilteredPropertise(cid, 0);
    dashboardController.getFeaturedPropertise();
    LocalNotificationsApi.init();
    listenNotification();
    geUploadtImgUrl();
    super.initState();
  }

  void listenNotification() => LocalNotificationsApi.onNotifications.stream
      .listen(onClickedNotification);

  void onClickedNotification(String? payload) => Get.to(() => AllNotifications(
        payload: payload,
      ));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: CustomDrawer(
            fname: fname,
            lname: lname,
            email: email,
            img: imguploadUrl ?? imgurl ?? ""),

        ///bottom nav bar end
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: AppColors.appthem,
                  leading: IconButton(
                      onPressed: () {
                        // if (ZoomDrawer.of(context)!.isOpen()) {
                        //   ZoomDrawer.of(context)!.close();
                        // } else {
                        //   ZoomDrawer.of(context)!.open();
                        // }
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(Icons.dashboard)),
                  actions: [
                    const Spacer(),
                    const Spacer(),
                    Center(
                        child: Text(
                      "Dashboard",
                      style: AppTextStyles.heading1.copyWith(fontSize: 14.sp),
                    )),

                    Padding(
                      padding: EdgeInsets.only(top: 1.0.h),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 1.0.w),
                            height: 11.0.w,
                            width: 12.0.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                right: 6.0.w,
                              ),
                              height: 11.0.w,
                              width: 12.0.w,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: imguploadUrl != ''
                                    ? Image.network(
                                        "$imguploadUrl",
                                        // updateImageController
                                        //             .updateImageModel.data !=
                                        //         null
                                        //     ? updateImageController
                                        //         .updateImageModel.data!.avatar
                                        //         .toString()
                                        //     : "${AppUrls.baseUrl2}$imgurl",
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        "assets/person.jpg",
                                        fit: BoxFit.cover,
                                      ),
                              ))
                        ],
                      ),
                    ),
                    //   ],
                    // )
                  ],
                  expandedHeight: 20.0.h,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "",
                      style: AppTextStyles.heading1
                          .copyWith(fontFamily: AppFonts.nexaRegular),
                    ),
                    background: Stack(
                      children: [
                        // Container(
                        //   height: 35.0.h,
                        //   width: 100.0.w,
                        //   decoration: const BoxDecoration(
                        //       color: AppColors.appthem,
                        //       borderRadius: BorderRadius.only(
                        //           bottomRight: Radius.circular(30))),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(top: 10.0.h),
                        //   height: 6.0.h,
                        //   width: 100.0.w,
                        //   // decoration: CustomDecorations.con2,
                        //   child: ListView.builder(
                        //       itemCount: labels.length,
                        //       scrollDirection: Axis.horizontal,
                        //       itemBuilder: (context, index) {
                        //         return Padding(
                        //           padding: EdgeInsets.only(
                        //               top: 0.8.h,
                        //               bottom: 0.8.h,
                        //               left: index == 0 ? 9.0.w : 2.8.w),
                        //           child: SizedBox(
                        //             width: 25.0.w,
                        //             child: ElevatedButton(
                        //                 style: ElevatedButton.styleFrom(
                        //                   shape: RoundedRectangleBorder(
                        //                       borderRadius:
                        //                           BorderRadius.circular(10)),
                        //                   backgroundColor:
                        //                       _selectedIndex == index
                        //                           ? AppColors.colorWhite
                        //                           : const Color.fromARGB(
                        //                               255, 112, 114, 117),
                        //                 ),
                        //                 onPressed: () {
                        //                   setState(() {
                        //                     _selectedIndex = index;
                        //                   });
                        //                 },
                        //                 child: Text(labels[index])),
                        //           ),
                        //         );
                        //       }),
                        // ),
                        InkWell(
                          onTap: () {
                            // LocalNotificationsApi.showNotifications(
                            //     title: "Prologics Notification",
                            //     body: "abc",
                            //     payload: 'real.state a');
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 12.0.h, left: 3.0.w, right: 3.0.w),
                            height: 5.0.h,
                            width: 100.0.w,
                            decoration: CustomDecorations.con1,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 3.0.w,
                                ),
                                const Icon(Icons.search),
                                SizedBox(
                                  width: 3.0.w,
                                ),
                                AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      'Search for shops',
                                      textStyle: AppTextStyles.labelSmall
                                          .copyWith(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  "$cityName",
                                  style: AppTextStyles.labelSmall,
                                ),
                                SizedBox(
                                  width: 5.0.w,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  floating: true,
                  snap: true,
                  pinned: true,
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ///
                  Container(
                    margin:
                        EdgeInsets.only(top: 2.0.h, left: 3.0.w, right: 3.0.w),
                    height: 50.0.h,
                    width: 100.0.w,
                    decoration: CustomDecorations.mainCon,
                    child: Obx(
                      () => dashboardController.loadingfilteredPropertise.value
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: AppColors.appthem,
                            ))
                          : dashboardController
                                      .errorLoadingFilteredPropertise.value !=
                                  ''
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            dashboardController
                                                .getFilteredPropertise(cid, 0);
                                          },
                                          icon: const Icon(
                                            Icons.refresh,
                                            color: AppColors.appthem,
                                          )),
                                      SizedBox(
                                        height: 1.0.h,
                                      ),
                                      Text(dashboardController
                                          .errorLoadingFilteredPropertise
                                          .value),
                                    ],
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Browse Properties",
                                        style: AppTextStyles.heading1.copyWith(
                                            fontFamily: AppFonts.nexaBold,
                                            fontSize: 16.sp,
                                            color: AppColors.appthem),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 3.0.w, right: 3.0.w),
                                      height: 6.0.h,
                                      width: 100.0.w,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: index == 0
                                                        ? 0.0.w
                                                        : 2.0.w),
                                                child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            _browsPropertyIndex ==
                                                                    index
                                                                ? AppColors
                                                                    .appthem
                                                                : AppColors
                                                                    .colorWhite),
                                                    onPressed: () {
                                                      setState(() {
                                                        _browsPropertyIndex =
                                                            index;
                                                        dashboardController
                                                            .getFilteredPropertise(
                                                                cid, index);
                                                      });
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            images[index],
                                                            height: 2.0.h,
                                                            color:
                                                                _browsPropertyIndex ==
                                                                        index
                                                                    ? AppColors
                                                                        .colorWhite
                                                                    : AppColors
                                                                        .colorblack),
                                                        SizedBox(
                                                          width: 0.8.w,
                                                        ),
                                                        Text(
                                                          labels1[index],
                                                          style: TextStyle(
                                                              color: _browsPropertyIndex ==
                                                                      index
                                                                  ? AppColors
                                                                      .colorWhite
                                                                  : AppColors
                                                                      .colorblack),
                                                        )
                                                      ],
                                                    )),
                                              ),
                                            );
                                          }),
                                    ),
                                    const Divider(),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 5.0.w, right: 3.0.w),
                                      height: 5.0.h,
                                      width: 100.0.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _browsPropertyIndex1 = 0;
                                                // dashboardController.type =
                                                //     'popular';
                                              });
                                            },
                                            child: Container(
                                              height: 3.5.h,
                                              decoration: BoxDecoration(
                                                color: _browsPropertyIndex1 == 0
                                                    ? AppColors.appthem
                                                        .withOpacity(0.4)
                                                    : AppColors.colorWhite,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 3.0.w,
                                                      right: 3.0.w),
                                                  child: Text(
                                                    "Popular",
                                                    style: AppTextStyles
                                                        .heading1
                                                        .copyWith(
                                                            fontSize: 11.sp,
                                                            color: _browsPropertyIndex1 ==
                                                                    0
                                                                ? AppColors
                                                                    .appthem
                                                                : AppColors
                                                                    .colorblack),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _browsPropertyIndex1 = 1;
                                              });
                                            },
                                            child: Container(
                                              height: 3.5.h,
                                              decoration: BoxDecoration(
                                                color: _browsPropertyIndex1 == 1
                                                    ? AppColors.appthem
                                                        .withOpacity(0.4)
                                                    : AppColors.colorWhite,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 3.0.w,
                                                      right: 3.0.w),
                                                  child: Text(
                                                    "Type",
                                                    style: AppTextStyles
                                                        .heading1
                                                        .copyWith(
                                                            fontSize: 11.sp,
                                                            color: _browsPropertyIndex1 ==
                                                                    1
                                                                ? AppColors
                                                                    .appthem
                                                                : AppColors
                                                                    .colorblack),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _browsPropertyIndex1 = 2;
                                                // dashboardController.type =
                                                //     "location";
                                              });
                                            },
                                            child: Container(
                                              height: 3.5.h,
                                              padding: EdgeInsets.only(
                                                  left: 3.0.w, right: 3.0.w),
                                              decoration: BoxDecoration(
                                                color: _browsPropertyIndex1 == 2
                                                    ? AppColors.appthem
                                                        .withOpacity(0.4)
                                                    : AppColors.colorWhite,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 3.0.w,
                                                      right: 3.0.w),
                                                  child: Text(
                                                    "Location",
                                                    style: AppTextStyles
                                                        .heading1
                                                        .copyWith(
                                                            fontSize: 11.sp,
                                                            color: _browsPropertyIndex1 ==
                                                                    2
                                                                ? AppColors
                                                                    .appthem
                                                                : AppColors
                                                                    .colorblack),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _browsPropertyIndex1 = 3;

                                                //  dashboardController.type = "area";
                                              });
                                            },
                                            child: Container(
                                              height: 3.5.h,
                                              decoration: BoxDecoration(
                                                color: _browsPropertyIndex1 == 3
                                                    ? AppColors.appthem
                                                        .withOpacity(0.4)
                                                    : AppColors.colorWhite,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 3.0.w,
                                                      right: 3.0.w),
                                                  child: Text(
                                                    "Area Size",
                                                    style: AppTextStyles
                                                        .heading1
                                                        .copyWith(
                                                            fontSize: 11.sp,
                                                            color: _browsPropertyIndex1 ==
                                                                    3
                                                                ? AppColors
                                                                    .appthem
                                                                : AppColors
                                                                    .colorblack),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Obx(() => dashboardController
                                            .loadingfilteredPropertise.value
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                            color: AppColors.appthem,
                                          ))
                                        : dashboardController
                                                    .errorLoadingFilteredPropertise
                                                    .value !=
                                                ''
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      dashboardController
                                                          .getFilteredPropertise(
                                                              cid,
                                                              _browsPropertyIndex1);

                                                      //  dashboardController
                                                      // .getFilteredPropertise(
                                                      //     cid!,
                                                      //     _browsPropertyIndex,
                                                      //     dashboardController
                                                      //         .type);
                                                    },
                                                    icon: const Icon(
                                                      Icons.refresh,
                                                      color: AppColors.appthem,
                                                    ),
                                                  ),
                                                  Text(dashboardController
                                                      .errorLoadingFilteredPropertise
                                                      .value),
                                                ],
                                              )
                                            : _browsPropertyIndex1 == 0
                                                ? Expanded(
                                                    child: GridView.builder(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 5.0.w,
                                                        ),
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        gridDelegate:
                                                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                                                maxCrossAxisExtent:
                                                                    100,
                                                                childAspectRatio:
                                                                    1.5 / 2,
                                                                crossAxisSpacing:
                                                                    2,
                                                                mainAxisSpacing:
                                                                    10),
                                                        itemCount:
                                                            dashboardController
                                                                .filteredPropertyModel
                                                                .popular!
                                                                .length,
                                                        itemBuilder:
                                                            (BuildContext ctx,
                                                                index) {
                                                          return Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 1.0.h,
                                                                    bottom: 1.h,
                                                                    left: 1.w),
                                                            height: 4.0.h,
                                                            width: 20.0.w,
                                                            alignment: Alignment
                                                                .center,

                                                            decoration:
                                                                CustomDecorations
                                                                    .mainCon,
                                                            // decoration: BoxDecoration(
                                                            //     border: Border.all(
                                                            //         color: Colors
                                                            //             .grey),
                                                            //     color: Colors
                                                            //         .white,
                                                            //     borderRadius:
                                                            //         BorderRadius
                                                            //             .circular(
                                                            //                 10)

                                                            //                 ),
                                                            child: Center(
                                                              child: Text(dashboardController
                                                                      .filteredPropertyModel
                                                                      .popular![
                                                                          index]
                                                                      .name ??
                                                                  ''),
                                                            ),
                                                          );
                                                        }),
                                                  )
                                                : _browsPropertyIndex1 == 1
                                                    ? Expanded(
                                                        child: GridView.builder(
                                                            padding:
                                                                EdgeInsets.only(
                                                              left: 5.0.w,
                                                            ),
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                                                maxCrossAxisExtent:
                                                                    100,
                                                                childAspectRatio:
                                                                    1.5 / 2,
                                                                crossAxisSpacing:
                                                                    2,
                                                                mainAxisSpacing:
                                                                    10),
                                                            itemCount:
                                                                dashboardController
                                                                    .filteredPropertyModel
                                                                    .types!
                                                                    .length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        ctx,
                                                                    index) {
                                                              return Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 1.0
                                                                            .h,
                                                                        bottom:
                                                                            1.h,
                                                                        left: 1
                                                                            .w),
                                                                height: 4.0.h,
                                                                width: 20.0.w,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                // decoration: BoxDecoration(
                                                                //     border: Border.all(
                                                                //         color: Colors
                                                                //             .grey),
                                                                //     color: Colors
                                                                //         .white,
                                                                //     borderRadius:
                                                                //         BorderRadius.circular(
                                                                //             10)),

                                                                decoration:
                                                                    CustomDecorations
                                                                        .mainCon,
                                                                child: Center(
                                                                  child: Text(dashboardController
                                                                          .filteredPropertyModel
                                                                          .types![
                                                                              index]
                                                                          .name ??
                                                                      ''),
                                                                ),
                                                              );
                                                            }),
                                                      )
                                                    : _browsPropertyIndex1 == 2
                                                        ? Expanded(
                                                            child: GridView
                                                                .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      left:
                                                                          5.0.w,
                                                                    ),
                                                                    scrollDirection:
                                                                        Axis
                                                                            .horizontal,
                                                                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                                                        maxCrossAxisExtent:
                                                                            100,
                                                                        childAspectRatio:
                                                                            1.5 /
                                                                                2,
                                                                        crossAxisSpacing:
                                                                            2,
                                                                        mainAxisSpacing:
                                                                            10),
                                                                    itemCount: dashboardController
                                                                        .filteredPropertyModel
                                                                        .locations!
                                                                        .length,
                                                                    itemBuilder:
                                                                        (BuildContext
                                                                                ctx,
                                                                            index) {
                                                                      return Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                1.0.h,
                                                                            bottom: 1.h,
                                                                            left: 1.w),
                                                                        height:
                                                                            4.0.h,
                                                                        width:
                                                                            20.0.w,
                                                                        alignment:
                                                                            Alignment.center,
                                                                        // decoration: BoxDecoration(
                                                                        //     border:
                                                                        //         Border.all(color: Colors.grey),
                                                                        //     color: Colors.white,
                                                                        //     borderRadius: BorderRadius.circular(10)),
                                                                        decoration:
                                                                            CustomDecorations.mainCon,

                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(dashboardController.filteredPropertyModel.locations![index].sectorAndBlockName ?? ''),
                                                                        ),
                                                                      );
                                                                    }),
                                                          )
                                                        : _browsPropertyIndex1 ==
                                                                3
                                                            ? Expanded(
                                                                child: GridView
                                                                    .builder(
                                                                        padding:
                                                                            EdgeInsets
                                                                                .only(
                                                                          left:
                                                                              5.0.w,
                                                                        ),
                                                                        scrollDirection:
                                                                            Axis
                                                                                .horizontal,
                                                                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                                                            maxCrossAxisExtent:
                                                                                100,
                                                                            childAspectRatio: 1.5 /
                                                                                2,
                                                                            crossAxisSpacing:
                                                                                2,
                                                                            mainAxisSpacing:
                                                                                10),
                                                                        itemCount: dashboardController
                                                                            .filteredPropertyModel
                                                                            .areas!
                                                                            .length,
                                                                        itemBuilder:
                                                                            (BuildContext ctx,
                                                                                index) {
                                                                          return Container(
                                                                            margin: EdgeInsets.only(
                                                                                top: 1.0.h,
                                                                                bottom: 1.h,
                                                                                left: 1.w),
                                                                            height:
                                                                                4.0.h,
                                                                            width:
                                                                                20.0.w,
                                                                            alignment:
                                                                                Alignment.center,
                                                                            // decoration: BoxDecoration(
                                                                            //     border: Border.all(color: Colors.grey),
                                                                            //     color: Colors.white,
                                                                            //     borderRadius: BorderRadius.circular(10)),

                                                                            decoration:
                                                                                CustomDecorations.mainCon,
                                                                            child:
                                                                                Center(
                                                                              child: Text(dashboardController.filteredPropertyModel.areas![index].square ?? ''),
                                                                            ),
                                                                          );
                                                                        }),
                                                              )
                                                            : Container())
                                  ],
                                ),
                    ),
                  ),

                  ///constructio cost calculater

                  Container(
                      height: 53.0.h,
                      width: 100.0.w,
                      decoration: CustomDecorations.mainCon,
                      margin: EdgeInsets.only(
                          top: 2.0.h, left: 3.0.w, right: 3.0.w),
                      child: Obx(() {
                        return dashboardController
                                .loadingFeaturedPropertise.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: AppColors.appthem,
                              ))
                            : dashboardController
                                        .errorLoadingFeaturedPropertise.value !=
                                    ''
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              dashboardController
                                                  .getFeaturedPropertise();
                                            },
                                            icon: const Icon(
                                              Icons.refresh,
                                              color: AppColors.appthem,
                                            )),
                                        SizedBox(
                                          height: 1.0.h,
                                        ),
                                        Text(dashboardController
                                            .errorLoadingFeaturedPropertise
                                            .value),
                                      ],
                                    ),
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Explore Good Places",
                                          style: AppTextStyles.heading1
                                              .copyWith(
                                                  fontFamily: AppFonts.nexaBold,
                                                  fontSize: 16.sp,
                                                  color: AppColors.appthem),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 3.0.w, top: 0.3.h),
                                        child: SizedBox(
                                          width: 80.0.w,
                                          child: Text(
                                              "Find your dreaam home from our Newly added properties",
                                              style: AppTextStyles.labelSmall
                                                  .copyWith(fontSize: 9.sp)),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 1.0.h,
                                            left: 2.0.w,
                                            right: 2.0.w),
                                        height: 34.0.h,
                                        width: 100.0.w,
                                        //color: Colors.red,
                                        child: ListView.builder(
                                            padding:
                                                EdgeInsets.only(bottom: 1.0.h),
                                            itemCount: 3,
                                            // dashboardController
                                            //     .featuredPropertyModel
                                            //     .data!
                                            //     .data!
                                            //     .length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Get.to(() => PropertyByID(
                                                        id: dashboardController
                                                            .featuredPropertyModel
                                                            .data!
                                                            .data![index]
                                                            .id,
                                                      ));
                                                },
                                                child: Container(
                                                    width: 59.0.w,
                                                    margin: EdgeInsets.only(
                                                        left: index == 0
                                                            ? 1.0.w
                                                            : 3.0.w),
                                                    alignment: Alignment.center,
                                                    decoration:
                                                        CustomDecorations
                                                            .mainCon,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          height: 14.0.h,
                                                          width: 100.0.w,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  //    color: Colors.red,
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              10),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              10))),
                                                          child: ClipRRect(
                                                            borderRadius: const BorderRadius
                                                                    .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10)),
                                                            child:
                                                                Image.network(
                                                              "${AppUrls.baseUrl2}${dashboardController.featuredPropertyModel.data!.data![index].images!.the1}",
                                                              fit: BoxFit.cover,
                                                            ),

                                                            //     Image.asset(
                                                            //   AppImageResources
                                                            //       .property,
                                                            //   fit: BoxFit.cover,
                                                            // ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 1.0.h,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Container(
                                                              height: 3.5.h,
                                                              width: 22.0.w,
                                                              decoration: BoxDecoration(
                                                                  color: AppColors
                                                                      .appthem,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              300)),
                                                              child: Center(
                                                                  child: Text(
                                                                dashboardController
                                                                        .featuredPropertyModel
                                                                        .data!
                                                                        .data![
                                                                            index]
                                                                        .type!
                                                                        .name ??
                                                                    "",
                                                                style: AppTextStyles
                                                                    .labelSmall
                                                                    .copyWith(
                                                                        color: AppColors
                                                                            .colorWhite),
                                                              )),
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                  "Rs  ${dashboardController.featuredPropertyModel.data!.data![index].price ?? ""} PKR",
                                                                  style: AppTextStyles
                                                                      .heading1
                                                                      .copyWith(
                                                                          color: AppColors
                                                                              .colorblack,
                                                                          fontSize:
                                                                              10.sp)),
                                                            )
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 2.0.w,
                                                                  top: 1.0.h),
                                                          child: Text(
                                                              dashboardController
                                                                      .featuredPropertyModel
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .name ??
                                                                  "",
                                                              style:
                                                                  AppTextStyles
                                                                      .heading1
                                                                      .copyWith(
                                                                color: AppColors
                                                                    .colorblack,
                                                              )),
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 2.0.w,
                                                            ),
                                                            Image.asset(
                                                              AppImageResources
                                                                  .bed,
                                                              height: 2.0.h,
                                                            ),
                                                            SizedBox(
                                                              width: 2.0.w,
                                                            ),
                                                            Text(
                                                              dashboardController
                                                                      .featuredPropertyModel
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .numberBedroom ??
                                                                  "",
                                                              style: AppTextStyles
                                                                  .labelSmall
                                                                  .copyWith(
                                                                      fontSize:
                                                                          9.sp),
                                                            ),
                                                            SizedBox(
                                                              width: 2.0.w,
                                                            ),
                                                            Image.asset(
                                                              AppImageResources
                                                                  .bath,
                                                              height: 2.0.h,
                                                            ),
                                                            SizedBox(
                                                              width: 2.0.w,
                                                            ),
                                                            Text(
                                                              dashboardController
                                                                      .featuredPropertyModel
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .numberBathroom ??
                                                                  "",
                                                              style: AppTextStyles
                                                                  .labelSmall
                                                                  .copyWith(
                                                                      fontSize:
                                                                          9.sp),
                                                            ),
                                                            SizedBox(
                                                              width: 2.0.w,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .landscape_outlined,
                                                            ),
                                                            // Image.asset(
                                                            //   AppImageResources
                                                            //       .plots,
                                                            //   height: 2.0.h,
                                                            // ),
                                                            SizedBox(
                                                              width: 2.0.w,
                                                            ),
                                                            Text(
                                                              dashboardController
                                                                      .featuredPropertyModel
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .square ??
                                                                  "",
                                                              style: AppTextStyles
                                                                  .labelSmall
                                                                  .copyWith(
                                                                      fontSize:
                                                                          9.sp),
                                                            )
                                                          ],
                                                        ),
                                                        const Divider(),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 2.0.w,
                                                            ),
                                                            Image.asset(
                                                              AppImageResources
                                                                  .plots,
                                                              height: 2.0.h,
                                                            ),
                                                            SizedBox(
                                                              width: 2.0.w,
                                                            ),
                                                            Text(
                                                              dashboardController
                                                                      .featuredPropertyModel
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .location ??
                                                                  "",
                                                              style: AppTextStyles
                                                                  .labelSmall,
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    )),
                                              );
                                            }),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 3.0.w,
                                            right: 3.0.w,
                                            top: 1.0.h),
                                        child: CustomButton(
                                          onPressed: () {
                                            Get.to(() => Moreplaces());
                                          },
                                          text: "More Places",
                                        ),
                                      )
                                    ],
                                  );
                      })),

                  //post an add
                  Container(
                    margin:
                        EdgeInsets.only(left: 3.0.w, right: 3.0.w, top: 2.0.h),
                    height: 20.0.h,
                    width: 100.0.w,
                    decoration: CustomDecorations.mainCon,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppImageResources.house,
                              height: 12.0.h,
                            ),
                            SizedBox(
                              width: 2.0.w,
                            ),
                            SizedBox(
                              width: 40.0.w,
                              child: Text(
                                "Looking to sell or rent out your property",
                                style: AppTextStyles.labelSmall
                                    .copyWith(fontSize: 11.sp),
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const Property());
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 3.0.w, right: 3.0.w, top: 1.0.h),
                            height: 4.0.h,
                            width: 100.0.w,
                            decoration: BoxDecoration(
                                color: AppColors.appthem,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "Add Property",
                                style: AppTextStyles.heading1
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  ///cites/locations
                  Container(
                      margin: EdgeInsets.only(
                          left: 3.0.w, right: 3.0.w, top: 1.0.h),
                      height: 43.0.h,
                      width: 100.0.w,
                      decoration: CustomDecorations.mainCon,
                      child: Obx(
                        () => dashboardController.loadingCities.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: AppColors.appthem,
                              ))
                            : dashboardController.errorLoadingCities.value != ''
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              dashboardController
                                                  .getPrpertyCitis();
                                            },
                                            icon: const Icon(
                                              Icons.refresh,
                                              color: AppColors.appthem,
                                            )),
                                        SizedBox(
                                          height: 1.0.h,
                                        ),
                                        Text(dashboardController
                                            .errorLoadingCities.value),
                                      ],
                                    ),
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 3.0.w, top: 0.3.h),
                                        child: Text(
                                          "Find By Locations",
                                          style: AppTextStyles.heading1
                                              .copyWith(
                                                  fontFamily: AppFonts.nexaBold,
                                                  fontSize: 16.sp,
                                                  color: AppColors.appthem),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 3.0.w, top: 0.3.h),
                                        child: SizedBox(
                                          width: 80.0.w,
                                          child: Text(
                                              "Find your dream home from your dream location",
                                              style: AppTextStyles.labelSmall
                                                  .copyWith(fontSize: 9.sp)),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 1.0.w,
                                            right: 1.0.w,
                                            top: 1.0.h),
                                        height: 26.0.h,
                                        width: 100.0.w,
                                        // color: Colors.red,
                                        child: ListView.builder(
                                            itemCount: citiesController
                                                .citiesModel.data?.length,
                                            padding: EdgeInsets.only(
                                                top: 1.0.h, bottom: 1.0.h),
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  citiesController
                                                      .sendToCityWiseProperty(
                                                          citiesController
                                                              .citiesModel
                                                              .data![index]
                                                              .id,
                                                          citiesController
                                                              .citiesModel
                                                              .data![index]
                                                              .name);

                                                  // PropertyByCityService
                                                  //     .getPropertyByCityServiceImages(
                                                  //         citiesController
                                                  //             .citiesModel
                                                  //             .data![index]!
                                                  //             .id!);
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: index == 0
                                                          ? 2.0.w
                                                          : 3.0.w,
                                                      right: index ==
                                                              citiesController
                                                                      .citiesModel
                                                                      .data!
                                                                      .length -
                                                                  1
                                                          ? 2.0.w
                                                          : 0.0.w),
                                                  height: 20.0.h,
                                                  width: 50.0.w,
                                                  decoration:
                                                      CustomDecorations.mainCon,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                          height: 15.0.h,
                                                          width: 100.0.w,
                                                          decoration:
                                                              const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(10),
                                                            ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(10),
                                                            ),
                                                            child:
                                                                // Image.asset(
                                                                //     citieseImages[
                                                                //             index]
                                                                //         .toString()),

                                                                Image(
                                                              image:
                                                                  NetworkImage(
                                                                '${AppUrls.baseUrl2}${citiesController.citiesModel.data![index].metadata![0].metaValue![0] ?? ''}',
                                                              ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          )),
                                                      SizedBox(
                                                        height: 2.0.h,
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 2.0.w,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                citiesController
                                                                        .citiesModel
                                                                        .data![
                                                                            index]
                                                                        .name ??
                                                                    '',
                                                                style: AppTextStyles
                                                                    .labelSmall,
                                                              ),
                                                              Text(
                                                                "${citiesController.citiesModel.data![index].propertiesCount ?? ""} Propertise",
                                                                style: AppTextStyles
                                                                    .labelSmall
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .grey,
                                                                        fontSize:
                                                                            10.sp),
                                                              )
                                                            ],
                                                          ),
                                                          const Spacer(),
                                                          Container(
                                                            height: 7.0.w,
                                                            width: 7.0.w,
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .appthem,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            300)),
                                                            child: const Center(
                                                                child: Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              color:
                                                                  Colors.white,
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
                                              );
                                            }),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 2.0.h,
                                            left: 3.0.w,
                                            right: 3.0.w),
                                        child: const CustomButton(
                                          text: "More Locations",
                                        ),
                                      )
                                    ],
                                  ),
                      )),

                  ///prologics 29

                  Container(
                    margin:
                        EdgeInsets.only(left: 3.0.w, right: 3.0.w, top: 2.0.h),
                    //  height: 50.0.h,
                    width: 120.0.w,
                    decoration: CustomDecorations.mainCon,
                    child: Obx(
                      (() => newspostController.loadingnewspost.value
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: AppColors.appthem,
                            ))
                          : newspostController.errorLoadingnewspost.value != ''
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            newspostController.getnewspost();
                                          },
                                          icon: const Icon(
                                            Icons.refresh,
                                            color: AppColors.appthem,
                                          )),
                                      SizedBox(
                                        height: 1.0.h,
                                      ),
                                      Text(newspostController
                                          .errorLoadingnewspost.value),
                                    ],
                                  ),
                                )
                              : Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 3.0.w,
                                          top: 0.3.h,
                                        ),
                                        child: Text(
                                          "ProLogic 29",
                                          style: AppTextStyles.heading1
                                              .copyWith(
                                                  fontFamily: AppFonts.nexaBold,
                                                  fontSize: 16.sp,
                                                  color: AppColors.appthem),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 3.0.w, top: 0.3.h),
                                        child: SizedBox(
                                          width: 85.0.w,
                                          child: Text(
                                              "Let us help you navigate the renting, buying, selling & investing experience",
                                              style: AppTextStyles.labelSmall
                                                  .copyWith(fontSize: 9.sp)),
                                        ),
                                      ),
                                      Container(
                                        height: 35.0.h,
                                        margin: EdgeInsets.only(
                                            left: 2.0.w,
                                            right: 2.0.w,
                                            top: 1.0.h,
                                            bottom: 1.0.h),
                                        width: 100.0.w,
                                        //    color: Colors.red,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 3,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                    left: index == 0
                                                        ? 2.0.w
                                                        : 2.0.w,
                                                    right: index ==
                                                            newspostController
                                                                    .newspostModel
                                                                    .data!
                                                                    .length -
                                                                1
                                                        ? 2.0.w
                                                        : 0.0.w,
                                                    bottom: 0.5.h),
                                                width: 60.0.w,
                                                decoration:
                                                    CustomDecorations.mainCon,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 15.0.h,
                                                      width: 100.0.w,
                                                      decoration: const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          10))),
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          10)),
                                                          child:
                                                              // Image.asset(
                                                              //   testimonialImages[
                                                              //       index],
                                                              //   fit: BoxFit.cover,
                                                              // ),
                                                              Image.network(
                                                            newspostController
                                                                    .newspostModel
                                                                    .data![
                                                                        index]!
                                                                    .image ??
                                                                '',
                                                            fit: BoxFit.cover,
                                                          )),
                                                    ),
                                                    SizedBox(
                                                      height: 1.0.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 2.0.w,
                                                        ),
                                                        const Icon(
                                                          Icons.date_range,
                                                          color:
                                                              AppColors.appthem,
                                                        ),
                                                        SizedBox(
                                                          width: 2.0.w,
                                                        ),
                                                        Text(
                                                          DateFormat(
                                                                  'dd.MM.yyyy')
                                                              .format(DateTime.parse(
                                                                  newspostController
                                                                      .newspostModel
                                                                      .data![
                                                                          index]!
                                                                      .createdAt
                                                                      .toString())),
                                                          style: AppTextStyles
                                                              .labelSmall
                                                              .copyWith(
                                                                  fontSize:
                                                                      10.sp),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 2.0.w,
                                                          right: 2.0.w,
                                                          top: 1.0.h),
                                                      child: Text(
                                                        newspostController
                                                                .newspostModel
                                                                .data![index]!
                                                                .name ??
                                                            "",
                                                        style: AppTextStyles
                                                            .heading1
                                                            .copyWith(
                                                                color: AppColors
                                                                    .appthem),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 2.0.w,
                                                          right: 2.0.w,
                                                          top: 1.0.h),
                                                      child: Text(
                                                          // "Are you tired of real estate malpractices? Do you know that 60% of the existing horizontal projects nationwide are unapproved? It is common knowledge that the real estate sector in Pakistan is replete with scams. Many individuals have lost their hard-earned savings to fraudulent schemes, which were initially presented as lucrative investment opportunities."
                                                          "",
                                                          style: AppTextStyles
                                                              .labelSmall
                                                              .copyWith(
                                                                  fontSize:
                                                                      8.sp)),
                                                    ),
                                                    Center(
                                                      child: InkWell(
                                                        onTap: () {
                                                          Get.to(() => Blog(),
                                                              transition:
                                                                  Transition
                                                                      .rightToLeft,
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          600));
                                                        },
                                                        child: Container(
                                                          height: 4.0.h,
                                                          width: 30.0.w,
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .appthem,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                          child: Center(
                                                              child: Text(
                                                            "Continue",
                                                            style: AppTextStyles
                                                                .labelSmall
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .colorWhite),
                                                          )),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 1.0.h,
                                                    )
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                )),
                    ),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  )
                ],
              ),
            )),
      ),
    );
    // return Scaffold(
    //   body: CustomScrollView(
    //     slivers: <Widget>[
    //       SliverAppBar(
    //         snap: false,
    //         pinned: true,
    //         floating: false,
    //         flexibleSpace: const FlexibleSpaceBar(
    //             centerTitle: true,
    //             title: Text("HOME",
    //                 style: TextStyle(
    //                   color: Colors.white,
    //                   fontSize: 16.0,
    //                 ) //TextStyle
    //                 ), //Text
    //             background: Image(
    //               image: NetworkImage(
    //                   "https://images.unsplash.com/photo-1608555307638-992062b31329?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"),
    //               //"assets\sincerely-media-p-NQlmGvFC8-unsplash.jpg",
    //               fit: BoxFit.cover,
    //             ) //Images.network
    //             ),
    //         expandedHeight: 230,
    //         backgroundColor: Colors.orange[400],
    //         leading: IconButton(
    //             onPressed: () {
    //               scaffoldKey.currentState!.openDrawer();
    //             },
    //             icon: const Icon(
    //               Icons.menu,
    //               color: Colors.white,
    //             )),
    //         // key: scaffoldKey,
    //         // extendBody: true,
    //         // appBar: AppBar(
    //         //   title: const Text('Home'),

    //         //  actions: [
    //         //   IconButton(onPressed: (){
    //         //     Get.to(MyHomePage());
    //         //   }, icon: Icon(Icons.person,size: 30,))
    //       ),
    //     ],
    //   ),
    //   drawer: MyDrawer(),
    //   // body: _selectedWidget.elementAt(_selectedIndex),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    //   floatingActionButton: FloatingActionButton(
    //     child: const Icon(Icons.search, color: Colors.white),
    //     onPressed: () {
    //       Get.to(() => const Search());
    //     },
    //   ),
    //   bottomNavigationBar: BottomAppBar(
    //     shape: const CircularNotchedRectangle(),
    //     elevation: 0,
    //     color: primaryColor.withAlpha(255),
    //     notchMargin: 10,
    //     child: BottomNavigationBar(
    //       elevation: 0,
    //       backgroundColor: Colors.grey.withAlpha(0),
    //       onTap: (index) {
    //         setState(() {
    //           _selectedIndex = index;
    //         });
    //       },
    //       currentIndex: _selectedIndex,
    //       showSelectedLabels: false,
    //       showUnselectedLabels: false,
    //       items: const [
    //         BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.home_outlined,
    //             color: Colors.white,
    //             size: 20,
    //           ),
    //           label: 'Home',
    //           activeIcon: Icon(Icons.home, color: Colors.white, size: 30),
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.person_outlined,
    //             color: Colors.white,
    //             size: 20,
    //           ),
    //           label: 'Profile',
    //           activeIcon: Icon(Icons.person, color: Colors.white, size: 30),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
