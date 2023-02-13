// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:prologic_29/Views/Wishlist/favorites.dart';
// import 'package:prologic_29/utils/constants/appcolors.dart';
// import 'package:prologic_29/utils/styles/app_textstyles.dart';
// import 'package:prologic_29/utils/styles/custom_decorations.dart';
// import 'package:sizer/sizer.dart';

// // import 'AgentProfile/agent_settings.dart';

// class Profile_Page extends StatefulWidget {
//   const Profile_Page({super.key});

//   @override
//   State<Profile_Page> createState() => _Profile_PageState();
// }

// class _Profile_PageState extends State<Profile_Page> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.appthem,
//         title: const Center(
//           child: Text('Profile'),
//         ),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             height: 250,
//             decoration: const BoxDecoration(
//               color: AppColors.appthem,
//               // gradient: LinearGradient(
//               //   colors: [Colors.red, Colors.deepOrange.shade300],
//               //   begin: Alignment.centerLeft,
//               //   end: Alignment.centerRight,
//               //   stops: const [0.5, 0.9],
//               // ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: const [
//                     // CircleAvatar(
//                     //   backgroundColor: Colors.red.shade300,
//                     //   minRadius: 35.0,
//                     //   child: Icon(
//                     //     Icons.call,
//                     //     size: 30.0,
//                     //   ),
//                     // ),
//                     Expanded(
//                       flex: 2,
//                       child: CircleAvatar(
//                         backgroundColor: Colors.white70,
//                         minRadius: 66.0,
//                         child: CircleAvatar(
//                           radius: 64.0,
//                           backgroundImage: NetworkImage(
//                               'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     SizedBox(
//                       width: 34.0.w,
//                     ),
//                     Column(
//                       children: [
//                         Text('Ali Khan',
//                             style:
//                                 AppTextStyles.heading1.copyWith(fontSize: 30)),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           'Flutter Developer',
//                           style: AppTextStyles.heading1.copyWith(fontSize: 20),
//                         ),
//                       ],
//                     ),
//                     // SizedBox(
//                     //   width: 44.0.w,
//                     // ),
//                     // InkWell(
//                     //   onTap: () {
//                     //     Get.to(ProfileImageEdit());
//                     //   },
//                     //   child: const CircleAvatar(
//                     //     backgroundColor: Colors.white,
//                     //     minRadius: 23.0,
//                     //     child: Icon(
//                     //       Icons.edit,
//                     //       size: 23.0,
//                     //     ),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 2.5.h,
//           ),
//           SizedBox(
//             // height: 60.0.h,
//             // width: 200.0.w,
//             child: ListView(
//               children: [
//                 Container(
//                   height: 7.3.h,
//                   // width: 2.0.w,
//                   decoration: CustomDecorations.mainCon.copyWith(
//                     color: AppColors.colorWhite,
//                   ),
//                   child: ListTile(
//                     onTap: (() {
//                       Get.to(WishlistPage());
//                     }),
//                     leading: const Icon(Icons.settings),
//                     title: Text(
//                       'Settings',
//                       style: AppTextStyles.heading1.copyWith(
//                         color: AppColors.colorblack,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 1.9.h,
//                 ),
//                 Container(
//                   height: 7.3.h,
//                   decoration: CustomDecorations.mainCon.copyWith(
//                     color: AppColors.colorWhite,
//                   ),
//                   child: ListTile(
//                     onTap: (() {
//                       Get.to(WishlistPage());
//                     }),
//                     leading: const Icon(Icons.propane_rounded),
//                     title: Text(
//                       'Properties',
//                       style: AppTextStyles.heading1.copyWith(
//                         color: AppColors.colorblack,
//                         fontSize: 21,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 1.3.h,
//                 ),
//                 Container(
//                   height: 7.0.h,
//                   decoration: CustomDecorations.mainCon.copyWith(
//                     color: AppColors.colorWhite,
//                   ),
//                   child: ListTile(
//                     onTap: (() {
//                       Get.to(WishlistPage());
//                     }),
//                     leading: const Icon(Icons.mark_chat_read),
//                     title: Text(
//                       'Add Property',
//                       style: AppTextStyles.heading1.copyWith(
//                         color: AppColors.colorblack,
//                         fontSize: 21,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 1.9.h,
//                 ),
//                 Container(
//                   height: 7.3.h,
//                   decoration: CustomDecorations.mainCon.copyWith(
//                     color: AppColors.colorWhite,
//                   ),
//                   child: ListTile(
//                     onTap: (() {
//                       Get.to(WishlistPage());
//                     }),
//                     leading: const Icon(Icons.lock),
//                     title: Text(
//                       'Security',
//                       style: AppTextStyles.heading1.copyWith(
//                         color: AppColors.colorblack,
//                         fontSize: 21,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 1.9.h,
//                 ),
//                 Container(
//                   height: 7.3.h,
//                   decoration: CustomDecorations.mainCon.copyWith(
//                     color: AppColors.colorWhite,
//                   ),
//                   child: ListTile(
//                     onTap: (() {
//                       Get.to(WishlistPage());
//                     }),
//                     leading: const Icon(Icons.chat),
//                     title: Text(
//                       'Chat',
//                       style: AppTextStyles.heading1.copyWith(
//                         color: AppColors.colorblack,
//                         fontSize: 21,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 1.9.h,
//                 ),
//                 Container(
//                   height: 7.3.h,
//                   decoration: CustomDecorations.mainCon.copyWith(
//                     color: AppColors.colorWhite,
//                   ),
//                   child: ListTile(
//                     onTap: (() {
//                       Get.to(WishlistPage());
//                     }),
//                     leading: const Icon(Icons.logout_outlined),
//                     title: Text(
//                       'Logout',
//                       style: AppTextStyles.heading1.copyWith(
//                         color: AppColors.colorblack,
//                         fontSize: 21,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 1.9.h,
//                 ),
//                 Container(
//                   height: 7.3.h,
//                   decoration: CustomDecorations.mainCon.copyWith(
//                     color: AppColors.colorWhite,
//                   ),
//                   child: ListTile(
//                     onTap: (() {
//                       Get.to(WishlistPage());
//                     }),
//                     leading: const Icon(Icons.logout_outlined),
//                     title: Text(
//                       'jsxnn',
//                       style: AppTextStyles.heading1.copyWith(
//                         color: AppColors.colorblack,
//                         fontSize: 21,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 1.9.h,
//                 ),
//               ],
//             ),
//           )
//           // Container(
//           //   child: Column(
//           //     children: <Widget>[
//           //       Container(
//           //         decoration: CustomDecorations.con2,
//           //         child: const ListTile(
//           //           title: Text(
//           //             'Name',
//           //             style: TextStyle(
//           //               color: AppColors.colorblack,
//           //               fontSize: 20,
//           //               fontWeight: FontWeight.bold,
//           //             ),
//           //           ),
//           //           subtitle: Text(
//           //             'Ali Khan',
//           //             style: TextStyle(
//           //               fontSize: 18,
//           //             ),
//           //           ),
//           //         ),
//           //       ),
//           //       const Divider(),
//           //       const ListTile(
//           //         title: Text(
//           //           'Email',
//           //           style: TextStyle(
//           //             color: Colors.deepOrange,
//           //             fontSize: 20,
//           //             fontWeight: FontWeight.bold,
//           //           ),
//           //         ),
//           //         subtitle: Text(
//           //           'ali@gmail.com',
//           //           style: TextStyle(
//           //             fontSize: 18,
//           //           ),
//           //         ),
//           //       ),
//           //       const Divider(),
//           //       const ListTile(
//           //         title: Text(
//           //           'GitHub',
//           //           style: TextStyle(
//           //             color: Colors.deepOrange,
//           //             fontSize: 20,
//           //             fontWeight: FontWeight.bold,
//           //           ),
//           //         ),
//           //         subtitle: Text(
//           //           'https://github.com/alikhan',
//           //           style: TextStyle(
//           //             fontSize: 18,
//           //           ),
//           //         ),
//           //       ),
//           //       const Divider(),
//           //       const ListTile(
//           //         title: Text(
//           //           'Linkedin',
//           //           style: TextStyle(
//           //             color: Colors.deepOrange,
//           //             fontSize: 20,
//           //             fontWeight: FontWeight.bold,
//           //           ),
//           //         ),
//           //         subtitle: Text(
//           //           'www.linkedin.com/in/ali-khan-834a1755',
//           //           style: TextStyle(
//           //             fontSize: 18,
//           //           ),
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }
