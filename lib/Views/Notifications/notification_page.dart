import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusher_client/pusher_client.dart';
//import 'package:prologic_29/data/Controllers/Notification/Notification_Controller.dart';
import 'package:sizer/sizer.dart';

import '../../data/Controllers/Notification_Controller/Notification_Controller.dart';
import '../../data/Models/Notification_Model/notification_model.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/styles/app_textstyles.dart';
import '../../utils/styles/custom_decorations.dart';

class AllNotifications extends StatefulWidget {
  String? payload;
  AllNotifications({super.key, this.payload});

  @override
  State<AllNotifications> createState() => _AllNotificationsState();
}

class _AllNotificationsState extends State<AllNotifications> {
  final notificationsController = Get.put(Notificationcontroller());
  late PusherClient pusher;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initiatePusherSocketForMessaging();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appthem,
          centerTitle: true,
          title: Text("Notifications", style: AppTextStyles.heading1),
        ),
        body: Obx(() => notificationsController.loadingNotification.value
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.appthem,
              ))
            : notificationsController.errorLoadingnotification.value != ''
                ? Column(
                    children: [
                      IconButton(
                          onPressed: (() {
                            //  notificationsController.getNotifications();
                          }),
                          icon: const Icon(Icons.refresh)),
                      Text(notificationsController
                          .errorLoadingnotification.value),
                    ],
                  )
                : notificationsController.notificationModel.data!.length == 0
                    ? Center(
                        child: Text(
                        "No Notifications Found",
                        style: AppTextStyles.appbar
                            .copyWith(color: AppColors.colorblack),
                      ))
                    : ListView.builder(
                        itemCount: notificationsController
                            .notificationModel.data?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 3.0.w,
                                right: 3.0.w,
                                top: index == 0 ? 2.0.h : 2.0.h,
                                bottom: index ==
                                        notificationsController
                                                .notificationModel
                                                .data!
                                                .length -
                                            1
                                    ? 2.0.h
                                    : 0.0.h),
                            height: 9.0.h,
                            width: 100.0.w,
                            decoration: CustomDecorations.mainCon,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 3.0.w, right: 3.0.w),
                                  child: Text(
                                    notificationsController
                                        .notificationModel.data![index]!.id
                                        .toString(),
                                    style: AppTextStyles.appbar.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 3.0.w, right: 3.0.w),
                                  child: Text(
                                    notificationsController.notificationModel
                                        .data![index]!.description
                                        .toString(),
                                    style: AppTextStyles.labelSmall,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // SizedBox(
                                //   height: 1.0.h,
                                // ),
                                // Padding(
                                //   padding:
                                //       EdgeInsets.only(left: 3.0.w, right: 3.0.w),
                                //   child: Text(
                                //     notificationsController
                                //         .notificationModel.data![index]!.type
                                //         .toString(),
                                //     style: AppTextStyles.labelSmall,
                                //     maxLines: 3,
                                //   ),
                                // ),
                              ],
                            ),
                          );
                        })));
  }

  ///////////////////////////////////////////////

  ////////////////////////////pusher

  Future<void> _initiatePusherSocketForMessaging() async {
    pusher = PusherClient(
        '4b70cc9598b80dcadac2',
        PusherOptions(
          host: 'http://realestate.tecrux.net',
          cluster: 'ap2',
          auth: PusherAuth(
            'http://realestate.tecrux.net/api/broadcasting/auth',
          ),
        ),
        autoConnect: false);

    pusher.connect();

    pusher.onConnectionStateChange((state) {
      print(
          "previousState: ${state!.previousState}, currentState: ${state.currentState}");
    });

    pusher.onConnectionError((error) {
      print("error: ${error!.message}");
    });

    Channel channel = pusher.subscribe(
        'private-message_' + notificationsController.userid.toString());

    channel.bind('App\\Events\\NotificaationSent', (PusherEvent? event) {
      // print('event data: ' + event!.data.toString());

      final data = json.decode(event!.data.toString());

      setState(() {
        notificationsController.notificationModel.message = data['message'];
        notificationsController.notificationModel.data!.add(Datum(
            recieverId: notificationsController.userid.toString(),
            description: data['description']));
      });
    });
  }
}
