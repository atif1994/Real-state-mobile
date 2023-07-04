import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
  child: Padding(
    padding: EdgeInsets.only(top: 30.h),
    child: Column(
      children: [
        Image.asset(
          'assets/noresultfound.png',
          scale: 2.4,
        ),
        const Text('No Result Found')
      ],
    ),
  ),
);

Widget loader = const Center(
  child: CircularProgressIndicator(),
);

//////////////////////////    Tiny Widgets   /////////////////////////////////
ThemeData themeData = ThemeData.light();
