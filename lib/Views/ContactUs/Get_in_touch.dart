import 'package:flutter/material.dart';

import '../../utils/styles/custom_decorations.dart';

class Getintouch extends StatelessWidget {
  const Getintouch({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10),
          decoration: CustomDecorations.mainCon,
          child: Row(
            children: [
              const SizedBox(
                width: 70,
                // color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.only(right: 18),
                  child: Image(
                    image: AssetImage('assets/icons/phone.png'),
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
                  Text(
                    textAlign: TextAlign.justify,
                    '051-8578988',
                    //  style:AppTextStyles.heading1 ,
                  ),

                  // ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
