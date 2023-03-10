// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prologic_29/data/Services/app_bindings.dart';
import 'package:prologic_29/data/Services/local_notifications_service.dart';
import 'package:sizer/sizer.dart';
import 'Views/Auth/sign_in.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox('likelist');
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationsApi.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prologic 29',
        initialBinding: AppBindings(),
        theme: ThemeData(
            primarySwatch: Colors.grey,
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
        home: SignIn(),
      );
    });
    /////////////////////////
  }
}
