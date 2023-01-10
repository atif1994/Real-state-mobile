import 'package:flutter/material.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/constants/image_resources.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';

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
        title: Text("About U", style: AppTextStyles.appbar),
      ),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18.00),
        children: <Widget>[
          Column(children: [
            SizedBox(
              height: 3.0.h,
            ),
            const Text(
              'Our Story',
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 11, 11, 11)),
            ),
            SizedBox(
              height: 3.0.h,
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
            Image.asset(
              AppImageResources.abt,
              height: 45.0.h,
            ),
            const Text(
              'Our Mission & Work Process',
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'Rubik Medium',
                color: Color.fromARGB(255, 8, 8, 8),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            const Text(
              'Professional & Dedicated Team',
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Rubik Medium',
                  color: Color.fromARGB(255, 131, 130, 130)),
            ),
            SizedBox(
              height: 6.0.h,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: CustomDecorations.mainCon,
              child: Row(
                children: [
                  SizedBox(
                    width: 9.0.h,
                    // color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Image.asset(
                        AppImageResources.lock,
                        height: 3.5.h,
                        //width: 4.0.h,
                      ),
                      //image: AssetImage('assets/lock.png'),
                    ),
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
            SizedBox(
              height: 1.5.h,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: CustomDecorations.mainCon,
              child: Row(
                children: [
                  SizedBox(
                    width: 9.0.h,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 28),
                      child: Image.asset(
                        AppImageResources.twitter,
                        height: 3.0.h,
                      ),
                    ),
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
            SizedBox(
              height: 1.5.h,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: CustomDecorations.mainCon,
              child: Row(
                children: [
                  SizedBox(
                    width: 9.0.h,
                    child: Padding(
                        padding: const EdgeInsets.only(right: 28),
                        child: Image.asset(
                          AppImageResources.square,
                          height: 2.6.h,
                          width: 3.0.h,
                        )),
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
            SizedBox(
              height: 3.0.h,
            ),
            Image.asset(
              AppImageResources.team,
              height: 30.0.h,
              width: 35.0.h,
            ),
          ]),
        ],
      )),
    );
  }
}
