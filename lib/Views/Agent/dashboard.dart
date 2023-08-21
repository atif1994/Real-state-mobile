import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prologic_29/custom_widgets/drawer_widget.dart';
import 'package:prologic_29/data/Services/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../My Widgets/tag_widget.dart';
import '../../data/Controllers/NewsFeed_Controller/newsfeed_controller.dart';
import '../../data/Controllers/comments_controller/get_latest_commnets_controller.dart';
import '../../data/Controllers/comments_controller/post_comments_controller.dart';
import '../../data/Controllers/logout_controller.dart';
import '../../data/Controllers/post_like_controller/post_like_controller.dart';
import '../../data/Controllers/propertypost_controller.dart';
import '../../utils/constants/app_urls.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/constants/fonts.dart';
import '../../utils/styles/app_textstyles.dart';

class AgentDashboard extends StatefulWidget {
  const AgentDashboard({super.key});

  @override
  State<AgentDashboard> createState() => _AgentDashboardState();
}

class _AgentDashboardState extends State<AgentDashboard> {
  var propertypostController = Get.put(PropertyPostController());
  final List<TextEditingController> _controllers = [];
  var postCommentsController = Get.put(PostCommentsController());
  final likeController = Get.put(PostLikeController());
  var getLatestCommentsController = Get.put(GetLatestCommnets());
  final logoutController = Get.put(LogoutController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getinfo();
    PropertyPostController().getplacesdata("", "");
    getUserId();
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

  int? uid;

  void getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      uid = pref.getInt("userid") ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appthem,
          flexibleSpace: Stack(
            children: [
              const Positioned(
                top: 7,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: AppColors.logobgcolor,
                  backgroundImage: AssetImage(
                    'assets/relogo.png',
                    // scale: 14,
                  ),
                ),
              ),
              FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "HomePage",
                  style: AppTextStyles.heading1
                      .copyWith(fontFamily: AppFonts.nexaRegular),
                ),
              )
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(onPressed: () {
        //   Get.to(() => const Home());
        // }),
        backgroundColor: const Color.fromARGB(255, 211, 208, 208),
        drawer: AgentDrawer(
            fname: fname,
            lname: lname,
            email: email,
            loginBaseImage: loginimg ?? ""),

        body: RefreshIndicator(
          onRefresh: () async {
            propertypostController.getplacesdata("", "");
          },
          child: SingleChildScrollView(
              child: Column(
            children: [
              Obx(() => propertypostController.loadingpropertypost.value
                  ? Padding(
                      padding: EdgeInsets.only(top: 20.0.h),
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.appthem,
                      )),
                    )
                  : propertypostController.errorloadingpropertypost.value != ''
                      ? Center(
                          child: Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      propertypostController.getplacesdata(
                                          "", "");
                                    },
                                    icon: const Icon(
                                      Icons.refresh,
                                      color: AppColors.appthem,
                                    )),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Text(propertypostController
                                    .errorloadingpropertypost.value),
                              ],
                            ),
                          ),
                        )
                      : propertypostController
                              .propertypostmodel.data!.data!.isEmpty
                          ? nopostexist
                          : GetBuilder<NewsFeedController>(
                              init: NewsFeedController(),
                              initState: (_) {},
                              builder: (controller) {
                                return ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    String dateTimeString =
                                        propertypostController.propertypostmodel
                                            .data!.data![index].createdAt
                                            .toString();
                                    DateTime dateTime =
                                        DateTime.parse(dateTimeString);
                                    String formattedDate =
                                        DateFormat('dd-MM-yyyy')
                                            .format(dateTime);
                                    List<String> tags = propertypostController
                                        .propertypostmodel
                                        .data!
                                        .data![index]
                                        .tags
                                        .toString()
                                        .split(',')
                                        .map((tag) => tag.trim())
                                        .toList();

                                    // List<String> tags = propertypostController
                                    //     .propertypostmodel.data![index].tags;
                                    _controllers.add(TextEditingController());

                                    return Column(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                                color: AppColors.colorWhite),
                                            margin: EdgeInsets.only(
                                                top:
                                                    index == 0 ? 1.0.h : 2.0.h),
                                            //  height: 45.0.h,
                                            width: 100.0.w,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  //--------Agent image and name, message button
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundImage:
                                                              NetworkImage(
                                                                  '${AppUrls.assetuserbaseUrl}${propertypostController.propertypostmodel.data!.data![index].user!.profileImage}'),
                                                        ),
                                                        const SizedBox(
                                                          width: 6,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              width: 50.w,
                                                              child: Text(
                                                                '${propertypostController.propertypostmodel.data!.data![index].user!.firstName} ${propertypostController.propertypostmodel.data!.data![index].user!.lastName}',
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            Text(
                                                              formattedDate,
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          13),
                                                            )
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                      ],
                                                    ),
                                                  ),

                                                  //-------------------Title
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 9.0, top: 4),
                                                    child: Text(
                                                      '${propertypostController.propertypostmodel.data!.data![index].adTitle}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                  //--------------------Tags
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Wrap(
                                                      spacing: 5,
                                                      runSpacing: 2,
                                                      children: tags
                                                          .map((tag) =>
                                                              Tag(label: tag))
                                                          .toList(),
                                                    ),
                                                  ),
                                                  //---------------------Image
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 237, 237, 237),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.black)),
                                                    height: 32.h,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 9, bottom: 9),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9),
                                                      child: Center(
                                                        child: Image.network(
                                                          '${AppUrls.assetbaseUrl}${propertypostController.propertypostmodel.data!.data![index].imagePath}',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //----------------------Description

                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      '${propertypostController.propertypostmodel.data!.data![index].description}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),

                                                  //---------------------Location
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.location_on,
                                                          size: 22,
                                                        ),
                                                        const SizedBox(
                                                          width: 6,
                                                        ),
                                                        SizedBox(
                                                          width: 84.w,
                                                          child: Text(
                                                            '${propertypostController.propertypostmodel.data!.data![index].location} ',
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: const TextStyle(
                                                                fontFamily:
                                                                    AppFonts
                                                                        .nexaBold),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  //  Padding(
                                                  //         padding: EdgeInsets.only(
                                                  //             left: 15.sp),
                                                  //         child: const Text('234'),
                                                  //       ),
                                                  //--------------------- Like,Comment,Share
                                                  // Padding(
                                                  //   padding: EdgeInsets.symmetric(
                                                  //       horizontal: 15.sp),
                                                  //   child: const Divider(
                                                  //     thickness: 0.5,
                                                  //     color: Colors.black,
                                                  //   ),
                                                  // ),
                                                  // Padding(
                                                  //   padding: const EdgeInsets.only(
                                                  //       bottom: 8),
                                                  //   child: Row(
                                                  //       mainAxisAlignment:
                                                  //           MainAxisAlignment
                                                  //               .spaceEvenly,
                                                  //       children: [
                                                  //         Obx(
                                                  //           () => likeController
                                                  //                   .likeIdsList2
                                                  //                   .contains(propertypostController
                                                  //                       .propertypostmodel
                                                  //                       .data!
                                                  //                       .data![
                                                  //                           index]
                                                  //                       .id)
                                                  //               ? GestureDetector(
                                                  //                   child: Row(
                                                  //                     children: [
                                                  //                       Container(
                                                  //                         decoration:
                                                  //                             BoxDecoration(
                                                  //                                 borderRadius: BorderRadius.circular(6)),
                                                  //                         child:
                                                  //                             const Padding(
                                                  //                           padding:
                                                  //                               EdgeInsets.all(0.0),
                                                  //                           child:
                                                  //                               Icon(
                                                  //                             Icons
                                                  //                                 .thumb_up,
                                                  //                             color:
                                                  //                                 Colors.blue,
                                                  //                           ),
                                                  //                         ),
                                                  //                       ),
                                                  //                       SizedBox(
                                                  //                         width:
                                                  //                             1.w,
                                                  //                       ),
                                                  //                       Text(
                                                  //                         "Like",
                                                  //                         style: AppTextStyles.labelSmall.copyWith(
                                                  //                             fontSize: 13
                                                  //                                 .sp,
                                                  //                             color: Colors
                                                  //                                 .blue,
                                                  //                             fontWeight:
                                                  //                                 FontWeight.w400),
                                                  //                       ),
                                                  //                     ],
                                                  //                   ),
                                                  //                   onTap:
                                                  //                       () async {
                                                  //                     likeController.getPostLike(
                                                  //                         propertypostController
                                                  //                             .propertypostmodel
                                                  //                             .data!
                                                  //                             .data![
                                                  //                                 index]
                                                  //                             .id
                                                  //                             .toString(),
                                                  //                         uid!);
                                                  //                     print(propertypostController
                                                  //                         .propertypostmodel
                                                  //                         .data!
                                                  //                         .data![
                                                  //                             index]
                                                  //                         .id
                                                  //                         .toString());
                                                  //                     print(
                                                  //                         "Gesture lIKE++++${likeController.likeIdsList2}");
                                                  //                     setState(
                                                  //                         () {});
                                                  //                   },
                                                  //                 )
                                                  //               : GestureDetector(
                                                  //                   child:
                                                  //                       Container(
                                                  //                     decoration: BoxDecoration(
                                                  //                         borderRadius:
                                                  //                             BorderRadius.circular(
                                                  //                                 6)),
                                                  //                     child:
                                                  //                         Padding(
                                                  //                       padding:
                                                  //                           const EdgeInsets.all(
                                                  //                               0.0),
                                                  //                       child: Row(
                                                  //                         children: [
                                                  //                           const Icon(
                                                  //                             Icons
                                                  //                                 .thumb_up_outlined,
                                                  //                             color:
                                                  //                                 Colors.black,
                                                  //                           ),
                                                  //                           SizedBox(
                                                  //                             width:
                                                  //                                 1.w,
                                                  //                           ),
                                                  //                           Text(
                                                  //                             "Like",
                                                  //                             style: AppTextStyles
                                                  //                                 .labelSmall
                                                  //                                 .copyWith(
                                                  //                               fontSize:
                                                  //                                   13.sp,
                                                  //                             ),
                                                  //                           ),
                                                  //                         ],
                                                  //                       ),
                                                  //                     ),
                                                  //                   ),
                                                  //                   onTap:
                                                  //                       () async {
                                                  //                     likeController.getPostLike(
                                                  //                         propertypostController
                                                  //                             .propertypostmodel
                                                  //                             .data!
                                                  //                             .data![
                                                  //                                 index]
                                                  //                             .id
                                                  //                             .toString(),
                                                  //                         uid!);
                                                  //                     print(
                                                  //                         "Gesture UnlIKE++++${likeController.likeIdsList2}");

                                                  //                     setState(
                                                  //                         () {});
                                                  //                   },
                                                  //                 ),
                                                  //         ),
                                                  //         InkWell(
                                                  //           onTap: () async {
                                                  //             getLatestCommentsController
                                                  //                 .getLatestCommnets(
                                                  //                     propertypostController
                                                  //                         .propertypostmodel
                                                  //                         .data!
                                                  //                         .data![
                                                  //                             index]
                                                  //                         .id!);

                                                  //             await Future.delayed(
                                                  //                 const Duration(
                                                  //                     milliseconds:
                                                  //                         400));
                                                  //             _showModelSheet(
                                                  //                 context,
                                                  //                 propertypostController
                                                  //                     .propertypostmodel
                                                  //                     .data!
                                                  //                     .data![index]
                                                  //                     .id!);
                                                  //           },
                                                  //           child: Row(
                                                  //             children: [
                                                  //               const Icon(Icons
                                                  //                   .chat_bubble_outline),
                                                  //               SizedBox(
                                                  //                 width: 6.sp,
                                                  //               ),
                                                  //               Text(
                                                  //                 "Comment",
                                                  //                 style: AppTextStyles
                                                  //                     .labelSmall,
                                                  //               )
                                                  //             ],
                                                  //           ),
                                                  //         ),
                                                  //         GestureDetector(
                                                  //             onTap: () {
                                                  //               Share.share(
                                                  //                   'sohaib id'
                                                  //                   // propertypostController.propertypostmodel
                                                  //                   //     .data![index]
                                                  //                   //     .slugable!
                                                  //                   //     .key!
                                                  //                   );
                                                  //             },
                                                  //             child: Container(
                                                  //                 child: Row(
                                                  //                     children: [
                                                  //                   const Icon(Icons
                                                  //                       .share),
                                                  //                   SizedBox(
                                                  //                     width: 6.sp,
                                                  //                   ),
                                                  //                   Text(
                                                  //                     "Share",
                                                  //                     style: AppTextStyles
                                                  //                         .labelSmall,
                                                  //                   ),
                                                  //                 ])))
                                                  //       ]),
                                                  // )
                                                ],
                                              ),
                                            )),
                                        // Padding(
                                        //   padding: EdgeInsets.only(
                                        //       right: 4.0.w,
                                        //       left: 4.0.w,
                                        //       top: 2.0.h),
                                        //   child: Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.spaceAround,
                                        //     children: [
                                        //       Expanded(
                                        //         child: Container(
                                        //           decoration: BoxDecoration(
                                        //               color: const Color.fromARGB(
                                        //                   255, 222, 222, 222),
                                        //               borderRadius:
                                        //                   BorderRadius.circular(8)),
                                        //           child: CustomTextField(
                                        //             editingController:
                                        //                 _controllers[index],
                                        //             hintText: 'Write Comment....',
                                        //           ),
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
                                        //                         propertypostController
                                        //                             .propertypostmodel
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
                                        // ),
                                      ],
                                    );
                                  },
                                  padding: const EdgeInsets.only(bottom: 15),
                                  itemCount: propertypostController
                                      .propertypostmodel.data!.data!.length,
                                );
                              }))
            ],
          )),
        ),

        //  Padding(
        //   padding:
        //       const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        //   child: GridView.count(
        //     crossAxisCount: 2,
        //     crossAxisSpacing: 10.0,
        //     mainAxisSpacing: 8.0,
        //     children: [
        //       GestureDetector(
        //         onTap: () {
        //           Get.to(() => const AboutAgent());
        //         },
        //         child: gridcontainer(
        //             Image.asset(
        //               AppImageResources.aboutUs,
        //               color: AppColors.appthem,
        //               height: 4.0.h,
        //             ),
        //             "About"),
        //       ),
        //       GestureDetector(
        //           onTap: () {
        //             Get.to(() => const DealerPageUI());
        //           },
        //           child: gridcontainer(
        //               Image.asset(
        //                 AppImageResources.blogger,
        //                 color: AppColors.appthem,
        //                 height: 4.0.h,
        //               ),
        //               "Dealer Page")),
        //       GestureDetector(
        //           onTap: () {},
        //           child: gridcontainer(
        //               const Icon(
        //                 Icons.chat,
        //                 color: AppColors.appthem,
        //                 size: 30,
        //               ),
        //               "Chat")),
        //       GestureDetector(
        //           onTap: () {
        //             Get.to(() => PropertiesFeed(hide: true));
        //           },
        //           child: gridcontainer(
        //               Image.asset(
        //                 AppImageResources.newFeed,
        //                 color: AppColors.appthem,
        //                 height: 3.5.h,
        //               ),
        //               "Properties Feed")),
        //       GestureDetector(
        //           onTap: () {
        //             Get.to(const DealerPostScreen());
        //           },
        //           child: gridcontainer(
        //               const Icon(
        //                 Icons.post_add,
        //                 color: AppColors.appthem,
        //                 size: 30,
        //               ),
        //               "Dealer Post")),
        //       GestureDetector(
        //           onTap: () {
        //             Get.to(() => Expiryppost());
        //           },
        //           child: gridcontainer(
        //               Image.asset(
        //                 color: AppColors.appthem,
        //                 AppImageResources.expirepost,
        //                 height: 5.0.h,
        //               ),
        //               "Expired Posts")),
        //       GestureDetector(
        //           onTap: () {
        //             Get.to(() => GetReferral());
        //           },
        //           child: gridcontainer(
        //               Image.asset(
        //                 color: AppColors.appthem,
        //                 AppImageResources.referral,
        //                 height: 4.h,
        //               ),
        //               "Referrals")),
        //       GestureDetector(
        //           onTap: () {
        //             logoutalert(context);
        //           },
        //           child: gridcontainer(
        //               const Icon(
        //                 Icons.logout,
        //                 color: AppColors.appthem,
        //                 size: 30,
        //               ),
        //               "Logout")),
        //     ],
        //   ),
        // )

        //-------------------------------
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
      ),
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

  void _showModelSheet(BuildContext context, int pid) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: 40.0.h,
            width: 100.0.w,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'All Comments',
                  style: TextStyle(fontSize: 18),
                ),
                const Divider(),
                Container(
                    margin: const EdgeInsets.all(10),
                    height: 20.0.h,
                    width: 100.0.w,
                    //   color: Colors.red,
                    child: Obx(
                      () => getLatestCommentsController.loadingCommnets.value
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: AppColors.appthem,
                            ))
                          : getLatestCommentsController.error.value != ""
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          getLatestCommentsController
                                              .getLatestCommnets(pid);
                                        },
                                        icon: const Icon(Icons.refresh)),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    Text(getLatestCommentsController
                                        .error.value),
                                  ],
                                )
                              : getLatestCommentsController
                                      .commnetsModel.data!.isEmpty
                                  ? const Center(child: Text("No Commnets Yet"))
                                  : ListView.builder(
                                      itemCount: getLatestCommentsController
                                          .commnetsModel.data!.length,
                                      itemBuilder: (context, index) {
                                        bool d = false;
                                        return Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 12.0.w,
                                                    width: 12.0.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(300)),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              300),
                                                      child: Image.asset(
                                                          "assets/user.png"),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 3.0.w,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.grey[200],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  getLatestCommentsController
                                                                          .commnetsModel
                                                                          .data![
                                                                              index]
                                                                          .user!
                                                                          .username ??
                                                                      "",
                                                                  style: AppTextStyles.appbar.copyWith(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                  width: 70.0.w,
                                                                  child: Text(
                                                                    getLatestCommentsController
                                                                            .commnetsModel
                                                                            .data![index]
                                                                            .comment ??
                                                                        "",
                                                                    maxLines: 4,
                                                                    style: AppTextStyles
                                                                        .appbar
                                                                        .copyWith(
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const Divider()
                                          ],
                                        );
                                      }),
                    )),
              ],
            ),
          );
        });
  }
}
