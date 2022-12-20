import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Services/app_bindings.dart';
import 'Services/constants.dart';
import 'Views/Auth/auth.dart';
import 'Views/profile/profile_page.dart';
import 'Views/profile/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Auth()
        //MyHomePage(),
        );
  }
}
