import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:prologic_29/Views/profile/profile_screen.dart';
class Profile_Page extends StatefulWidget {
  const Profile_Page({super.key});

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Center(
            child: Text('Profile'),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.deepOrange.shade300],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: const [0.5, 0.9],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:  <Widget>[
                      // CircleAvatar(
                      //   backgroundColor: Colors.red.shade300,
                      //   minRadius: 35.0,
                      //   child: Icon(
                      //     Icons.call,
                      //     size: 30.0,
                      //   ),
                      // ),
                      const CircleAvatar(
                        backgroundColor: Colors.white70,
                        minRadius: 60.0,
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              NetworkImage('https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(ProfileImageEdit());
                        },
                        child: const CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 211, 78, 78),
                          minRadius: 35.0,
                          child: Icon(
                            Icons.edit,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Ali Khan',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Flutter Developer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   child: Row(
            //     children: <Widget>[
            //       Expanded(
            //         child: Container(
            //           color: Colors.deepOrange.shade300,
            //           child: ListTile(
            //             title: Text(
            //               '5000',
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 30,
            //                 color: Colors.white,
            //               ),
            //             ),
            //             subtitle: Text(
            //               'Followers',
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 fontSize: 20,
            //                 color: Colors.white70,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         child: Container(
            //           color: Colors.red,
            //           child: ListTile(
            //             title: Text(
            //               '5000',
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 30,
            //                 color: Colors.white,
            //               ),
            //             ),
            //             subtitle: Text(
            //               'Following',
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 fontSize: 20,
            //                 color: Colors.white70,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
           // ),
            Container(
              child: Column(
                children: const <Widget>[
                  ListTile(
                    title: Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Ali Khan',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'ali@gmail.com',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'GitHub',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'https://github.com/alikhan',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Linkedin',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'www.linkedin.com/in/ali-khan-834a1755',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  
  }
}
  