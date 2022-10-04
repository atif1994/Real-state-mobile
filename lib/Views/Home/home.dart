import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/Home/Profile/profile.dart';
import 'package:prologic_29/Views/Home/search.dart';

import '../../Services/constants.dart';
import '../Drawer/my_drawer.dart';
import '../profile/profile_screen.dart';
import 'home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;
  final List<Widget> _selectedWidget = [
    const HomeScreen(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBody: true,
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(onPressed: (){
          scaffoldKey.currentState!.openDrawer();
        }, icon: const Icon(Icons.menu, color: Colors.white,)),
      //  actions: [
      //   IconButton(onPressed: (){
      //     Get.to(MyHomePage());
      //   }, icon: Icon(Icons.person,size: 30,))
      //  ],
      
      ),
      drawer:  MyDrawer(),
      body: _selectedWidget.elementAt(_selectedIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search, color: Colors.white),
        onPressed: (){
          Get.to(() => const Search());
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        elevation: 0,
        color: primaryColor.withAlpha(255),
        notchMargin: 10,
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.grey.withAlpha(0),
          onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, color: Colors.white, size: 20,),
                  label: 'Home',
                  activeIcon: Icon(Icons.home, color: Colors.white, size: 30),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined, color: Colors.white, size: 20,),
                label: 'Profile',
                activeIcon: Icon(Icons.person, color: Colors.white, size: 30),
              ),
            ],
        ),

      ),
    );
  }
}
