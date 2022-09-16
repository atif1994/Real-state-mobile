import 'package:flutter/material.dart';

import '../../../Services/constants.dart';
import '../Post/post_tile.dart';

class MySavedSearches extends StatelessWidget {
  const MySavedSearches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Saved Searches"),
      ),
      body: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: PostTile(index: index,),
          );
        },
      ),
    );
  }
}
