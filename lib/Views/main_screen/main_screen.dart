// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
// import 'package:prologic_29/Views/Home/home.dart';
// import 'package:prologic_29/data/Models/signin_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../custom_widgets/drawer_widget.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   final LoginModel _loginModel = LoginModel();
//   int? cid;

//   String? cityName;

//   String fname = '';

//   String lname = '';

//   String email = '';
//   String img = '';

//   void getCityInfo() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();

//     setState(() {
//       cid = pref.getInt("cityId");
//       cityName = pref.getString("cityName");

//       fname = pref.getString("fname") ?? "";
//       lname = pref.getString("lname") ?? "";
//       email = pref.getString("email") ?? "";
//       img = pref.getString("img") ?? "";

//       print(img);
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getCityInfo();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ZoomDrawer(
//       mainScreen: const Home(),
//       menuScreen: CustomDrawer(
//         fname: fname,
//         lname: lname,
//         email: email,
//         loginBaseImage: img,
//       ),
//       //   style: DrawerStyle.style2,
//     );
//   }
// }
