// ignore_for_file: unused_field

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/ContactUs/contact_us.dart';
import 'package:prologic_29/Views/Home/Profile/profile.dart';
import 'package:prologic_29/Views/newsFeeed/newsfeed.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/constants/fonts.dart';
import 'package:prologic_29/utils/constants/image_resources.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';

import '../AboutUs/about_us.dart';
import 'home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final labels = ["Buy", "Rent", "Invest"];
  final labels1 = ["Homes", "Plots", "Commercial"];

  final images = [
    AppImageResources.home,
    AppImageResources.plots,
    AppImageResources.commercial
  ];
  int _selectedIndex = 0;
  int _browsPropertyIndex = 0;
  int _browsPropertyIndex1 = 0;
  final List<Widget> _selectedWidget = [
    const HomeScreen(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                width: 100.0.w,
                height: 24.0.h,
                color: AppColors.appthem,
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Image.asset(
                      AppImageResources.applogo,
                      height: 14.0.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 6.0.w, right: 6.0.w, top: 1.0.h),
                      height: 5.0.h,
                      width: 100.0.w,
                      decoration: CustomDecorations.con3.copyWith(
                          color: Colors.transparent,
                          border: Border.all(color: AppColors.colorWhite)),
                      child: Center(
                        child: Text(
                          "Login or Create Account",
                          style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.colorWhite, fontSize: 10.sp),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset(
                  AppImageResources.home,
                  height: 3.0.h,
                ),
                title: Text(
                  "Home",
                  style: AppTextStyles.heading1
                      .copyWith(color: AppColors.colorblack),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 1.0.w, right: 1.0.w),
                child: const Divider(),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => const AboutUs());
                },
                leading: Image.asset(
                  AppImageResources.aboutUs,
                  height: 3.0.h,
                ),
                title: Text(
                  "About Us",
                  style: AppTextStyles.heading1
                      .copyWith(color: AppColors.colorblack),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 1.0.w, right: 1.0.w),
                child: const Divider(),
              ),
              ListTile(
                leading: Image.asset(
                  AppImageResources.areaGuide,
                  height: 3.0.h,
                ),
                title: Text(
                  "Area Guide",
                  style: AppTextStyles.heading1
                      .copyWith(color: AppColors.colorblack),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 1.0.w, right: 1.0.w),
                child: const Divider(),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => const contactus());
                },
                leading: Image.asset(
                  AppImageResources.contact,
                  height: 3.0.h,
                ),
                title: Text(
                  "Contact",
                  style: AppTextStyles.heading1
                      .copyWith(color: AppColors.colorblack),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 1.0.w, right: 1.0.w),
                child: const Divider(),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => const NewsFeed());
                },
                leading: Image.asset(
                  AppImageResources.newFeed,
                  height: 2.5.h,
                ),
                title: Text(
                  "News Feed",
                  style: AppTextStyles.heading1
                      .copyWith(color: AppColors.colorblack),
                ),
              )
            ],
          ),
        ),

        bottomNavigationBar: Container(
          height: 6.0.h,
          color: AppColors.appthem,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.home,
                color: AppColors.colorWhite,
              ),
              const SizedBox(),
              const Icon(
                Icons.search,
                color: AppColors.colorWhite,
              ),
              const SizedBox(),
              const Icon(
                Icons.person,
                color: AppColors.colorWhite,
              ),
              const SizedBox(),
              Image.asset(
                AppImageResources.signIn,
                color: AppColors.colorWhite,
                height: 2.5.h,
              )
            ],
          ),
        ),

        ///bottom nav bar end
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: AppColors.appthem,
                  actions: [
                    Row(
                      children: [
                        Image.asset(
                          AppImageResources.wishList,
                          height: 3.0.h,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 2.0.w,
                        ),
                        Text("WishList",
                            style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.colorWhite,
                                fontFamily: AppFonts.nexaBold)),
                        SizedBox(
                          width: 4.0.w,
                        ),
                      ],
                    )
                  ],
                  expandedHeight: 30.0.h,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "ProLogics",
                      style: AppTextStyles.heading1
                          .copyWith(fontFamily: AppFonts.nexaRegular),
                    ),
                    background: Stack(
                      children: [
                        Container(
                          height: 35.0.h,
                          width: 100.0.w,
                          decoration: const BoxDecoration(
                              color: AppColors.appthem,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30))),
                        ),
                        // Image.network(
                        //     "https://images.unsplash.com/photo-1608555307638-992062b31329?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"),
                        Container(
                          margin: EdgeInsets.only(top: 10.0.h),
                          height: 6.0.h,
                          width: 100.0.w,
                          // decoration: CustomDecorations.con2,
                          child: ListView.builder(
                              itemCount: labels.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      top: 0.8.h,
                                      bottom: 0.8.h,
                                      left: index == 0 ? 7.0.w : 2.8.w),
                                  child: SizedBox(
                                    width: 25.0.w,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(300)),
                                            backgroundColor:
                                                _selectedIndex == index
                                                    ? AppColors.colorWhite
                                                    : AppColors.colorWhite
                                                        .withOpacity(0.8)),
                                        onPressed: () {
                                          setState(() {
                                            _selectedIndex = index;
                                          });
                                        },
                                        child: Text(labels[index])),
                                  ),
                                );
                              }),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 18.0.h, left: 3.0.w, right: 3.0.w),
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
                              const SizedBox()
                            ],
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
                    height: 48.0.h,
                    width: 100.0.w,
                    decoration: CustomDecorations.mainCon,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Browse Propertise",
                            style: AppTextStyles.heading1.copyWith(
                                fontFamily: AppFonts.nexaBook,
                                fontSize: 10.sp,
                                color: AppColors.colorblack),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 3.0.w, right: 3.0.w),
                          height: 5.0.h,
                          width: 100.0.w,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: index == 0 ? 0.0.w : 2.0.w),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                _browsPropertyIndex == index
                                                    ? AppColors.appthem
                                                    : AppColors.colorWhite),
                                        onPressed: () {
                                          setState(() {
                                            _browsPropertyIndex = index;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(images[index],
                                                height: 2.0.h,
                                                color:
                                                    _browsPropertyIndex == index
                                                        ? AppColors.colorWhite
                                                        : AppColors.colorblack),
                                            SizedBox(
                                              width: 0.8.w,
                                            ),
                                            Text(
                                              labels1[index],
                                              style: TextStyle(
                                                  color: _browsPropertyIndex ==
                                                          index
                                                      ? AppColors.colorWhite
                                                      : AppColors.colorblack),
                                            )
                                          ],
                                        )),
                                  ),
                                );
                              }),
                        ),
                        const Divider(),
                        Container(
                          margin: EdgeInsets.only(left: 5.0.w, right: 3.0.w),
                          height: 5.0.h,
                          width: 100.0.w,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _browsPropertyIndex1 = 0;
                                  });
                                },
                                child: Container(
                                  height: 3.0.h,
                                  width: 20.0.w,
                                  decoration: BoxDecoration(
                                    color: _browsPropertyIndex1 == 0
                                        ? AppColors.appthem.withOpacity(0.4)
                                        : AppColors.colorWhite,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Popular",
                                      style: AppTextStyles.heading1.copyWith(
                                          fontSize: 9.sp,
                                          color: _browsPropertyIndex1 == 0
                                              ? AppColors.appthem
                                              : AppColors.colorblack),
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
                                  height: 3.0.h,
                                  width: 20.0.w,
                                  decoration: BoxDecoration(
                                    color: _browsPropertyIndex1 == 1
                                        ? AppColors.appthem.withOpacity(0.4)
                                        : AppColors.colorWhite,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Type",
                                      style: AppTextStyles.heading1.copyWith(
                                          fontSize: 9.sp,
                                          color: _browsPropertyIndex1 == 1
                                              ? AppColors.appthem
                                              : AppColors.colorblack),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _browsPropertyIndex1 = 2;
                                  });
                                },
                                child: Container(
                                  height: 3.0.h,
                                  width: 20.0.w,
                                  decoration: BoxDecoration(
                                    color: _browsPropertyIndex1 == 2
                                        ? AppColors.appthem.withOpacity(0.4)
                                        : AppColors.colorWhite,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Location",
                                      style: AppTextStyles.heading1.copyWith(
                                          fontSize: 9.sp,
                                          color: _browsPropertyIndex1 == 2
                                              ? AppColors.appthem
                                              : AppColors.colorblack),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _browsPropertyIndex1 = 3;
                                  });
                                },
                                child: Container(
                                  height: 3.0.h,
                                  width: 20.0.w,
                                  decoration: BoxDecoration(
                                    color: _browsPropertyIndex1 == 3
                                        ? AppColors.appthem.withOpacity(0.4)
                                        : AppColors.colorWhite,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Area Size",
                                      style: AppTextStyles.heading1.copyWith(
                                          fontSize: 9.sp,
                                          color: _browsPropertyIndex1 == 3
                                              ? AppColors.appthem
                                              : AppColors.colorblack),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 3.0.w, right: 3.0.w),
                          height: 28.0.h,
                          width: 100.0.w,
                          child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 80,
                                      childAspectRatio: 1.3 / 2,
                                      crossAxisSpacing: 2,
                                      mainAxisSpacing: 10),
                              itemCount: 12,
                              itemBuilder: (BuildContext ctx, index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    top: 2.0.h,
                                  ),
                                  height: 4.0.h,
                                  width: 20.0.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Text("name"),
                                );
                              }),
                        )
                      ],
                    ),
                  ),

                  ///constructio cost calculater

                  Container(
                    height: 90.0.h,
                    width: 100.0.w,
                    decoration: CustomDecorations.mainCon,
                    margin:
                        EdgeInsets.only(top: 2.0.h, left: 3.0.w, right: 3.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Explore Good Places",
                            style: AppTextStyles.heading1.copyWith(
                                fontFamily: AppFonts.nexaBold,
                                fontSize: 16.sp,
                                color: AppColors.appthem),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 3.0.w, top: 0.3.h),
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
                              top: 1.0.h, left: 3.0.w, right: 3.0.w),
                          height: 62.0.h,
                          width: 100.0.w,
                          //  color: Colors.red,
                          child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 310,
                                      childAspectRatio: 4 / 4,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemCount: 10,
                              itemBuilder: (BuildContext ctx, index) {
                                return Container(
                                    alignment: Alignment.center,
                                    decoration: CustomDecorations.mainCon,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 14.0.h,
                                          width: 100.0.w,
                                          decoration: const BoxDecoration(
                                              //    color: Colors.red,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10))),
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
                                        SizedBox(
                                          height: 1.0.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
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
                                                "For sale ",
                                                style: AppTextStyles.labelSmall
                                                    .copyWith(
                                                        color: AppColors
                                                            .colorWhite),
                                              )),
                                            ),
                                            Text("PKR 160,00000",
                                                style: AppTextStyles.heading1
                                                    .copyWith(
                                                        color: AppColors
                                                            .colorblack,
                                                        fontSize: 10.sp))
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 2.0.w, top: 1.0.h),
                                          child: Text("New Property",
                                              style: AppTextStyles.heading1
                                                  .copyWith(
                                                color: AppColors.colorblack,
                                              )),
                                        ),
                                        Row(
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
                                              "3 beds",
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
                                              "Bath",
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
                                              "Area",
                                              style: AppTextStyles.labelSmall
                                                  .copyWith(fontSize: 9.sp),
                                            )
                                          ],
                                        ),
                                        const Divider(),
                                        Row(
                                          children: [
                                            Image.asset(
                                              AppImageResources.loc,
                                              height: 2.0.h,
                                            ),
                                            SizedBox(
                                              width: 2.0.w,
                                            ),
                                            Text(
                                              "Islamabad,Punjab",
                                              style: AppTextStyles.labelSmall,
                                            ),
                                          ],
                                        )
                                      ],
                                    ));
                              }),
                        )
                      ],
                    ),
                  ),

                  ///

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
