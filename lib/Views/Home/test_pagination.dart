import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/data/Controllers/property_controllers/featured_property_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../../data/Controllers/NewsFeed_Controller/newsfeed_controller.dart';
import '../../data/Controllers/more_places_controller/more_places_cont.dart';
import '../../utils/constants/app_urls.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/constants/fonts.dart';
import '../../utils/constants/image_resources.dart';
import '../../utils/styles/app_textstyles.dart';
import '../../utils/styles/custom_decorations.dart';
import '../Property_by_id/property_by_id.dart';

class Pagination extends StatefulWidget {
  Pagination({super.key});

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  final morePlacesController = Get.put(MorePlacesController());
  final controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    morePlacesController.getnewsfeed();

    controller.addListener(() {
      if (controller.position.pixels >=
          controller.position.maxScrollExtent * 0.95) {
        if (morePlacesController.hasMore) {
          morePlacesController.getnewsfeed();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.colorblue,
        appBar: AppBar(),
        body: Obx(() {
          return morePlacesController.newsfeedApiLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColors.appthem,
                ))
              : morePlacesController.errorLoadingnewsfeed.value != ''
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                morePlacesController.getnewsfeed();
                              },
                              icon: const Icon(
                                Icons.refresh,
                                color: AppColors.appthem,
                              )),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(morePlacesController.errorLoadingnewsfeed.value),
                        ],
                      ),
                    )
                  : morePlacesController.newsfeedmodel.data?.length == 0
                      ? Text("No data found")
                      : ListView.builder(
                          controller: controller,
                          itemCount:
                              morePlacesController.newsfeedmodel.data!.length +
                                  (morePlacesController.hasMore ? 1 : 0),
                          itemBuilder: ((context, index) {
                            if (index ==
                                morePlacesController
                                    .newsfeedmodel.data!.length) {
                              Center(
                                  child: CircularProgressIndicator(
                                color: AppColors.appthem,
                              ));
                            }

                            return Container(
                              margin: EdgeInsets.all(15),
                              height: 40.0..h,
                              width: 100.0.w,
                              color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(morePlacesController
                                    .newsfeedmodel.data![index].id
                                    .toString()),
                              ),
                            );
                          }));
        }));
  }
}
