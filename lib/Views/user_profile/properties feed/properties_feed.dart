// ignore_for_file: unused_local_variable, avoid_print, use_build_context_synchronously, avoid_unnecessary_containers, unused_field

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prologic_29/My%20Widgets/tag_widget.dart';
import 'package:prologic_29/custom_widgets/custom_textfield.dart';
import 'package:prologic_29/data/Controllers/NewsFeed_Controller/newsfeed_controller.dart';
import 'package:prologic_29/data/Controllers/comments_controller/get_latest_commnets_controller.dart';
import 'package:prologic_29/data/Controllers/comments_controller/post_comments_controller.dart';
import 'package:prologic_29/data/Controllers/propertypost_controller.dart';
import 'package:prologic_29/data/Services/constants.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import '../../../My Widgets/my_button.dart';
import '../../../data/Controllers/post_like_controller/post_like_controller.dart';
import '../../../data/Controllers/sendchat_controller/send_chat_controller.dart';
import '../../../utils/constants/appcolors.dart';
import '../../../utils/styles/custom_decorations.dart';
import '../chat/chatting_screen.dart';

class PropertiesFeed extends StatefulWidget {
  bool? hide;
  PropertiesFeed({super.key, this.hide});

  @override
  State<PropertiesFeed> createState() => _PropertiesFeedState();
}

class _PropertiesFeedState extends State<PropertiesFeed> {
  var sendchatcontroller = Get.put(SendChatController());
  final bool _istoastsend = false;
  final bool _iswishlist = false;

  var scrollController = ScrollController();
  var postCommentsController = Get.put(PostCommentsController());
  var propertypostController = Get.put(PropertyPostController());
  final likeController = Get.put(PostLikeController());
  var getLatestCommentsController = Get.put(GetLatestCommnets());
  TextEditingController filteraddresscontroller = TextEditingController();
  TextEditingController filteragentcontroller = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  final List<TextEditingController> _controllers = [];
  int pagekey = 1;
  static const _pageSize = 20;
  List<int> wishlish = [];
  int? uid;

  @override
  void initState() {
    super.initState();
    PropertyPostController().getplacesdata(
        filteraddresscontroller.text, filteragentcontroller.text);
    getUserId();
  }

  void getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      uid = pref.getInt("userid") ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   // propertypostController.lst.clear;
      //   print(propertypostController.lst1);
      // }),
      appBar: AppBar(
        title: Text('Properties Feed ', style: AppTextStyles.heading1),
        backgroundColor: AppColors.appthem,
        actions: const [
          // Padding(
          //     padding: EdgeInsets.only(right: 5.0.w, top: 2.0.h),
          //     child: Obx(
          //       () => addwishistcontroller.pid.isEmpty
          //           ? const SizedBox()
          //           : Badge(
          //               badgeContent:
          //                   Text(addwishistcontroller.pid.length.toString()),
          //               child: const Icon(
          //                 Icons.favorite,
          //                 size: 27,
          //               ),
          //             ),
          //     ))
        ],
        //---------------------------------------
      ),
      backgroundColor: const Color.fromARGB(255, 222, 222, 222),
      body: RefreshIndicator(
        onRefresh: () async {
          propertypostController.getplacesdata(
              filteraddresscontroller.text, filteragentcontroller.text);
        },
        child: SingleChildScrollView(
            child: Column(
          children: [
            // SizedBox(
            //   height: 2.0.h,
            // ),
            Container(
              margin: EdgeInsets.only(top: 1.0.h, left: 3.0.w, right: 3.0.w),
              decoration: CustomDecorations.mainCon
                  .copyWith(border: Border.all(color: AppColors.appthem)),
              child: ExpansionTile(
                leading: const Icon(Icons.filter_alt_outlined),
                title: const Text('Filter'),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomTextField(
                        onChanged: () {},
                        hintText: 'Filter by Address',
                        editingController: filteraddresscontroller),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomTextField(
                        onChanged: () {},
                        hintText: 'Filter by Agent Name',
                        editingController: filteragentcontroller),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: MyButton(
                            onTap: () async {
                              if (filteraddresscontroller.text.isNotEmpty ||
                                  filteragentcontroller.text.isNotEmpty) {
                                propertypostController.getplacesdata(
                                    filteraddresscontroller.text,
                                    filteragentcontroller.text);
                                propertypostController.showbtn.value = true;
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'One field is required',
                                    backgroundColor: Colors.red.shade700,
                                    gravity: ToastGravity.TOP);
                              }
                            },
                            text: 'Search',
                          ),
                        ),
                      ),
                      Obx(() => propertypostController.showbtn.value
                          ? Expanded(
                              child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: MyButton(
                                onTap: () {
                                  propertypostController.getplacesdata("", "");
                                  filteraddresscontroller.clear();
                                  filteragentcontroller.clear();
                                  propertypostController.showbtn.value = false;
                                },
                                text: 'Remove filter',
                                color: Colors.red.shade700,
                              ),
                            ))
                          : const SizedBox())
                    ],
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                ],
              ),
            ),
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
                                        filteraddresscontroller.text,
                                        filteragentcontroller.text);
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
                                  String dateTimeString = propertypostController
                                      .propertypostmodel
                                      .data!
                                      .data![index]
                                      .createdAt
                                      .toString();
                                  DateTime dateTime =
                                      DateTime.parse(dateTimeString);
                                  String formattedDate =
                                      DateFormat('dd-MM-yyyy').format(dateTime);
                                  List<String> tags = propertypostController
                                      .propertypostmodel.data!.data![index].tags
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
                                              top: index == 0 ? 1.0.h : 2.0.h),
                                          //  height: 45.0.h,
                                          width: 100.0.w,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
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
                                                                  fontSize: 16,
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
                                                      widget.hide!
                                                          ? const SizedBox()
                                                          : GestureDetector(
                                                              onTap: () {
                                                                // Get.to(() =>
                                                                //     Chating(
                                                                //       agentId: propertypostController
                                                                //           .propertypostmodel
                                                                //           .data!
                                                                //           .data![
                                                                //               index]
                                                                //           .userId,
                                                                //       // conId: sendchatcontroller
                                                                //       //     .sendChatModel
                                                                //       //     .data![0]
                                                                //       //     .conversationId,
                                                                //       customerId: uid
                                                                //           .toString(),
                                                                //       senderId: sendchatcontroller
                                                                //           .sendChatModel
                                                                //           .data![0]
                                                                //           .senderId,
                                                                //       name:
                                                                //           "${propertypostController.propertypostmodel.data!.data![index].user!.firstName} ${propertypostController.propertypostmodel.data!.data![index].user!.lastName}",
                                                                //     ));
                                                                propertypostController
                                                                            .propertypostmodel
                                                                            .data!
                                                                            .data![
                                                                                index]
                                                                            .conversationId ==
                                                                        0
                                                                    ? showmessagedialog(
                                                                        context,
                                                                        index)
                                                                    : Get.to(() =>
                                                                        Chating(
                                                                          agentId: propertypostController
                                                                              .propertypostmodel
                                                                              .data!
                                                                              .data![index]
                                                                              .userId,
                                                                          conId: propertypostController
                                                                              .propertypostmodel
                                                                              .data!
                                                                              .data![index]
                                                                              .conversationId
                                                                              .toString(),
                                                                          customerId:
                                                                              uid.toString(),
                                                                          senderId:
                                                                              uid.toString(),
                                                                          name:
                                                                              "${propertypostController.propertypostmodel.data!.data![index].user!.firstName} ${propertypostController.propertypostmodel.data!.data![index].user!.lastName}",
                                                                        ));
                                                              },
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    border: Border
                                                                        .all(),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          6.0),
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .message,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            1.w,
                                                                      ),
                                                                      const Text(
                                                                          'Message')
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                    ],
                                                  ),
                                                ),

                                                //-------------------Title
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 2.5.w,
                                                      right: 2.w,
                                                      top: 4),
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
                                                      const EdgeInsets.all(8.0),
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
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              237,
                                                              237,
                                                              237),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: Colors.black)),
                                                  height: 32.h,
                                                  margin: const EdgeInsets.only(
                                                      top: 9, bottom: 9),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9),
                                                    child: Center(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          showimage(index);
                                                        },
                                                        child: Image.network(
                                                          '${AppUrls.assetbaseUrl}${propertypostController.propertypostmodel.data!.data![index].imagePath}',
                                                          fit: BoxFit.cover,
                                                        ),
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
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),

                                                //---------------------Location
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
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
                                                          overflow: TextOverflow
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
                                                // widget.hide!
                                                //     ? const SizedBox()
                                                //     : Padding(
                                                //         padding: EdgeInsets.only(
                                                //             left: 15.sp),
                                                //         child: const Text('234'),
                                                //       ),
                                                //--------------------- Like,Comment,Share
                                                widget.hide!
                                                    ? const SizedBox()
                                                    : Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15.sp),
                                                        child: const Divider(
                                                          thickness: 0.5,
                                                          color: Colors.black,
                                                        ),
                                                      ),

                                                widget.hide!
                                                    ? const SizedBox()
                                                    : Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 8),
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Obx(
                                                                () => propertypostController.lst1.contains(propertypostController
                                                                        .propertypostmodel
                                                                        .data!
                                                                        .data![
                                                                            index]
                                                                        .id
                                                                        .toString())
                                                                    ? GestureDetector(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
                                                                              child: const Padding(
                                                                                padding: EdgeInsets.all(0.0),
                                                                                child: Icon(
                                                                                  Icons.thumb_up,
                                                                                  color: Colors.blue,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 1.w,
                                                                            ),
                                                                            Text(
                                                                              "Like",
                                                                              style: AppTextStyles.labelSmall.copyWith(fontSize: 13.sp, color: Colors.blue, fontWeight: FontWeight.w400),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        onTap:
                                                                            () async {
                                                                          print(
                                                                              propertypostController.lst1);
                                                                          print(propertypostController
                                                                              .propertypostmodel
                                                                              .data!
                                                                              .data![index]
                                                                              .id);
                                                                          likeController.getPostLike(
                                                                              propertypostController.propertypostmodel.data!.data![index].id.toString(),
                                                                              uid!);
                                                                          // print(propertypostController
                                                                          //     .propertypostmodel
                                                                          //     .data!
                                                                          //     .data![
                                                                          //         index]
                                                                          //     .id
                                                                          //     .toString());
                                                                          // print(
                                                                          //     "Gesture lIKE++++${likeController.likeIdsList2}");
                                                                          propertypostController.lst1.remove(propertypostController
                                                                              .propertypostmodel
                                                                              .data!
                                                                              .data![index]
                                                                              .id
                                                                              .toString());
                                                                          // setState(() {});
                                                                        },
                                                                      )
                                                                    : GestureDetector(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(borderRadius: BorderRadius.circular(6)),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(0.0),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                const Icon(
                                                                                  Icons.thumb_up_outlined,
                                                                                  color: Colors.black,
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 1.w,
                                                                                ),
                                                                                Text(
                                                                                  "Like",
                                                                                  style: AppTextStyles.labelSmall.copyWith(
                                                                                    fontSize: 13.sp,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        onTap:
                                                                            () async {
                                                                          print(
                                                                              propertypostController.lst1);
                                                                          print(propertypostController
                                                                              .propertypostmodel
                                                                              .data!
                                                                              .data![index]
                                                                              .id);
                                                                          likeController.getPostLike(
                                                                              propertypostController.propertypostmodel.data!.data![index].id.toString(),
                                                                              uid!);
                                                                          // print(
                                                                          //     "Gesture UnlIKE++++${likeController.likeIdsList2}");
                                                                          propertypostController.lst1.add(propertypostController
                                                                              .propertypostmodel
                                                                              .data!
                                                                              .data![index]
                                                                              .id
                                                                              .toString());
                                                                          // setState(() {});
                                                                        },
                                                                      ),
                                                              ),
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  getLatestCommentsController.getLatestCommnets(
                                                                      propertypostController
                                                                          .propertypostmodel
                                                                          .data!
                                                                          .data![
                                                                              index]
                                                                          .id!);

                                                                  await Future.delayed(
                                                                      const Duration(
                                                                          milliseconds:
                                                                              400));
                                                                  _showModelSheet(
                                                                      context,
                                                                      propertypostController
                                                                          .propertypostmodel
                                                                          .data!
                                                                          .data![
                                                                              index]
                                                                          .id!);
                                                                },
                                                                child: Row(
                                                                  children: [
                                                                    const Icon(Icons
                                                                        .chat_bubble_outline),
                                                                    SizedBox(
                                                                      width:
                                                                          6.sp,
                                                                    ),
                                                                    Text(
                                                                      "Comment",
                                                                      style: AppTextStyles
                                                                          .labelSmall,
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                  onTap: () {
                                                                    Share.share(
                                                                      'https://realestate.tecrux.solutions/news-feed',
                                                                      // propertypostController.propertypostmodel
                                                                      //     .data![index]
                                                                      //     .slugable!
                                                                      //     .key!
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                          child:
                                                                              Row(children: [
                                                                    const Icon(Icons
                                                                        .share),
                                                                    SizedBox(
                                                                      width:
                                                                          6.sp,
                                                                    ),
                                                                    Text(
                                                                      "Share",
                                                                      style: AppTextStyles
                                                                          .labelSmall,
                                                                    ),
                                                                  ])))
                                                            ]),
                                                      )
                                              ],
                                            ),
                                          )),
                                      widget.hide!
                                          ? const SizedBox()
                                          : Padding(
                                              padding: EdgeInsets.only(
                                                  right: 4.0.w,
                                                  left: 4.0.w,
                                                  top: 2.0.h),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              222, 222, 222),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child: CustomTextField(
                                                        editingController:
                                                            _controllers[index],
                                                        hintText:
                                                            'Write Comment....',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 3.0.w,
                                                  ),
                                                  Container(
                                                    height: 12.0.w,
                                                    width: 12.0.w,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.appthem,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(300)),
                                                    child: Center(
                                                      child: IconButton(
                                                          color: AppColors
                                                              .colorWhite,
                                                          onPressed: () async {
                                                            postCommentsController
                                                                .postComments(
                                                                    index,
                                                                    propertypostController
                                                                        .propertypostmodel
                                                                        .data!
                                                                        .data![
                                                                            index]
                                                                        .id,
                                                                    uid,
                                                                    _controllers[
                                                                            index]
                                                                        .text);

                                                            _controllers[index]
                                                                .clear();
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        800));
                                                            getLatestCommentsController
                                                                .getLatestCommnets(
                                                                    propertypostController
                                                                        .propertypostmodel
                                                                        .data!
                                                                        .data![
                                                                            index]
                                                                        .id!);
                                                            _showModelSheet(
                                                                context,
                                                                propertypostController
                                                                    .propertypostmodel
                                                                    .data!
                                                                    .data![
                                                                        index]
                                                                    .id!);
                                                          },
                                                          icon: const Icon(
                                                            Icons.send,
                                                            size: 20,
                                                          )),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                    ],
                                  );

                                  // Column(
                                  //   children: [
                                  //     Container(
                                  //       margin: EdgeInsets.only(
                                  //           left: 5.0.w,
                                  //           right: 5.0.w,
                                  //           top: index == 0 ? 1.0.h : 2.0.h),
                                  //       //  height: 45.0.h,
                                  //       width: 100.0.w,
                                  //       decoration: CustomDecorations.mainCon,
                                  //       child: Column(
                                  //         crossAxisAlignment:
                                  //             CrossAxisAlignment.start,
                                  //         children: [
                                  //           Stack(children: [
                                  //             SizedBox(
                                  //               height: 200,
                                  //               width: 100.w,

                                  //               // ignore: prefer_const_constructors
                                  //               child: ClipRRect(
                                  //                 borderRadius:
                                  //                     const BorderRadius.only(
                                  //                         topLeft:
                                  //                             Radius.circular(10),
                                  //                         topRight:
                                  //                             Radius.circular(10)),
                                  //                 child: Image.asset(
                                  //                   AppImageResources.property,
                                  //                   fit: BoxFit.cover,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //             Positioned(
                                  //                 top: 6,
                                  //                 right: 8,
                                  //                 child: Obx(() =>
                                  //                     addwishistcontroller.pid
                                  //                             .contains(
                                  //                                 newsfeedController
                                  //                                     .newsfeedmodel
                                  //                                     .data![index]
                                  //                                     .id)
                                  //                         ? GestureDetector(
                                  //                             child: Container(
                                  //                               decoration: BoxDecoration(
                                  //                                   color: const Color
                                  //                                           .fromARGB(
                                  //                                       255,
                                  //                                       27,
                                  //                                       17,
                                  //                                       17),
                                  //                                   borderRadius:
                                  //                                       BorderRadius
                                  //                                           .circular(
                                  //                                               6)),
                                  //                               child: const Padding(
                                  //                                 padding:
                                  //                                     EdgeInsets.all(
                                  //                                         5.0),
                                  //                                 child: Icon(
                                  //                                   Icons.favorite,
                                  //                                   color:
                                  //                                       Colors.amber,
                                  //                                 ),
                                  //                               ),
                                  //                             ),
                                  //                             onTap: () async {
                                  //                               addwishistcontroller
                                  //                                   .pid
                                  //                                   .remove(newsfeedController
                                  //                                       .newsfeedmodel
                                  //                                       .data![index]
                                  //                                       .id);
                                  //                               addwishistcontroller
                                  //                                   .delwishlist(
                                  //                                       newsfeedController
                                  //                                           .newsfeedmodel
                                  //                                           .data![
                                  //                                               index]
                                  //                                           .id);

                                  //                               addwishistcontroller
                                  //                                           .delwishlistmodel
                                  //                                           .error ==
                                  //                                       true
                                  //                                   ? Fluttertoast
                                  //                                       .showToast(
                                  //                                           msg:
                                  //                                               'not Deleted')
                                  //                                   : Fluttertoast
                                  //                                       .showToast(
                                  //                                           msg:
                                  //                                               'Deleted');
                                  //                             },
                                  //                           )
                                  //                         : GestureDetector(
                                  //                             child: Container(
                                  //                               decoration: BoxDecoration(
                                  //                                   color: const Color
                                  //                                           .fromARGB(
                                  //                                       255,
                                  //                                       126,
                                  //                                       124,
                                  //                                       124),
                                  //                                   borderRadius:
                                  //                                       BorderRadius
                                  //                                           .circular(
                                  //                                               6)),
                                  //                               child: const Padding(
                                  //                                 padding:
                                  //                                     EdgeInsets.all(
                                  //                                         5.0),
                                  //                                 child: Icon(
                                  //                                   Icons
                                  //                                       .favorite_outline,
                                  //                                   color:
                                  //                                       Colors.amber,
                                  //                                 ),
                                  //                               ),
                                  //                             ),
                                  //                             onTap: () async {
                                  //                               addwishistcontroller
                                  //                                   .pid
                                  //                                   .add(newsfeedController
                                  //                                       .newsfeedmodel
                                  //                                       .data![index]
                                  //                                       .id);
                                  //                               addwishistcontroller
                                  //                                   .postwishlist();

                                  //                               addwishistcontroller
                                  //                                           .wishlistModel
                                  //                                           .error ==
                                  //                                       true
                                  //                                   ? Fluttertoast
                                  //                                       .showToast(
                                  //                                           msg:
                                  //                                               'not Added in wishlist')
                                  //                                   : Fluttertoast
                                  //                                       .showToast(
                                  //                                           msg:
                                  //                                               'Added to wishlist');
                                  //                             },
                                  //                           ))
                                  //                 // newsfeedController
                                  //                 //             .newsfeedmodel
                                  //                 //             .data![index]
                                  //                 //             .isWishlist ==
                                  //                 //         1
                                  //                 // ? GestureDetector(
                                  //                 //     child: Container(
                                  //                 //       decoration: BoxDecoration(
                                  //                 //           color:
                                  //                 //               Color.fromARGB(
                                  //                 //                   255,
                                  //                 //                   27,
                                  //                 //                   17,
                                  //                 //                   17),
                                  //                 //           borderRadius:
                                  //                 //               BorderRadius
                                  //                 //                   .circular(
                                  //                 //                       6)),
                                  //                 //       child: Padding(
                                  //                 //         padding:
                                  //                 //             const EdgeInsets
                                  //                 //                 .all(5.0),
                                  //                 //         child: Icon(
                                  //                 //           Icons.favorite,
                                  //                 //           color: Colors.amber,
                                  //                 //         ),
                                  //                 //       ),
                                  //                 //     ),
                                  //                 //     onTap: () async {
                                  //                 //       addwishistcontroller
                                  //                 //           .delwishlist(
                                  //                 //               newsfeedController
                                  //                 //                   .newsfeedmodel
                                  //                 //                   .data![
                                  //                 //                       index]
                                  //                 //                   .id);
                                  //                 //       await Future.delayed(
                                  //                 //           Duration(
                                  //                 //               milliseconds:
                                  //                 //                   600));
                                  //                 //       newsfeedController
                                  //                 //           .getnewsfeed();
                                  //                 //     },
                                  //                 //   )
                                  //                 // : GestureDetector(
                                  //                 //     child: Container(
                                  //                 //       decoration: BoxDecoration(
                                  //                 //           color:
                                  //                 //               Color.fromARGB(
                                  //                 //                   255,
                                  //                 //                   126,
                                  //                 //                   124,
                                  //                 //                   124),
                                  //                 //           borderRadius:
                                  //                 //               BorderRadius
                                  //                 //                   .circular(
                                  //                 //                       6)),
                                  //                 //       child: Padding(
                                  //                 //         padding:
                                  //                 //             const EdgeInsets
                                  //                 //                 .all(5.0),
                                  //                 //         child: Icon(
                                  //                 //           Icons
                                  //                 //               .favorite_outline,
                                  //                 //           color: Colors.amber,
                                  //                 //         ),
                                  //                 //       ),
                                  //                 //     ),
                                  //                 //     onTap: () async {
                                  //                 //       addwishistcontroller
                                  //                 //           .postwishlist();
                                  //                 //       await Future.delayed(
                                  //                 //           Duration(
                                  //                 //               milliseconds:
                                  //                 //                   500));
                                  //                 //       newsfeedController
                                  //                 //           .getnewsfeed();
                                  //                 //     },
                                  //                 //   )
                                  //                 ),
                                  //           ]),
                                  //           SizedBox(
                                  //             width: 2.0.h,
                                  //           ),
                                  //           Padding(
                                  //             padding: const EdgeInsets.all(6.0),
                                  //             child: Row(
                                  //               mainAxisAlignment:
                                  //                   MainAxisAlignment.spaceBetween,
                                  //               children: [
                                  //                 Container(
                                  //                   height: 3.5.h,
                                  //                   width: 22.0.w,
                                  //                   decoration: BoxDecoration(
                                  //                       color: AppColors.appthem,
                                  //                       borderRadius:
                                  //                           BorderRadius.circular(
                                  //                               300)),
                                  //                   child: Center(
                                  //                       child: Text(
                                  //                     newsfeedController.newsfeedmodel
                                  //                         .data![index].id
                                  //                         .toString(),
                                  //                     style: AppTextStyles.labelSmall
                                  //                         .copyWith(
                                  //                             color: AppColors
                                  //                                 .colorWhite),
                                  //                   )),
                                  //                 ),
                                  //                 Text(
                                  //                     " ${newsfeedController.newsfeedmodel.data![index].price}",
                                  //                     style: AppTextStyles.heading1
                                  //                         .copyWith(
                                  //                             color: AppColors
                                  //                                 .colorblack,
                                  //                             fontSize: 10.sp))
                                  //               ],
                                  //             ),
                                  //           ),
                                  //           Padding(
                                  //             padding: EdgeInsets.only(
                                  //               left: 2.0.w,
                                  //             ),
                                  //             child: Text(
                                  //               newsfeedController.newsfeedmodel
                                  //                       .data![index].description ??
                                  //                   "",
                                  //               style:
                                  //                   AppTextStyles.heading1.copyWith(
                                  //                 color: AppColors.colorblack,
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           SizedBox(
                                  //             height: 1.0.h,
                                  //           ),
                                  //           Padding(
                                  //             padding: EdgeInsets.only(right: 2.0.w),
                                  //             child: Row(
                                  //               // crossAxisAlignment: CrossAxisAlignment.end,
                                  //               mainAxisAlignment:
                                  //                   MainAxisAlignment.end,
                                  //               children: [
                                  //                 SizedBox(
                                  //                   width: 2.0.w,
                                  //                 ),
                                  //                 GestureDetector(
                                  //                   onTap: () {
                                  //                     showmessagedialog(
                                  //                         context, index);
                                  //                   },
                                  //                   child: Container(
                                  //                     decoration: BoxDecoration(
                                  //                         border: Border.all(),
                                  //                         borderRadius:
                                  //                             BorderRadius.circular(
                                  //                                 10)),
                                  //                     child: Padding(
                                  //                       padding:
                                  //                           const EdgeInsets.all(6.0),
                                  //                       child: Row(
                                  //                         children: [
                                  //                           const Icon(Icons.message),
                                  //                           SizedBox(
                                  //                             width: 1.w,
                                  //                           ),
                                  //                           const Text('Message')
                                  //                         ],
                                  //                       ),
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //                 const Spacer(),
                                  //                 Image.asset(
                                  //                   AppImageResources.bed,
                                  //                   height: 2.0.h,
                                  //                 ),
                                  //                 SizedBox(
                                  //                   width: 2.0.w,
                                  //                 ),
                                  //                 Text(
                                  //                   newsfeedController
                                  //                           .newsfeedmodel
                                  //                           .data![index]
                                  //                           .numberBedroom ??
                                  //                       "",
                                  //                   style: AppTextStyles.labelSmall
                                  //                       .copyWith(fontSize: 9.sp),
                                  //                 ),
                                  //                 SizedBox(
                                  //                   width: 2.0.w,
                                  //                 ),
                                  //                 Image.asset(
                                  //                   AppImageResources.bath,
                                  //                   height: 2.0.h,
                                  //                 ),
                                  //                 SizedBox(
                                  //                   width: 2.0.w,
                                  //                 ),
                                  //                 Text(
                                  //                   newsfeedController
                                  //                           .newsfeedmodel
                                  //                           .data![index]
                                  //                           .numberBathroom ??
                                  //                       "",
                                  //                   style: AppTextStyles.labelSmall
                                  //                       .copyWith(fontSize: 9.sp),
                                  //                 ),
                                  //                 SizedBox(
                                  //                   width: 2.0.w,
                                  //                 ),
                                  //                 Image.asset(
                                  //                   AppImageResources.plots,
                                  //                   height: 2.0.h,
                                  //                 ),
                                  //                 SizedBox(
                                  //                   width: 2.0.w,
                                  //                 ),
                                  //                 Text(
                                  //                   newsfeedController.newsfeedmodel
                                  //                           .data![index].square ??
                                  //                       "",
                                  //                   style: AppTextStyles.labelSmall
                                  //                       .copyWith(fontSize: 9.sp),
                                  //                 )
                                  //               ],
                                  //             ),
                                  //           ),
                                  //           const Divider(),
                                  //           Padding(
                                  //             padding: const EdgeInsets.all(5.0),
                                  //             child: Row(
                                  //               // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //               children: [
                                  //                 Image.asset(
                                  //                   AppImageResources.loc,
                                  //                   height: 2.0.h,
                                  //                 ),
                                  //                 SizedBox(
                                  //                   width: 2.0.w,
                                  //                 ),
                                  //                 SizedBox(
                                  //                   width: 40.w,
                                  //                   child: Text(
                                  //                     newsfeedController
                                  //                             .newsfeedmodel
                                  //                             .data![index]
                                  //                             .location ??
                                  //                         "",
                                  //                     style: AppTextStyles.labelSmall,
                                  //                     overflow: TextOverflow.ellipsis,
                                  //                   ),
                                  //                 ),
                                  //                 SizedBox(
                                  //                   width: 17.0.w,
                                  //                 ),
                                  //                 GestureDetector(
                                  //                   onTap: () {
                                  //                     Get.to(() => PropertyByID(
                                  //                           name: newsfeedController
                                  //                               .newsfeedmodel
                                  //                               .data![index]
                                  //                               .name,
                                  //                           id: newsfeedController
                                  //                               .newsfeedmodel
                                  //                               .data![index]
                                  //                               .id,
                                  //                           agentId:
                                  //                               newsfeedController
                                  //                                   .newsfeedmodel
                                  //                                   .data![index]
                                  //                                   .agent!
                                  //                                   .id,
                                  //                           userId: uid,
                                  //                         ));
                                  //                   },
                                  //                   child: Container(
                                  //                     height: 3.5.h,
                                  //                     width: 22.0.w,
                                  //                     decoration: BoxDecoration(
                                  //                         color: AppColors.appthem,
                                  //                         borderRadius:
                                  //                             BorderRadius.circular(
                                  //                                 300)),
                                  //                     child: Center(
                                  //                         child: Text(
                                  //                       "View ",
                                  //                       style: AppTextStyles
                                  //                           .labelSmall
                                  //                           .copyWith(
                                  //                               color: AppColors
                                  //                                   .colorWhite),
                                  //                     )),
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           )
                                  //         ],
                                  //       ),
                                  //     ),
                                  //     SizedBox(
                                  //       width: 24.0.w,
                                  //     ),
                                  //     Container(
                                  //       margin: EdgeInsets.only(
                                  //           right: 5.0.w,
                                  //           left: 5.0.w,
                                  //           top: index == 0 ? 1.0.h : 2.0.h),
                                  //       height: 6.0.h,
                                  //       width: 100.w,
                                  //       decoration: CustomDecorations.mainCon,
                                  //       child: Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceEvenly,
                                  //           children: [
                                  //             Obx(
                                  //               () => likeController.likeIdsList2
                                  //                       .contains(newsfeedController
                                  //                           .newsfeedmodel
                                  //                           .data![index]
                                  //                           .id)
                                  //                   ? GestureDetector(
                                  //                       child: Row(
                                  //                         children: [
                                  //                           Container(
                                  //                             decoration: BoxDecoration(
                                  //                                 borderRadius:
                                  //                                     BorderRadius
                                  //                                         .circular(
                                  //                                             6)),
                                  //                             child: const Padding(
                                  //                               padding:
                                  //                                   EdgeInsets.all(
                                  //                                       5.0),
                                  //                               child: Icon(
                                  //                                 Icons.favorite,
                                  //                                 color: Colors
                                  //                                     .redAccent,
                                  //                               ),
                                  //                             ),
                                  //                           ),
                                  //                           SizedBox(
                                  //                             width: 1.w,
                                  //                           ),
                                  //                           Text(
                                  //                             "Like",
                                  //                             style: AppTextStyles
                                  //                                 .labelSmall
                                  //                                 .copyWith(
                                  //                                     fontSize: 13.sp,
                                  //                                     color:
                                  //                                         Colors.blue,
                                  //                                     fontWeight:
                                  //                                         FontWeight
                                  //                                             .w400),
                                  //                           ),
                                  //                         ],
                                  //                       ),
                                  //                       onTap: () async {
                                  //                         likeController.getPostLike(
                                  //                             newsfeedController
                                  //                                 .newsfeedmodel
                                  //                                 .data![index]
                                  //                                 .id
                                  //                                 .toString(),
                                  //                             uid!);
                                  //                         print(
                                  //                             "Gesture lIKE++++${likeController.likeIdsList2}");
                                  //                         setState(() {});
                                  //                       },
                                  //                     )
                                  //                   : GestureDetector(
                                  //                       child: Container(
                                  //                         decoration: BoxDecoration(
                                  //                             borderRadius:
                                  //                                 BorderRadius
                                  //                                     .circular(6)),
                                  //                         child: Padding(
                                  //                           padding:
                                  //                               const EdgeInsets.all(
                                  //                                   5.0),
                                  //                           child: Row(
                                  //                             children: [
                                  //                               const Icon(
                                  //                                 Icons
                                  //                                     .favorite_border,
                                  //                                 color: Colors.grey,
                                  //                               ),
                                  //                               SizedBox(
                                  //                                 width: 1.w,
                                  //                               ),
                                  //                               Text(
                                  //                                 "Like",
                                  //                                 style: AppTextStyles
                                  //                                     .labelSmall
                                  //                                     .copyWith(
                                  //                                   fontSize: 13.sp,
                                  //                                 ),
                                  //                               ),
                                  //                             ],
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                       onTap: () async {
                                  //                         likeController.getPostLike(
                                  //                             newsfeedController
                                  //                                 .newsfeedmodel
                                  //                                 .data![index]
                                  //                                 .id
                                  //                                 .toString(),
                                  //                             uid!);
                                  //                         print(
                                  //                             "Gesture UnlIKE++++${likeController.likeIdsList2}");

                                  //                         setState(() {});
                                  //                       },
                                  //                     ),
                                  //             ), // const Icon(Icons.favorite_border_outlined),

                                  //             SizedBox(
                                  //               width: 3.0.w,
                                  //             ),
                                  //             const Icon(Icons.comment_outlined),
                                  //             // Image.asset(
                                  //             //   AppImageResources.bed,
                                  //             //   height: 4.0.h,
                                  //             // ),
                                  //             InkWell(
                                  //               onTap: () async {
                                  //                 getLatestCommentsController
                                  //                     .getLatestCommnets(
                                  //                         newsfeedController
                                  //                             .newsfeedmodel
                                  //                             .data![index]
                                  //                             .id!);
                                  //                 await Future.delayed(const Duration(
                                  //                     milliseconds: 400));
                                  //                 // _showModelSheet(
                                  //                 //     context,
                                  //                 //     newsfeedController.newsfeedmodel
                                  //                 //         .data![index].id!);
                                  //               },
                                  //               child: Text(
                                  //                 "Comment",
                                  //                 style: AppTextStyles.labelSmall,
                                  //               ),
                                  //             ),
                                  //             SizedBox(
                                  //               width: 3.0.w,
                                  //             ),
                                  //             GestureDetector(
                                  //               onTap: () {
                                  //                 Share.share(newsfeedController
                                  //                     .newsfeedmodel
                                  //                     .data![index]
                                  //                     .slugable!
                                  //                     .key!);
                                  //               },
                                  //               child: Container(
                                  //                 child: Row(
                                  //                   children: [
                                  //                     const Icon(Icons.share),
                                  //                     SizedBox(
                                  //                       width: 6.sp,
                                  //                     ),
                                  //                     Text(
                                  //                       "Share",
                                  //                       style:
                                  //                           AppTextStyles.labelSmall,
                                  //                     ),
                                  //                   ],
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ]),
                                  //     ),
                                  //     Padding(
                                  //       padding: EdgeInsets.only(
                                  //           right: 4.0.w, left: 4.0.w, top: 2.0.h),
                                  //       child: Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.spaceAround,
                                  //         children: [
                                  //           Expanded(
                                  //             child: CustomTextField(
                                  //               editingController:
                                  //                   _controllers[index],
                                  //               hintText: 'Write Comment....',
                                  //             ),
                                  //           ),
                                  //           SizedBox(
                                  //             width: 3.0.w,
                                  //           ),
                                  //           Container(
                                  //             height: 12.0.w,
                                  //             width: 12.0.w,
                                  //             decoration: BoxDecoration(
                                  //                 color: AppColors.appthem,
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(300)),
                                  //             child: Center(
                                  //               child: IconButton(
                                  //                   color: AppColors.colorWhite,
                                  //                   onPressed: () {
                                  //                     postCommentsController
                                  //                         .postComments(
                                  //                             index,
                                  //                             newsfeedController
                                  //                                 .newsfeedmodel
                                  //                                 .data![index]
                                  //                                 .id,
                                  //                             uid,
                                  //                             _controllers[index]
                                  //                                 .text);

                                  //                     _controllers[index].clear();
                                  //                   },
                                  //                   icon: const Icon(
                                  //                     Icons.send,
                                  //                     size: 20,
                                  //                   )),
                                  //             ),
                                  //           )
                                  //         ],
                                  //       ),
                                  //     )
                                  //   ],
                                  // );

                                  ///////////
                                },
                                padding: const EdgeInsets.only(bottom: 15),
                                itemCount: propertypostController
                                    .propertypostmodel.data!.data!.length,
                              );
                            }))
          ],
        )),
      ),
    );
  }

  showimage(index) {
    showDialog(
        barrierLabel: 'Social Feed',
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

                return InteractiveViewer(
                  child: Image.network(
                    '${AppUrls.assetbaseUrl}${propertypostController.propertypostmodel.data!.data![index].imagePath}',
                    height: 100.h,
                    width: 100.w,
                  ),
                );
              },
            ),
          );
        });
    // return showGeneralDialog(
    //     barrierColor: Colors.grey,
    //     context: context,
    //     pageBuilder: (BuildContext buildContext, Animation animation,
    //         Animation secondaryAnimation) {
    //       return Dialog(
    //           backgroundColor: Colors.white,
    //           child: Image.network(
    //             '${AppUrls.assetbaseUrl}${propertypostController.propertypostmodel.data![index].imagePath}',
    //             width: double.infinity,
    //           ));
    //     });
  }

  showToast(String message) {
    return Fluttertoast.showToast(msg: message);
  }

  showmessagedialog(BuildContext context, index) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return SimpleDialog(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      _messageController.clear();
                      Get.back();
                      sendchatcontroller.showbutton.value = false;
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 6),
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 197, 190, 190),
                            size: 16,
                          )),
                    ),
                  ),
                ],
              ),
              const Text(
                'Message to agent',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 300.0,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'message',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide()),
                    disabledBorder: const UnderlineInputBorder(),
                  ),
                  maxLines: null,
                  controller: _messageController,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      sendchatcontroller.loadingSendChat.value
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 51, 140, 182)),
                              onPressed: () {
                                sendchatcontroller.getSendChatApi(
                                  agentid: propertypostController
                                      .propertypostmodel
                                      .data!
                                      .data![index]
                                      .userId,
                                  msg: _messageController.text,
                                );
                                _messageController.clear();
                              },
                              child: const Text('Send')),
                      // if (sendchatcontroller.showbutton.value) ...[
                      //   ElevatedButton(
                      //       style: ElevatedButton.styleFrom(
                      //           backgroundColor:
                      //               const Color.fromARGB(255, 103, 181, 218)),
                      //       onPressed: () {
                      //         print(
                      //             "Agent id ${propertypostController.propertypostmodel.data!.data![index].userId}");
                      //         print("Customer id ${uid.toString()}");
                      //         print(
                      //             "Name ${sendchatcontroller.sendChatModel.data![0].user!.firstName} ${sendchatcontroller.sendChatModel.data![0].user!.lastName}");
                      //         print(
                      //             "Conversation id ${sendchatcontroller.sendChatModel.data![0].conversationId}");
                      //         print(
                      //             "sender id ${sendchatcontroller.sendChatModel.data![0].senderId}");
                      //         Get.to(() => Chating(
                      //               agentId: propertypostController
                      //                   .propertypostmodel
                      //                   .data!
                      //                   .data![index]
                      //                   .userId,
                      //               conId: sendchatcontroller
                      //                   .sendChatModel.data![0].conversationId,
                      //               customerId: uid.toString(),
                      //               senderId: uid.toString(),
                      //               name:
                      //                   "${sendchatcontroller.sendChatModel.data![0].user!.firstName} ${sendchatcontroller.sendChatModel.data![0].user!.lastName}",
                      //             ));
                      //       },
                      //       child: const Text('View Chat'))
                      // ]
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
            ],
          );
        });
  }
  // void _refresh() {
  //   newsfeedController.getnewsfeed();
  // }

  void _showModelSheet(BuildContext context, int pid) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: 50.0.h,
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
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 33.0.h,
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
                                  ? const Center(child: Text("No Comments Yet"))
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
                                                                  '${getLatestCommentsController.commnetsModel.data![index].user!.firstName} ${getLatestCommentsController.commnetsModel.data![index].user!.lastName}',
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
