import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/Home/Profile/Properties/add_property.dart';
import '../../../../data/Services/constants.dart';
import '../../Post/post_tile.dart';

class MyProperties extends StatelessWidget {
  const MyProperties({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Properties"),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const AddProperty());
              },
              icon: const Icon(Icons.add))
        ],
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
