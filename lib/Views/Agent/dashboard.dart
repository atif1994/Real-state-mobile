import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Agent/views/about_agent.dart';
import 'package:prologic_29/Views/user_profile/properties%20feed/properties_feed.dart';
import 'package:prologic_29/custom_widgets/drawer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../Agent/views/dealer_post/dealer_post.dart';
import '../../data/Controllers/logout_controller.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/constants/fonts.dart';
import '../../utils/constants/image_resources.dart';
import '../../utils/styles/app_textstyles.dart';
import 'Agent_Drawer/expiry_posts.dart';
import 'Agent_Drawer/get_all_referrals.dart';

class AgentDashboard extends StatefulWidget {
  const AgentDashboard({super.key});

  @override
  State<AgentDashboard> createState() => _AgentDashboardState();
}

class _AgentDashboardState extends State<AgentDashboard> {
  final logoutController = Get.put(LogoutController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getinfo();
  }

  String fname = '';
  String lname = '';
  String email = '';
  String? imgurl;
  String? loginimg;
  void getinfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      fname = pref.getString("fname") ?? "";
      lname = pref.getString("lname") ?? "";
      email = pref.getString("email") ?? "";
      imgurl = pref.getString("imgurl") ?? "";
      loginimg = "$imgurl";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 211, 208, 208),
          drawer: AgentDrawer(
              fname: fname,
              lname: lname,
              email: email,
              loginBaseImage: loginimg ?? ""),
          body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: AppColors.appthem,
                    expandedHeight: 15.0.h,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(
                        "Dashboard",
                        style: AppTextStyles.heading1
                            .copyWith(fontFamily: AppFonts.nexaRegular),
                      ),
                    ),
                    floating: true,
                    snap: true,
                    pinned: true,
                  ),
                ];
              },
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 8.0,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const AboutAgent());
                      },
                      child: gridcontainer(
                          Image.asset(
                            AppImageResources.aboutUs,
                            color: AppColors.appthem,
                            height: 4.0.h,
                          ),
                          "About"),
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: gridcontainer(
                            Image.asset(
                              AppImageResources.blogger,
                              color: AppColors.appthem,
                              height: 4.0.h,
                            ),
                            "Dealer Page")),
                    GestureDetector(
                        onTap: () {},
                        child: gridcontainer(
                            const Icon(
                              Icons.chat,
                              color: AppColors.appthem,
                              size: 30,
                            ),
                            "Chat")),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => PropertiesFeed(hide: true));
                        },
                        child: gridcontainer(
                            Image.asset(
                              AppImageResources.newFeed,
                              color: AppColors.appthem,
                              height: 3.5.h,
                            ),
                            "Properties Feed")),
                    GestureDetector(
                        onTap: () {
                          Get.to(const DealerPostScreen());
                        },
                        child: gridcontainer(
                            const Icon(
                              Icons.post_add,
                              color: AppColors.appthem,
                              size: 30,
                            ),
                            "Dealer Post")),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => Expiryppost());
                        },
                        child: gridcontainer(
                            Image.asset(
                              color: AppColors.appthem,
                              AppImageResources.expirepost,
                              height: 5.0.h,
                            ),
                            "Expired Posts")),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => GetReferral());
                        },
                        child: gridcontainer(
                            Image.asset(
                              color: AppColors.appthem,
                              AppImageResources.referral,
                              height: 4.h,
                            ),
                            "Referrals")),
                    GestureDetector(
                        onTap: () {
                          logoutalert(context);
                        },
                        child: gridcontainer(
                            const Icon(
                              Icons.logout,
                              color: AppColors.appthem,
                              size: 30,
                            ),
                            "Logout")),
                  ],
                ),
              )
              // SingleChildScrollView(
              //   child: Container(
              //     margin: const EdgeInsets.all(15),
              //     child: StaggeredGrid.count(
              //       crossAxisCount: 2,
              //       mainAxisSpacing: 12,
              //       crossAxisSpacing: 12,
              //       children: [
              //         StaggeredGridTile.count(
              //             crossAxisCellCount: 1,
              //             mainAxisCellCount: 1,
              //             child: gridcontainer(
              // Image.asset(
              //   AppImageResources.aboutUs,
              //   color: AppColors.appthem,
              //   height: 4.0.h,
              // ),
              //                 "About")),
              //         StaggeredGridTile.count(
              //             crossAxisCellCount: 1,
              //             mainAxisCellCount: 1.2,
              //             child: gridcontainer(
              //                 Image.asset(
              //                   AppImageResources.blogger,
              //                   color: AppColors.appthem,
              //                   height: 4.0.h,
              //                 ),
              //                 "Dealer Page")),
              //         StaggeredGridTile.count(
              //             crossAxisCellCount: 1,
              //             mainAxisCellCount: 1.1,
              //             child: gridcontainer(
              //                 const Icon(
              //                   Icons.chat,
              //                   color: AppColors.appthem,
              //                   size: 30,
              //                 ),
              //                 "Chat")),
              //         StaggeredGridTile.count(
              //             crossAxisCellCount: 1,
              //             mainAxisCellCount: 1.1,
              //             child: gridcontainer(
              //                 Image.asset(
              //                   AppImageResources.newFeed,
              //                   color: AppColors.appthem,
              //                   height: 3.5.h,
              //                 ),
              //                 "Properties Feed")),
              //         StaggeredGridTile.count(
              //             crossAxisCellCount: 1,
              //             mainAxisCellCount: 1.2,
              //             child: StaggeredGridTile.count(
              //               crossAxisCellCount: 1,
              //               mainAxisCellCount: 1.3,
              //               child: GestureDetector(
              //                   onTap: () {
              //                     Get.to(const DealerPostScreen());
              //                   },
              //                   child: gridcontainer(
              //                       const Icon(
              //                         Icons.post_add,
              //                         color: AppColors.appthem,
              //                         size: 30,
              //                       ),
              //                       "Dealer Post")),
              //             )),
              //         StaggeredGridTile.count(
              //             crossAxisCellCount: 1,
              //             mainAxisCellCount: 1.2,
              //             child: GestureDetector(
              //                 onTap: () {
              //                   Get.to(() => Expiryppost());
              //                 },
              //                 child: gridcontainer(
              //                     Image.asset(
              //                       color: AppColors.appthem,
              //                       AppImageResources.expirepost,
              //                       height: 5.0.h,
              //                     ),
              //                     "Expired Posts"))),
              //         StaggeredGridTile.count(
              //             crossAxisCellCount: 1,
              //             mainAxisCellCount: 1.3,
              //             child: GestureDetector(
              //                 onTap: () {
              //                   Get.to(() => GetReferral());
              //                 },
              //                 child: gridcontainer(
              //                   Image.asset(
              //                     color: AppColors.appthem,
              //                     AppImageResources.referral,
              //                     height: 4.h,
              //                   ),
              //                   "Referrals",
              //                 ))),
              //         StaggeredGridTile.count(
              //             crossAxisCellCount: 1,
              //             mainAxisCellCount: 1.2,
              //             child: GestureDetector(
              //                 onTap: () {
              //                   logoutalert(context);
              //                 },
              //                 child: gridcontainer(
              //                   const Icon(
              //                     Icons.logout,
              //                     color: AppColors.appthem,
              //                     size: 30,
              //                   ),
              //                   "Logout",
              //                 ))),
              //       ],
              //     ),
              //   ),
              // )
              )),
    );
  }

  gridcontainer(image, text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          SizedBox(
            height: 1.h,
          ),
          Text(
            text,
            maxLines: 2,
            style: AppTextStyles.heading1.copyWith(color: AppColors.appthem),
          ),
        ],
      ),

      // height: 89,
    );
  }

  void logoutalert(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Logout'),
            content: const Text('Do you want to logout'),
            actions: [
              ButtonBar(children: [
                ElevatedButton(
                    onPressed: () {
                      logoutController.logout();
                    },
                    child: const Text('Confirm')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'))
              ])
            ],
          );
        });
  }
}
