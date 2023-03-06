// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/Notifications/notification_page.dart';
import 'package:rxdart/rxdart.dart';

class LocalNotificationsApi {
  // static final _notifications = FlutterLocalNotificationsPlugin();
  // static final onNotifications = BehaviorSubject<String?>();
  // static Future showNotifications(
  //         {int id = 0, String? title, String? body, String? payload}) async =>
  //     _notifications.show(id, title, body, await notificationDetails(),
  //         payload: payload);

  // static notificationDetails() async {
  //   return const NotificationDetails(
  //     android: AndroidNotificationDetails(
  //         'channel id', 'pushnotificationapp', 'channel description',
  //         importance: Importance.max),
  //     iOS: IOSNotificationDetails(),
  //   );
  // }

  // ///////////////////clicked on notification and goto specific page
  // static Future init({bool initScheduled = false}) async {
  //   const android = AndroidInitializationSettings('@mipmap/ic_launcher');
  //   const iOS = IOSInitializationSettings();
  //   const settings = InitializationSettings(android: android, iOS: iOS);
  //   await _notifications.initialize(settings,
  //       onSelectNotification: (payload) async {
  //     onNotifications.add(payload);
  //     Get.to(() => AllNotifications());
  //   });
  // }

  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@drawable/applogo"),
    );

    _notificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? id) async {
        print("onSelectNotification");
        if (id!.isNotEmpty) {
          print("Router Value1234 $id");

          Get.to(() => AllNotifications(
                payload: id,
              ));
        }

        print("#######################################id is $id");
      },
    );
  }

////////////////////////////////////////////////////
  static void createanddisplaynotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails('pushnotificationapp',
            'pushnotificationappchannel', 'channel description',
            importance: Importance.max),
        iOS: IOSNotificationDetails(),
      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
