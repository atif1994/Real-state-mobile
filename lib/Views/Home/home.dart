// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:prologic_29/Views/Home/Profile/profile.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';

import 'home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final labels = ["Buy", "Rent", "Invest"];
  final int _selectedIndex = 0;
  final List<Widget> _selectedWidget = [
    const HomeScreen(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),

      ////////////////////bottom nav bar start start
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   elevation: 0,
      //   color: primaryColor.withAlpha(255),
      //   notchMargin: 10,
      //   child: BottomNavigationBar(
      //     elevation: 0,
      //     backgroundColor: Colors.grey.withAlpha(0),
      //     onTap: (index) {
      //       setState(() {
      //         _selectedIndex = index;
      //       });
      //     },
      //     currentIndex: _selectedIndex,
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home_outlined,
      //           color: Colors.white,
      //           size: 20,
      //         ),
      //         label: 'Home',
      //         activeIcon: Icon(Icons.home, color: Colors.white, size: 30),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.person_outlined,
      //           color: Colors.white,
      //           size: 20,
      //         ),
      //         label: 'Profile',
      //         activeIcon: Icon(Icons.person, color: Colors.white, size: 30),
      //       ),
      //     ],
      //   ),
      // ),

      bottomNavigationBar: Container(
        height: 6.0.h,
        color: AppColors.appthem,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(
              Icons.home,
              color: AppColors.colorWhite,
            ),
            SizedBox(),
            Icon(
              Icons.search,
              color: AppColors.colorWhite,
            ),
            SizedBox(),
            Icon(
              Icons.person,
              color: AppColors.colorWhite,
            ),
          ],
        ),
      ),

      ///bottom nav bar end
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 30.0.h,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "ProLogics",
                    style: AppTextStyles.heading1,
                  ),
                  background: Stack(
                    children: [
                      Image.network(
                          "https://images.unsplash.com/photo-1608555307638-992062b31329?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"),
                      Container(
                        margin: EdgeInsets.only(
                            top: 16.0.h, left: 3.0.w, right: 3.0.w),
                        height: 6.0.h,
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
                            Text(
                              "Search for shops",
                              style: AppTextStyles.labelSmall,
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
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 1.0.h),
                height: 6.0.h,
                width: 100.0.w,
                // decoration: CustomDecorations.con2,
                child: ListView.builder(
                    itemCount: labels.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: 0.5.h,
                            bottom: 0.5.h,
                            left: index == 0 ? 2.0.w : 2.8.w),
                        child: SizedBox(
                          width: 30.0.w,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.colorWhite),
                              onPressed: () {},
                              child: Text(labels[index])),
                        ),
                      );
                    }),
              ),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            top: index == 0 ? 2.0.h : 3.0.h,
                            left: 2.0.w,
                            right: 2.0.w,
                            bottom: index == 3 ? 2.0.h : 0.0.h),
                        height: 25.0.h,
                        width: 100.0.w,
                        decoration: CustomDecorations.mainCon,
                      );
                    }),
              ),
            ],
          )),
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
