import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:prologic_29/utils/styles/app_textstyles.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed '),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 2.0.h,
          ),

          // ListView.builder(itemBuilder: itemBuilder)

          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: 100,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                elevation: 6,
                shadowColor: Colors.black,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 25.0.h,
                          // width: 148,
                          color: Colors.red,
                          // ignore: prefer_const_constructors
                          child: Image(
                            // ignore: prefer_const_constructors
                            image: NetworkImage(
                                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 2.0.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '   New Properties',
                                    style: AppTextStyles.heading1.copyWith(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                  Text(
                                    'PKR 16000',
                                    style: AppTextStyles.labelSmall.copyWith(
                                        fontSize: 18, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                            // Container(
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => const AboutUs()),
                            //       );
                            //       //Navigator.of(context).pop();
                            //     },
                            //     child: Padding(
                            //       padding: const EdgeInsets.all(8.0),
                            //       child: Container(
                            //         decoration: const BoxDecoration(
                            //           // border: Border.all(color: Colors.blue, width: 4),
                            //           color: Color.fromARGB(255, 222, 235, 207),
                            //           shape: BoxShape.circle,
                            //         ),
                            //         child: const Padding(
                            //           padding: EdgeInsets.all(10.0),
                            //           child: Icon(
                            //             Icons.arrow_right,
                            //             size: 30.0,
                            //             color: Colors.black,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                          // children: [
                          //   Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Text(
                          //         'Rawalpindi',
                          //         style: AppTextStyles.heading1.copyWith(
                          //             fontSize: 18, color: Colors.black),
                          //       ),
                          //       Text(
                          //         '13 Properties',
                          //         style: AppTextStyles.labelSmall.copyWith(
                          //             fontSize: 18, color: Colors.black54),
                          //       ),
                          //     ],
                          //   ),
                          // ],
                        ),
                      ],
                    )
                  ],
                ),
                //
              );
            },
          )
        ],
      )),
    );
  }
}
