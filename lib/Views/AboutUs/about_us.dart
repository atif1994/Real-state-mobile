import 'package:flutter/material.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';

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
        backgroundColor: AppColors.appthem,
        title: Text("About Us", style: AppTextStyles.heading1),
      ),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18.00),
        children: <Widget>[
          Column(children: [
            const SizedBox(
              height: 28,
            ),
            const Text(
              'Our Story',
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 11, 11, 11)),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              textAlign: TextAlign.justify,
              'ProLogic 29 is a digital platform designed to help you with all your real estate worries! We pledge to make real estate experiences more accessible to everyone – whether they need to buy, sell, or rent properties, products, projects, or services! With ProLogic 29, you don’t have to worry about finding the right place, again!',
              style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  height: 1.5,
                  fontFamily: 'Rubik Medium',
                  color: Color.fromARGB(255, 131, 130, 130)),
            ),
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/abt.png',
              height: 340,
              width: 340,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Our Mission & Work Process',
              style: TextStyle(
                fontSize: 19,
                fontFamily: 'Rubik Medium',
                color: Color.fromARGB(255, 8, 8, 8),
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'Professional & Dedicated Team',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Rubik Medium',
                  color: Color.fromARGB(255, 131, 130, 130)),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                //BorderRadius.only
                /************************************/
                /* The BoxShadow widget  is here */
                /************************************/
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 161, 158, 158),
                    offset: Offset(
                      6.0,
                      6.0,
                    ),
                    blurRadius: 8.0,
                    spreadRadius: 1.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 70,
                    // color: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.only(right: 18),
                      child: Image(
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
                    child: Column(children: const [
                      // Expanded(
                      Padding(
                        padding: EdgeInsets.only(right: 10),
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
                        padding: EdgeInsets.only(top: 8.0, bottom: 8),
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
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(5.0),
              //   //BorderRadius.only
              //   /************************************/
              //   /* The BoxShadow widget  is here */
              //   /************************************/
              //   boxShadow: const [
              //     BoxShadow(
              //       color: Color.fromARGB(255, 161, 158, 158),
              //       offset: Offset(
              //         6.0,
              //         6.0,
              //       ),
              //       blurRadius: 8.0,
              //       spreadRadius: 1.0,
              //     ), //BoxShadow
              //     BoxShadow(
              //       color: Colors.white,
              //       offset: Offset(0.0, 0.0),
              //       blurRadius: 0.0,
              //       spreadRadius: 0.0,
              //     ), //BoxShadow
              //   ],
              // ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 70,
                    child: Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Image(
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
                    child: Column(children: const [
                      // Expanded(
                      Padding(
                        padding: EdgeInsets.only(),
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
                        padding: EdgeInsets.only(top: 8.0, bottom: 8),
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
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                //BorderRadius.only
                /************************************/
                /* The BoxShadow widget  is here */
                /************************************/
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 161, 158, 158),
                    offset: Offset(
                      6.0,
                      6.0,
                    ),
                    blurRadius: 8.0,
                    spreadRadius: 1.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 70,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Image(
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
                    child: Column(children: const [
                      // Expanded(
                      Padding(
                        padding: EdgeInsets.only(right: 10),
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
                        padding: EdgeInsets.only(top: 8.0, bottom: 8),
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
            const SizedBox(
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
