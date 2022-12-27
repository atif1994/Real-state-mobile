import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 18.00),
        children: <Widget>[
          Column(children: [
            SizedBox(
              height: 28,
            ),
            Text(
              'Our Story',
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 11, 11, 11)),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              textAlign: TextAlign.justify,
              'ProLogic 29 is a digital platform designed to help you with all your real estate worries! We pledge to make real estate experiences more accessible to everyone – whether they need to buy, sell, or rent properties, products, projects, or services! With ProLogic 29, you don’t have to worry about finding the right place, again!',
              style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  height: 1.5,
                  fontFamily: 'Rubik Medium',
                  color: Color.fromARGB(255, 131, 130, 130)),
            ),
            SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/abt.png',
              height: 340,
              width: 340,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Our Mission & Work Process',
              style: TextStyle(
                fontSize: 19,
                fontFamily: 'Rubik Medium',
                color: Color.fromARGB(255, 8, 8, 8),
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Professional & Dedicated Team',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Rubik Medium',
                  color: Color.fromARGB(255, 131, 130, 130)),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                //BorderRadius.only
                /************************************/
                /* The BoxShadow widget  is here */
                /************************************/
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 161, 158, 158),
                    offset: const Offset(
                      6.0,
                      6.0,
                    ),
                    blurRadius: 8.0,
                    spreadRadius: 1.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    // color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: const Image(
                        image: AssetImage('assets/lock.png'),
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                  Expanded(
                    child: Column(children: [
                      // Expanded(
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          textAlign: TextAlign.justify,
                          'Fully Secure & 24x7 Dedicated Support',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Rubik Medium',
                              color: Color.fromARGB(255, 14, 14, 15)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Text(
                          'If you are an individual client, or just a business startup looking for good backlinks for your website.',
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Rubik Medium',
                              color: Color.fromARGB(255, 131, 130, 130)),
                        ),
                      )
                      // ),
                    ]),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                //BorderRadius.only
                /************************************/
                /* The BoxShadow widget  is here */
                /************************************/
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 161, 158, 158),
                    offset: const Offset(
                      6.0,
                      6.0,
                    ),
                    blurRadius: 8.0,
                    spreadRadius: 1.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: const Image(
                        image: AssetImage('assets/twitter.png'),
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                  Expanded(
                    child: Column(children: [
                      // Expanded(
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Text(
                          'Manage Your Social & Business Account Carefully',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Rubik Medium',
                              color: Color.fromARGB(255, 14, 14, 15)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Text(
                          'If you are an individual client, or just a business startup looking for good backlinks for your website.',
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Rubik Medium',
                              color: Color.fromARGB(255, 131, 130, 130)),
                        ),
                      )
                      // ),
                    ]),
                  )
                ],
              ),
            ),
            // Container(
            //   height: 103,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(5.0),
            //     //BorderRadius.only
            //     /************************************/
            //     /* The BoxShadow widget  is here */
            //     /************************************/
            //     boxShadow: [
            //       BoxShadow(
            //         color: Color.fromARGB(255, 161, 158, 158),
            //         offset: const Offset(
            //           6.0,
            //           6.0,
            //         ),
            //         blurRadius: 8.0,
            //         spreadRadius: 1.0,
            //       ), //BoxShadow
            //       BoxShadow(
            //         color: Colors.white,
            //         offset: const Offset(0.0, 0.0),
            //         blurRadius: 0.0,
            //         spreadRadius: 0.0,
            //       ), //BoxShadow
            //     ],
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     // ignore: prefer_const_literals_to_create_immutables
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(left: 2),
            //         child: const Image(
            //           image: AssetImage('assets/lock.png'),
            //           height: 40,
            //           width: 40,
            //         ),
            //       ),

            //       const SizedBox(
            //         width: 0,
            //       ),

            //       Padding(
            //         padding: const EdgeInsets.only(top: 8, bottom: 5, left: 17),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           // ignore: prefer_const_literals_to_create_immutables
            //           children: [
            //             const Text(
            //               textAlign: TextAlign.justify,
            //               'Fully Secure & 24x7 Dedicated \nSupport',
            //               style: TextStyle(
            //                   fontSize: 13,
            //                   fontWeight: FontWeight.w500,
            //                   fontFamily: 'Rubik Medium',
            //                   color: Color.fromARGB(255, 14, 14, 15)),
            //             ),
            //             const Text(
            //               'If you are an individual client, or just a \nbusiness startup looking for good backlinks \nfor your website.',
            //               style: TextStyle(
            //                   fontSize: 11,
            //                   fontFamily: 'Rubik Medium',
            //                   color: Color.fromARGB(255, 8, 8, 8)),
            //             ),
            //           ],
            //         ),
            //       ),
            //       // ignore: prefer_const_constructors
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Container(
            //   height: 103,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(5.0),
            //     //BorderRadius.only
            //     /************************************/
            //     /* The BoxShadow widget  is here */
            //     /************************************/
            //     boxShadow: [
            //       BoxShadow(
            //         color: Color.fromARGB(255, 161, 158, 158),
            //         offset: const Offset(
            //           6.0,
            //           6.0,
            //         ),
            //         blurRadius: 8.0,
            //         spreadRadius: 1.0,
            //       ), //BoxShadow
            //       BoxShadow(
            //         color: Colors.white,
            //         offset: const Offset(0.0, 0.0),
            //         blurRadius: 0.0,
            //         spreadRadius: 0.0,
            //       ), //BoxShadow
            //     ],
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     // ignore: prefer_const_literals_to_create_immutables
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(left: 12),
            //         child: const Image(
            //           image: AssetImage('assets/twitter.png'),
            //           height: 40,
            //           width: 40,
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 10,
            //       ),

            //       Padding(
            //         padding: const EdgeInsets.only(top: 8, bottom: 5, left: 7),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           // ignore: prefer_const_literals_to_create_immutables
            //           children: [
            //             const Text(
            //               textAlign: TextAlign.justify,
            //               'Manage your Social & Business \nAccount Carefully',
            //               style: TextStyle(
            //                   fontSize: 13,
            //                   fontWeight: FontWeight.w500,
            //                   fontFamily: 'Rubik Medium',
            //                   color: Color.fromARGB(255, 17, 17, 18)),
            //             ),
            //             const Text(
            //               textAlign: TextAlign.justify,
            //               'If you are an individual client, or just a \nbusiness startup looking for good backlinks \nfor your website.',
            //               style: TextStyle(
            //                   fontSize: 11,
            //                   fontFamily: 'Rubik Medium',
            //                   color: Color.fromARGB(255, 9, 9, 9)),
            //             ),
            //           ],
            //         ),
            //       ),
            //       // ignore: prefer_const_constructors
            //     ],
            //   ),
            // ),
            // // Container(
            // //
            // SizedBox(
            //   height: 15,
            // ),
            // Container(
            //   height: 103,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(5.0),
            //     //BorderRadius.only
            //     /************************************/
            //     /* The BoxShadow widget  is here */
            //     /************************************/
            //     boxShadow: [
            //       BoxShadow(
            //         color: Color.fromARGB(255, 161, 158, 158),
            //         offset: const Offset(
            //           6.0,
            //           6.0,
            //         ),
            //         blurRadius: 8.0,
            //         spreadRadius: 1.0,
            //       ), //BoxShadow
            //       BoxShadow(
            //         color: Colors.white,
            //         offset: const Offset(0.0, 0.0),
            //         blurRadius: 0.0,
            //         spreadRadius: 0.0,
            //       ), //BoxShadow
            //     ],
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     // ignore: prefer_const_literals_to_create_immutables
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(left: 8),
            //         child: Image(
            //           image: AssetImage('assets/square.png'),
            //           height: 40,
            //           width: 40,
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 10,
            //       ),

            //       Padding(
            //         padding: const EdgeInsets.only(top: 8, bottom: 5, left: 10),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           // ignore: prefer_const_literals_to_create_immutables
            //           children: [
            //             const Text(
            //               'We Are Very Hard Worker And \nLoving',
            //               style: TextStyle(
            //                   fontSize: 13,
            //                   fontWeight: FontWeight.w500,
            //                   fontFamily: 'Rubik Medium',
            //                   color: Color.fromARGB(255, 14, 14, 15)),
            //             ),
            //             const Text(
            //               'If you are an individual client, or just a \nbusiness startup looking for good backlinks \nfor your website.',
            //               style: TextStyle(
            //                   fontSize: 11,
            //                   fontFamily: 'Rubik Medium',
            //                   color: Color.fromARGB(255, 8, 8, 8)),
            //             ),
            //           ],
            //         ),
            //       ),
            //       // ignore: prefer_const_constructors
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                //BorderRadius.only
                /************************************/
                /* The BoxShadow widget  is here */
                /************************************/
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 161, 158, 158),
                    offset: const Offset(
                      6.0,
                      6.0,
                    ),
                    blurRadius: 8.0,
                    spreadRadius: 1.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: const Image(
                        image: AssetImage('assets/square.png'),
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                  Expanded(
                    child: Column(children: [
                      // Expanded(
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          textAlign: TextAlign.justify,
                          'We are Very Hard Worker And Loving',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Rubik Medium',
                              color: Color.fromARGB(255, 14, 14, 15)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Text(
                          'If you are an individual client, or just a business startup looking for good backlinks for your website.',
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Rubik Medium',
                              color: Color.fromARGB(255, 131, 130, 130)),
                        ),
                      )
                      // ),
                    ]),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/team.png',
              height: 320,
              width: 320,
            ),
          ]),
        ],
      )),
    );
  }
}
