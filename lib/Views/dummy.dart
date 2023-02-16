import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:prologic_29/custom_widgets/custom_textfield.dart';
import 'package:prologic_29/data/Controllers/NewsFeed_Controller/newsfeed_controller.dart';
import 'package:prologic_29/data/Controllers/comments_controller/post_comments_controller.dart';
import 'package:prologic_29/data/Controllers/comments_controllers/get_comments_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:hive/hive.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';

import '../../data/Controllers/post_like_controller/post_like_controller.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/constants/image_resources.dart';
import '../../utils/styles/custom_decorations.dart';

class Dummy extends StatefulWidget {
  const Dummy({super.key});

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  int? uid;
  final bool _iswishlist = false;
  var scrollController = ScrollController();
  var newsfeedController = Get.put(NewsFeedController());

  var latestCommentsController = Get.put(GetCommentsController());
  var postCommentsController = Get.put(PostCommentsController());
  final likeController = Get.put(PostLikeController());
  final List<TextEditingController> _controllers = [];
  int pagekey = 1;
  static const _pageSize = 20;

  final PagingController _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    newsfeedController.getnewsfeed();
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
      appBar: AppBar(
        title: Text('News Feed ', style: AppTextStyles.heading1),
        backgroundColor: AppColors.appthem,
        actions: [
          Obx(() => Text(
                newsfeedController.length.value.toString(),
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: SingleChildScrollView(
          child: Expanded(
        child: Column(
          children: [
            SizedBox(
              height: 2.0.h,
            ),

            // ListView.builder(itemBuilder: itemBuilder)

            Obx(() => newsfeedController.newsfeedApiLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.appthem,
                  ))
                : newsfeedController.errorLoadingnewsfeed.value != ''
                    ? Center(
                        child: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    newsfeedController.getnewsfeed();
                                  },
                                  icon: const Icon(
                                    Icons.refresh,
                                    color: AppColors.appthem,
                                  )),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              Text(newsfeedController
                                  .errorLoadingnewsfeed.value),
                            ],
                          ),
                        ),
                      )
                    : GetBuilder<NewsFeedController>(
                        init: NewsFeedController(),
                        initState: (_) {},
                        builder: (controller) {
                          return FutureBuilder(
                              //      future: newsfeedController.getnewsfeed(),
                              builder: (context, snapshot) {
                            return ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                _controllers.add(TextEditingController());
                                if (index <
                                    newsfeedController
                                        .newsfeedmodel.data!.data!.length) {
                                  return Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 5.0.w,
                                            right: 5.0.w,
                                            top: index == 0 ? 1.0.h : 2.0.h),
                                        // height: 45.0.h,
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
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                  child: Image.asset(
                                                    AppImageResources.property,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(6.0),
                                                  child: Obx(() =>
                                                      newsfeedController
                                                              .newsfeedmodel
                                                              .data!
                                                              .data![index]
                                                              .isLiked
                                                              .value
                                                          ? InkWell(
                                                              onTap: () {
                                                                newsfeedController
                                                                    .newsfeedmodel
                                                                    .data!
                                                                    .data![
                                                                        index]
                                                                    .isLiked
                                                                    .value = true;

                                                                print(newsfeedController
                                                                    .newsfeedmodel
                                                                    .data!
                                                                    .data![
                                                                        index]
                                                                    .isLiked
                                                                    .value);
                                                              },
                                                              child: const Icon(
                                                                Icons
                                                                    .favorite_outline,
                                                                color: Colors
                                                                    .amber,
                                                              ))
                                                          : InkWell(
                                                              onTap: () {
                                                                newsfeedController
                                                                    .newsfeedmodel
                                                                    .data!
                                                                    .data![
                                                                        index]
                                                                    .isLiked
                                                                    .value = false;
                                                              },
                                                              child: const Icon(
                                                                Icons
                                                                    .favorite_outline,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            )))
                                            ]),
                                            SizedBox(
                                              width: 2.0.h,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 3.5.h,
                                                    width: 22.0.w,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.appthem,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(300)),
                                                    child: Center(
                                                        child: Text(
                                                      newsfeedController
                                                          .newsfeedmodel
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
                                                      " ${newsfeedController.newsfeedmodel.data!.data![index].price}",
                                                      style: AppTextStyles
                                                          .heading1
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
                                                newsfeedController
                                                        .newsfeedmodel
                                                        .data!
                                                        .data![index]
                                                        .description ??
                                                    "",
                                                style: AppTextStyles.heading1
                                                    .copyWith(
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
                                                    newsfeedController
                                                            .newsfeedmodel
                                                            .data!
                                                            .data![index]
                                                            .numberBedroom ??
                                                        "",
                                                    style: AppTextStyles
                                                        .labelSmall
                                                        .copyWith(
                                                            fontSize: 9.sp),
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
                                                    newsfeedController
                                                            .newsfeedmodel
                                                            .data!
                                                            .data![index]
                                                            .numberBathroom ??
                                                        "",
                                                    style: AppTextStyles
                                                        .labelSmall
                                                        .copyWith(
                                                            fontSize: 9.sp),
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
                                                    newsfeedController
                                                            .newsfeedmodel
                                                            .data!
                                                            .data![index]
                                                            .square ??
                                                        "",
                                                    style: AppTextStyles
                                                        .labelSmall
                                                        .copyWith(
                                                            fontSize: 9.sp),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const Divider(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
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
                                                      newsfeedController
                                                              .newsfeedmodel
                                                              .data!
                                                              .data![index]
                                                              .location ??
                                                          "",
                                                      style: AppTextStyles
                                                          .labelSmall,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 17.0.w,
                                                  ),
                                                  Container(
                                                    height: 3.5.h,
                                                    width: 22.0.w,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.appthem,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(300)),
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
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                      ///////////////////enddddddddddddddddddddd/////////////////////
                                      SizedBox(
                                        width: 24.0.w,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 5.0.w,
                                            left: 5.0.w,
                                            top: index == 0 ? 1.0.h : 2.0.h),
                                        height: 6.0.h,
                                        width: 100.w,
                                        decoration: CustomDecorations.mainCon,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  likeController.getPostLike(
                                                      newsfeedController
                                                          .newsfeedmodel
                                                          .data!
                                                          .data![index]
                                                          .id
                                                          .toString(),
                                                      uid!);
                                                  print(
                                                      "detector call ==========${newsfeedController.newsfeedmodel.data!.data![index].likesOnProperties?[0].isliked}");
                                                  setState(() {
                                                    // newsfeedController
                                                    //     .getnewsfeed(
                                                    //         pagekey);
                                                  });
                                                },
                                                icon: newsfeedController
                                                            .newsfeedmodel
                                                            .data!
                                                            .data![index]
                                                            .likesOnProperties?[
                                                                0]
                                                            .isliked ==
                                                        false
                                                    ? const Icon(
                                                        Icons.favorite_border,
                                                      )
                                                    : const Icon(
                                                        Icons.favorite_outlined,
                                                        color: Colors.red,
                                                      ),
                                              ),
                                              // const Icon(Icons.favorite_border_outlined),
                                              GestureDetector(
                                                onTap: () {
                                                  likeController.getPostLike(
                                                      newsfeedController
                                                          .newsfeedmodel
                                                          .data!
                                                          .data![index]
                                                          .id
                                                          .toString(),
                                                      uid!);
                                                  setState(() {});
                                                },
                                                child: Text(
                                                  "Likee",
                                                  style: AppTextStyles
                                                      .labelSmall
                                                      .copyWith(
                                                    fontSize: 13.sp,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 3.0.w,
                                              ),
                                              const Icon(
                                                  Icons.comment_outlined),
                                              // Image.asset(
                                              //   AppImageResources.bed,
                                              //   height: 4.0.h,
                                              // ),
                                              InkWell(
                                                onTap: () async {
                                                  latestCommentsController
                                                      .getComments(2);
                                                  await Future.delayed(Duration(
                                                      milliseconds: 400));
                                                  _showBottomSHeet(context);
                                                },
                                                child: Text(
                                                  "Comment",
                                                  style:
                                                      AppTextStyles.labelSmall,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 3.0.w,
                                              ),
                                              const Icon(Icons.share),
                                              // Image.asset(
                                              //   AppImageResources.bed,
                                              //   height: 3.0.h,
                                              // ),
                                              Text(
                                                "Share",
                                                style: AppTextStyles.labelSmall,
                                              )
                                            ]),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 4.0.w,
                                            left: 4.0.w,
                                            top: 2.0.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              child: CustomTextField(
                                                editingController:
                                                    _controllers[index],
                                                hintText: 'Write Comment....',
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3.0.w,
                                            ),
                                            Container(
                                                height: 12.0.w,
                                                width: 12.0.w,
                                                decoration: BoxDecoration(
                                                    color: AppColors.appthem,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            300)),
                                                child: Obx(
                                                  () => postCommentsController
                                                          .loadingpostComments
                                                          .value
                                                      ? const Center(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: CircularProgressIndicator(
                                                                color: AppColors
                                                                    .colorWhite),
                                                          ),
                                                        )
                                                      : postCommentsController
                                                                  .errorLoadingPostComments
                                                                  .value !=
                                                              ""
                                                          ? showToast(
                                                              postCommentsController
                                                                  .errorLoadingPostComments
                                                                  .value)
                                                          : Center(
                                                              child: IconButton(
                                                                  color: AppColors
                                                                      .colorWhite,
                                                                  onPressed:
                                                                      () {
                                                                    postCommentsController.postComments(
                                                                        index,
                                                                        newsfeedController
                                                                            .newsfeedmodel
                                                                            .data!
                                                                            .data![
                                                                                index]
                                                                            .id,
                                                                        uid,
                                                                        _controllers[index]
                                                                            .text);

                                                                    _controllers[
                                                                            index]
                                                                        .clear();
                                                                  },
                                                                  icon:
                                                                      const Icon(
                                                                    Icons.send,
                                                                    size: 20,
                                                                  )),
                                                            ),
                                                ))
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                } else {
                                  return const Padding(
                                    padding: EdgeInsets.all(18.0),
                                    child: Center(
                                      child: JumpingDots(
                                        color: AppColors.appthem,
                                        radius: 10,
                                        numberOfDots: 3,
                                        //  animationDuration = Duration(milliseconds: 200),
                                      ),
                                    ),
                                  );
                                }
                                ///////////
                              },
                              itemCount: newsfeedController
                                  .newsfeedmodel.data?.data?.length,
                            );
                          });
                        }))
          ],
        ),
      )),
    );
  }

  showToast(String message) {
    return Fluttertoast.showToast(msg: message);
  }

  void _showBottomSHeet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: 30.0.h,
            width: 100.0.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: 2.0.h, left: 3.0.w, right: 3.0.w),
                  height: 20.0.h,
                  width: 100.0.w,
                  color: Colors.red,
                  child: Obx(() =>
                      latestCommentsController.loadingComments.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : latestCommentsController.error.value != ""
                              ? Text(latestCommentsController.error.value)
                              : ListView.builder(
                                  itemCount: latestCommentsController
                                      .commentsModel.data?.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              latestCommentsController
                                                  .getComments(2);
                                            },
                                            icon: Icon(Icons.refresh)),
                                        SizedBox(
                                          height: 2.0.h,
                                        ),
                                        Text(latestCommentsController
                                                .commentsModel
                                                .data?[index]
                                                .comment ??
                                            ""),
                                      ],
                                    );
                                  })),
                )
              ],
            ),
          );
        });
  }
}
