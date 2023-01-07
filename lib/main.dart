import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:prologic_29/Views/Auth/auth.dart';
import 'package:prologic_29/data/Services/app_bindings.dart';
import 'package:prologic_29/data/Services/constants.dart';
import 'package:sizer/sizer.dart';

void main() {
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
            primarySwatch: primaryColor,
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
        home:
            //Profile_Page()
            // const NewsFeed(),
            const Auth(),
        //MyHomePage(),
      );
    });
    /////////////////////////
  }
}
