import 'package:flutter/material.dart';
import 'package:prologic_29/Services/constants.dart';
import 'package:prologic_29/Views/Home/Post/post_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: PostTile(index: index,),
        );
      },
    );
  }
}
