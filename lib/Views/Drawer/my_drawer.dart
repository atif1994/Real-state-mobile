import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Services/my_shared_preferences.dart';

import '../../Controllers/auth_controller.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Center(child: Text('Prologic 29', textScaleFactor: 1.5, style: TextStyle(fontWeight: FontWeight.bold),))),
          ListTile(title: const Text('About Us'), onTap: (){},),
          ListTile(title: const Text('Area Guides'), onTap: (){},),
          ListTile(title: const Text('Contact Us'), onTap: (){},),
          ListTile(title: const Text('Log out'), onTap: (){
            MySharedPreferences.clearData();
            Get.find<AuthController>().isUserSignedIn();
          },),
        ],
      ),
    );
  }
}
