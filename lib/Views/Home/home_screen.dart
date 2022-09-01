import 'package:flutter/material.dart';
import 'package:prologic_29/Services/constants.dart';
import 'package:prologic_29/Views/Home/post_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index){
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: PostTile(),
        );
      },
    );
  }
}
