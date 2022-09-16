import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/Home/Profile/my_saved_searches.dart';
import 'package:prologic_29/Views/Home/Profile/profile_settings.dart';

import 'my_drafts.dart';
import 'my_favourites.dart';
import 'Properties/my_properties.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  bool darkMode = false;
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('Profile Settings'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: (){
            Get.to(const ProfileSettings());
          },
        ),
        ListTile(
          leading: const Icon(Icons.search_outlined),
          title: const Text('My Saved Searches'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: (){
            Get.to(const MySavedSearches());
          },
        ),
        ListTile(
          leading: const Icon(Icons.favorite_outline),
          title: const Text('My Favourites'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: (){
            Get.to(const MyFavourites());
          },
        ),
        ListTile(
          leading: const Icon(Icons.apartment_outlined),
          title: const Text('My Properties'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: (){
            Get.to(const MyProperties());
          },
        ),
        ListTile(
          leading: const Icon(Icons.drafts_outlined),
          title: const Text('Drafts'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: (){
            Get.to(const MyDrafts());
          },
        ),
        ListTile(
          leading: const Icon(Icons.language_outlined),
          title: const Text('Language'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: (){},
        ),
        // ListTile(
        //   leading: const Icon(Icons.dark_mode_outlined),
        //   title: const Text('Dark Mode'),
        //   trailing: Switch(
        //       value: darkMode, onChanged: (v){
        //         setState(() {
        //           darkMode = v;
        //         });
        //         if(darkMode){
        //           Get.changeTheme(ThemeData.dark());
        //         }else{
        //           Get.changeTheme(ThemeData.light());
        //         }
        //   }
        //   ),
        // ),
        ListTile(
          leading: const Icon(Icons.phone_outlined),
          title: const Text('Contact Us'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: (){},
        ),
        ListTile(
          leading: const Icon(Icons.feedback_outlined),
          title: const Text('Feedbacks'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: (){},
        ),
        ListTile(
          leading: const Icon(Icons.privacy_tip_outlined),
          title: const Text('Terms & Privacy Policy'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: (){},
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app_outlined, color: Colors.red,),
          title: const Text('Log Out', style: TextStyle(color: Colors.red,)),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.red,),
          onTap: (){
            Get.back();
            Get.back();
          },
        ),
      ],
    );
  }
}
