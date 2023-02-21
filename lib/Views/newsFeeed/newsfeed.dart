import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:prologic_29/custom_widgets/custom_textfield.dart';
import 'package:prologic_29/data/Controllers/NewsFeed_Controller/newsfeed_controller.dart';
import 'package:prologic_29/data/Controllers/comments_controller/get_latest_commnets_controller.dart';
import 'package:prologic_29/data/Controllers/comments_controller/post_comments_controller.dart';
import 'package:prologic_29/data/Controllers/wishlist_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';

import '../../data/Controllers/post_like_controller/post_like_controller.dart';

import '../../data/Controllers/wishlist_controller/add_wishlist_controller.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/constants/image_resources.dart';
import '../../utils/styles/custom_decorations.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  var addwishistcontroller = Get.put(AddWishlistController());

  int? uid;
  final bool _iswishlist = false;
  var scrollController = ScrollController();
  var newsfeedController = Get.put(NewsFeedController());
  var postCommentsController = Get.put(PostCommentsController());
  final likeController = Get.put(PostLikeController());
  var getLatestCommentsController = Get.put(GetLatestCommnets());
  final List<TextEditingController> _controllers = [];
  int pagekey = 1;
  static const _pageSize = 20;

  final PagingController _pagingController = PagingController(firstPageKey: 0);
  List<int> wishlish = [];

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
        // actions: [
        //   Padding(
        //       padding: EdgeInsets.only(right: 5.0.w, top: 2.0.h),
        //       child: Obx(
        //         () => Badge(
        //           label: Text(addwishistcontroller.getwishlistmodel.data!.length
        //               .toString()),
        //           child: const Icon(Icons.favorite),
        //         ),
        //       ))
        // ],
        //---------------------------------------
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
                          return ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              _controllers.add(TextEditingController());

                              var d = newsfeedController
                                  .newsfeedmodel.data!.data![index].isLiked;

                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 5.0.w,
                                        right: 5.0.w,
                                        top: index == 0 ? 1.0.h : 2.0.h),
                                    //  height: 45.0.h,
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
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10)),
                                              child: Image.asset(
                                                AppImageResources.property,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 6,
                                            right: 8,
                                            child: Obx(() =>
                                                addwishistcontroller.pid
                                                        .contains(
                                                            newsfeedController
                                                                .newsfeedmodel
                                                                .data!
                                                                .data![index]
                                                                .id)
                                                    ? GestureDetector(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      126,
                                                                      124,
                                                                      124),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child: Icon(
                                                              Icons.favorite,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          addwishistcontroller
                                                              .pid
                                                              .add(newsfeedController
                                                                  .newsfeedmodel
                                                                  .data!
                                                                  .data![index]
                                                                  .id);
                                                          addwishistcontroller
                                                              .postwishlist();
                                                        },
                                                      )
                                                    : GestureDetector(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      126,
                                                                      124,
                                                                      124),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child: Icon(
                                                              Icons
                                                                  .favorite_outline,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          addwishistcontroller
                                                              .pid
                                                              .add(newsfeedController
                                                                  .newsfeedmodel
                                                                  .data!
                                                                  .data![index]
                                                                  .id);
                                                          addwishistcontroller
                                                              .postwishlist();
                                                        },

                                                        // newsfeedController
                                                        //             .newsfeedmodel
                                                        //             .data!
                                                        //             .data![index]
                                                        //             .isAddedToWishList
                                                        //             .value ==
                                                        //         true
                                                        //     ? InkWell(
                                                        //         onTap: () {},
                                                        //         child: const Icon(
                                                        //           Icons.favorite,
                                                        //           color: Colors.amber,
                                                        //         ))
                                                        //     : InkWell(
                                                        //         onTap: () {
                                                        //           addwishistcontroller
                                                        //               .postwishlist();

                                                        //           setState(() {
                                                        //             addwishistcontroller
                                                        //                 .pid
                                                        //                 .add(newsfeedController
                                                        //                     .newsfeedmodel
                                                        //                     .data
                                                        //                     ?.data![
                                                        //                         index]
                                                        //                     .id);
                                                        //           });

                                                        //           print(newsfeedController
                                                        //               .newsfeedmodel
                                                        //               .data!
                                                        //               .data![index]
                                                        //               .isAddedToWishList
                                                        //               .value);
                                                        //         },
                                                        //         child: const Icon(
                                                        //           Icons
                                                        //               .favorite_outline,
                                                        //           color: Colors.amber,
                                                        //         ),
                                                        // )
                                                      )),
                                          )
                                        ]),
                                        SizedBox(
                                          width: 2.0.h,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                  style: AppTextStyles.heading1
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
                                            style:
                                                AppTextStyles.heading1.copyWith(
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
                                                newsfeedController
                                                        .newsfeedmodel
                                                        .data!
                                                        .data![index]
                                                        .numberBathroom ??
                                                    "",
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
                                                newsfeedController
                                                        .newsfeedmodel
                                                        .data!
                                                        .data![index]
                                                        .square ??
                                                    "",
                                                style: AppTextStyles.labelSmall
                                                    .copyWith(fontSize: 9.sp),
                                              )
                                            ],
                                          ),
                                        ),
                                        const Divider(),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
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
                                                  style:
                                                      AppTextStyles.labelSmall,
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
                                                    color: AppColors.appthem,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            300)),
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
                                          d == 1
                                              ? const Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                )
                                              : IconButton(
                                                  onPressed: () async {
                                                    likeController.getPostLike(
                                                        newsfeedController
                                                            .newsfeedmodel
                                                            .data!
                                                            .data![index]
                                                            .id
                                                            .toString(),
                                                        uid!);

                                                    _refresh();

                                                    // print(
                                                    //     "detector call ==========${newsfeedController.newsfeedmodel.data!.data![index].likesOnProperties?[0].isliked}");
                                                    // setState(() {
                                                    //   newsfeedController
                                                    //       .getnewsfeed(pagekey);
                                                    // });
                                                  },
                                                  icon: const Icon(
                                                    Icons.favorite_border,
                                                  )),

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
                                              style: AppTextStyles.labelSmall
                                                  .copyWith(
                                                fontSize: 13.sp,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3.0.w,
                                          ),
                                          const Icon(Icons.comment_outlined),
                                          // Image.asset(
                                          //   AppImageResources.bed,
                                          //   height: 4.0.h,
                                          // ),
                                          InkWell(
                                            onTap: () async {
                                              getLatestCommentsController
                                                  .getLatestCommnets(
                                                      newsfeedController
                                                          .newsfeedmodel
                                                          .data!
                                                          .data![index]
                                                          .id!);
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 400));
                                              _showModelSheet(
                                                  context,
                                                  newsfeedController
                                                      .newsfeedmodel
                                                      .data!
                                                      .data![index]
                                                      .id!);
                                            },
                                            child: Text(
                                              "Comment",
                                              style: AppTextStyles.labelSmall,
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
                                        right: 4.0.w, left: 4.0.w, top: 2.0.h),
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
                                                  BorderRadius.circular(300)),
                                          child: Center(
                                            child: IconButton(
                                                color: AppColors.colorWhite,
                                                onPressed: () {
                                                  postCommentsController
                                                      .postComments(
                                                          index,
                                                          newsfeedController
                                                              .newsfeedmodel
                                                              .data!
                                                              .data![index]
                                                              .id,
                                                          uid,
                                                          _controllers[index]
                                                              .text);

                                                  _controllers[index].clear();
                                                },
                                                icon: const Icon(
                                                  Icons.send,
                                                  size: 20,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );

                              ///////////
                            },
                            itemCount: newsfeedController
                                .newsfeedmodel.data?.data!.length,
                          );
                        }))
          ],
        ),
      )),
    );
  }

  showToast(String message) {
    return Fluttertoast.showToast(msg: message);
  }

  void _refresh() {
    newsfeedController.getnewsfeed();
  }

  void _showModelSheet(BuildContext context, int pid) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: 30.0.h,
            width: 100.0.w,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Container(
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
                                Text(getLatestCommentsController.error.value),
                              ],
                            )
                          : getLatestCommentsController
                                  .commnetsModel.data!.isEmpty
                              ? const Center(child: Text("No Commnets Yet"))
                              : ListView.builder(
                                  itemCount: getLatestCommentsController
                                      .commnetsModel.data!.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 12.0.w,
                                                width: 12.0.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            300)),
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
                                                      color: Colors.grey[200],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                              style: AppTextStyles
                                                                  .appbar
                                                                  .copyWith(
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
                                                                        .data![
                                                                            index]
                                                                        .comment ??
                                                                    "",
                                                                maxLines: 4,
                                                                style:
                                                                    AppTextStyles
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
          );
        });
  }
}
