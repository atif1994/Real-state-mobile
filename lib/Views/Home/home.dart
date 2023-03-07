// ignore_for_file: avoid_print, prefer_is_empty, prefer_const_constructors, unused_field
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/Home/Profile/profile.dart';
import 'package:prologic_29/Views/Home/more_places.dart';
import 'package:prologic_29/Views/Notifications/notification_page.dart';
import 'package:prologic_29/Views/Property_by_id/property_by_id.dart';
import 'package:prologic_29/Views/blog/blog.dart';
import 'package:prologic_29/Views/user_profile/profile_pages.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:prologic_29/data/Controllers/get_all_citise_controller/get_all_citise_con.dart';
import 'package:prologic_29/data/Controllers/property_controllers/featured_property_controller.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/constants/fonts.dart';
import 'package:prologic_29/utils/constants/image_resources.dart';
import 'package:prologic_29/utils/constants/session_controller.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import '../../custom_widgets/drawer_widget.dart';
import '../../data/Controllers/property_controllers/cities_controller.dart';
import '../../data/Controllers/sign_in_controller.dart';
import '../../data/Controllers/user_profile_section_controller/image_update_controller.dart';
import '../../data/Services/local_notifications_service.dart';
import '../../utils/constants/app_urls.dart';
import 'home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final storage = FirebaseFirestore.instance.collection("devicetokens");
  var deviceTokenToSendPushNotification = '';
  final f = DateFormat('yyyy-MM-dd');
  var dashboardController = Get.put(DashboardController());
  var citiesController = Get.put(CitiesController());
  // var notificationController = Get.put(Notificationcontroller());
  var newspostController = Get.put(DashboardController());
  var signinController = Get.put(SignInController());

  var getAllCitise = Get.put(GetAllCitiseController());
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

  final bool _isContainerExpand = false;
  final int _navBarIndex = 0;
  final int _selectedIndex = 0;
  int _browsPropertyIndex = 0;
  int _browsPropertyIndex1 = 0;

  final List<Widget> _selectedWidget = [
    const HomeScreen(),
    const Profile(),
  ];
  String? loginBaseImage;
  void getCityInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      cid = pref.getInt("cityId");
      cityName = pref.getString("cityName");

      fname = pref.getString("fname") ?? "";
      lname = pref.getString("lname") ?? "";
      email = pref.getString("email") ?? "";
      imgurl = pref.getString("imgurl") ?? "";
      loginBaseImage = "$imgurl";
      print("Login base Image +++$loginBaseImage");
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

    //  listenNotification();
    geUploadtImgUrl();
    super.initState();

    ///////////////////push notifications functions

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        if (kDebugMode) {
          print("FirebaseMessaging.instance.getInitialMessage");
        }
        if (message != null) {
          print("New Notification");
          if (message.data['_id'] != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AllNotifications(
                  payload: message.data['_id'],
                ),
              ),
            );
          }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationsApi.createanddisplaynotification(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );

    /////////////////get device token
    getDeviceTokenToSendNotification();
  }

  ///////////////////////////get device token

  Future<void> getDeviceTokenToSendNotification() async {
    final FirebaseMessaging fcm = FirebaseMessaging.instance;
    final token = await fcm.getToken();
    //    dTokens.add(token);
    _saveDeviceTokenToFirebase(token.toString());

    deviceTokenToSendPushNotification = token.toString();

    SessionController().deviceToken = deviceTokenToSendPushNotification;
    print("Token Value******************* $deviceTokenToSendPushNotification");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: CustomDrawer(
            fname: fname,
            lname: lname,
            email: email,
            loginBaseImage: loginBaseImage ?? ""),

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
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: 1.0.h),
                      child: InkWell(
                        onTap: () {
                          Get.to(
                              () =>
                                  ProfilePages(loginBaseImage: loginBaseImage),
                              transition: Transition.fadeIn,
                              duration: Duration(milliseconds: 600));
                        },
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
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: loginBaseImage != null
                                      ? Image.network(
                                          "$loginBaseImage",
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
                        InkWell(
                          onTap: () {
                            getAllCitise.getAllCitise();
                            _showDialogue(context);
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
                                const Icon(Icons.ads_click),
                                SizedBox(
                                  width: 3.0.w,
                                ),
                                AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      'Tap for select citise',
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
                                        "Browse Propertise",
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
                                                ? dashboardController
                                                            .filteredPropertyModel
                                                            .popular!
                                                            .length ==
                                                        0
                                                    ? Center(
                                                        child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10.0.h),
                                                        child: Text(
                                                            "No Propertise Found"),
                                                      ))
                                                    : Expanded(
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
                                                                    .popular!
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
                                                                decoration:
                                                                    CustomDecorations
                                                                        .mainCon,
                                                                child: Center(
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets.only(
                                                                        left: 3.0
                                                                            .w,
                                                                        right: 3.0
                                                                            .w),
                                                                    // color: Colors
                                                                    //     .red,
                                                                    width:
                                                                        50.0.w,
                                                                    child: Text(dashboardController
                                                                            .filteredPropertyModel
                                                                            .popular![index]
                                                                            .name ??
                                                                        ''),
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                      )
                                                : _browsPropertyIndex1 == 1
                                                    ? dashboardController
                                                                .filteredPropertyModel
                                                                .types!
                                                                .length ==
                                                            0
                                                        ? Center(
                                                            child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top:
                                                                        10.0.h),
                                                            child: Text(
                                                                "No Propertise Found"),
                                                          ))
                                                        : Expanded(
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
                                                                        .types!
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
                                                                        decoration:
                                                                            CustomDecorations.mainCon,
                                                                        child:
                                                                            Center(
                                                                          child: Container(
                                                                              margin: EdgeInsets.only(left: 3.0.w, right: 3.0.w),
                                                                              width: 50.0.w,
                                                                              child: Text(dashboardController.filteredPropertyModel.types![index].name ?? '')),
                                                                        ),
                                                                      );
                                                                    }),
                                                          )
                                                    : _browsPropertyIndex1 == 2
                                                        ? dashboardController
                                                                    .filteredPropertyModel
                                                                    .locations!
                                                                    .length ==
                                                                0
                                                            ? Center(
                                                                child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 10.0
                                                                            .h),
                                                                child: Text(
                                                                    "No Propertise found"),
                                                              ))
                                                            : Expanded(
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
                                                                            .locations!
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
                                                                            decoration:
                                                                                CustomDecorations.mainCon,
                                                                            child:
                                                                                Center(
                                                                              child: Container(margin: EdgeInsets.only(left: 3.0.w, right: 3.0.w), width: 50.0.w, child: Text(dashboardController.filteredPropertyModel.locations![index].sectorAndBlockName ?? '')),
                                                                            ),
                                                                          );
                                                                        }),
                                                              )
                                                        : _browsPropertyIndex1 ==
                                                                3
                                                            ? dashboardController
                                                                        .filteredPropertyModel
                                                                        .areas!
                                                                        .length ==
                                                                    0
                                                                ? Center(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.only(
                                                                          top: 10.0
                                                                              .h),
                                                                      child: Text(
                                                                          "No Propertise found"),
                                                                    ),
                                                                  )
                                                                : Expanded(
                                                                    child: GridView.builder(
                                                                        padding: EdgeInsets.only(
                                                                          left:
                                                                              5.0.w,
                                                                        ),
                                                                        scrollDirection: Axis.horizontal,
                                                                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100, childAspectRatio: 1.5 / 2, crossAxisSpacing: 2, mainAxisSpacing: 10),
                                                                        itemCount: dashboardController.filteredPropertyModel.areas!.length,
                                                                        itemBuilder: (BuildContext ctx, index) {
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
                                                                            decoration:
                                                                                CustomDecorations.mainCon,
                                                                            child:
                                                                                Center(
                                                                              child: Container(margin: EdgeInsets.only(left: 3.0.w, right: 3.0.w), width: 50.0.w, child: Text(dashboardController.filteredPropertyModel.areas![index].square ?? '')),
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
                                              "Find your dream home from our Newly added properties",
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
                                            // Get.to(() => Moreplaces());
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
                        Container(
                          margin: EdgeInsets.only(
                              left: 3.0.w, right: 3.0.w, top: 1.0.h),
                          height: 4.0.h,
                          width: 100.0.w,
                          decoration: BoxDecoration(
                              color: AppColors.appthem,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Post an Ad",
                              style: AppTextStyles.heading1
                                  .copyWith(color: Colors.white),
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
                      // height: 38.0.h,
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
                                : Padding(
                                    padding: EdgeInsets.only(bottom: 1.5.h),
                                    child: Column(
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
                                                    fontFamily:
                                                        AppFonts.nexaBold,
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
                                          //color: Colors.red,
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
                                                        CustomDecorations
                                                            .mainCon,
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
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                              ),
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                              ),
                                                              child: Image(
                                                                image:
                                                                    NetworkImage(
                                                                  '${AppUrls.baseUrl2}${citiesController.citiesModel.data![index].metadata![0].metaValue![0]}',
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
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
                                                              child:
                                                                  const Center(
                                                                      child:
                                                                          Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                color: Colors
                                                                    .white,
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
                                      ],
                                    ),
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
                                                          child: Image.network(
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
  }

  void _saveDeviceTokenToFirebase(String token) async {
    // DeviceTokenModel _model = DeviceTokenModel(tokenn: token);
    String id = DateTime.now().millisecond.toString();
    await storage.add({"token": token});
  }

  void _showDialogue(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: AppColors.colorWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Select City",
                    style: AppTextStyles.appbar.copyWith(
                        color: AppColors.appthem, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                    height: 20.0.h,
                    //  color: Colors.red,
                    child: Obx(
                      () => getAllCitise.allCitiseLoading.value
                          ? Center(
                              child: CircularProgressIndicator(
                              color: AppColors.appthem,
                            ))
                          : getAllCitise.errorLoadingAllCitise.value != ''
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          getAllCitise.getAllCitise();
                                        },
                                        icon: Icon(Icons.refresh)),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    Text(getAllCitise
                                        .errorLoadingAllCitise.value),
                                  ],
                                )
                              : ListView.builder(
                                  itemCount:
                                      getAllCitise.allCitise.data!.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          cityName = getAllCitise
                                              .allCitise.data![index].name;
                                        });

                                        dashboardController
                                            .getFilteredPropertise(
                                                getAllCitise
                                                    .allCitise.data![index].id,
                                                _browsPropertyIndex1);

                                        print(
                                            "city id is  ${getAllCitise.allCitise.data![index].id}");

                                        Navigator.pop(context);
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.only(left: 2.0.w),
                                            color: Colors.white,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                getAllCitise.allCitise
                                                        .data![index].name ??
                                                    "",
                                                style: AppTextStyles.appbar
                                                    .copyWith(
                                                        color:
                                                            AppColors.appthem),
                                              ),
                                            ),
                                          ),
                                          index ==
                                                  getAllCitise.allCitise.data!
                                                          .length -
                                                      1
                                              ? SizedBox()
                                              : Divider()
                                        ],
                                      ),
                                    );
                                  }),
                    ))
              ],
            ),
          );
        });
  }
}
