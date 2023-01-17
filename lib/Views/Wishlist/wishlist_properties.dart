import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/appcolors.dart';

class WishlistProperties extends StatelessWidget {
  WishlistProperties({super.key});
  int iWantTo = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
        ),
        body: const SafeArea(
            child: SingleChildScrollView(
                // child: Column(
                //   children: [
                //     Row(
                //       children: [
                //         const Icon(Icons.currency_exchange),
                //         const Expanded(
                //             child: Padding(
                //           padding:
                //               EdgeInsets.symmetric(horizontal:5),
                //           child: Text('I want to',
                //               style: TextStyle(fontWeight: FontWeight.bold)),
                //         )),
                //         CupertinoSlidingSegmentedControl<int>(
                //             groupValue: iWantTo,
                //             padding: const EdgeInsets.all(5),
                //             //thumbColor: primaryColor,
                //             thumbColor: AppColors.appthem,
                //             children: {
                //               0: Text('Sell',
                //                   style: TextStyle(
                //                     color: iWantTo == 0
                //                         ? AppColors.colorWhite
                //                         : AppColors.appthem,
                //                   )),
                //               1: Text('Rent',
                //                   style: TextStyle(
                //                     color: iWantTo == 1
                //                         ? AppColors.colorWhite
                //                         : AppColors.appthem,
                //                   )),
                //             },
                //             onValueChanged: (v) {
                //               setState(() {
                //                 iWantTo = v!;
                //               });
                //             }),
                //       ],
                //     ),
                //   ],
                // ),
                )),
      ),
    );
  }
}
