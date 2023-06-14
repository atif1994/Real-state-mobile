import 'package:flutter/material.dart';

import '../../utils/styles/app_textstyles.dart';

//////////////////////////    Assets Strings   /////////////////////////////////
const String _baseAssetDirectory = 'assets/';
const String bgImage = '${_baseAssetDirectory}bg.png';
const String facebookIcon = '${_baseAssetDirectory}fb_icon.png';
const String googleIcon = '${_baseAssetDirectory}google_icon.png';

//////////////////////////    Colors   /////////////////////////////////
MaterialColor primaryColor = Colors.grey;

//////////////////////////    Values   /////////////////////////////////
const double horizontalPadding = 15;

//////////////////////////    Tiny Widgets   /////////////////////////////////
Widget myDivider() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Divider(thickness: 2, color: Colors.grey[200]),
  );
}

Widget nopostexist = Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('assets/noresultfound.png', scale: 2),
      Text(
        'No Result Found',
        style:
            AppTextStyles.heading1.copyWith(color: Colors.black, fontSize: 15),
      )
    ],
  ),
);

Widget loader = const Center(
  child: CircularProgressIndicator(),
);

//////////////////////////    Tiny Widgets   /////////////////////////////////
ThemeData themeData = ThemeData.light();
