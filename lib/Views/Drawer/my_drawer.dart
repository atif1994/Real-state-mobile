import 'package:flutter/material.dart';

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
        ],
      ),
    );
  }
}
