import 'package:flutter/material.dart';

import '../../../data/Services/constants.dart';
import '../Post/post_tile.dart';

class MyFavourites extends StatelessWidget {
  const MyFavourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favourites"),
      ),
      body: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: PostTile(
              index: index,
            ),
          );
        },
      ),
    );
  }
}
