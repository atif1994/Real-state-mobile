import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Services/constants.dart';

class PostTile extends StatelessWidget {
  const PostTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200]!, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(15), child: CachedNetworkImage(imageUrl: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cHJvcGVydHl8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text('1 Kanal upper portion for Rent', textScaleFactor: 1.5),
              ),
              Row(
                children: const [
                  Icon(Icons.location_on_outlined, color: Colors.grey,),
                  Expanded(child: Text('DHA Phase 2, Islamabad', style: TextStyle(color: Colors.grey),)),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text('PKR 80000', textScaleFactor: 1.5, style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),),
              ),
              myDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(Icons.bed_outlined, color: Colors.grey),
                      ),
                      Text('3', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(Icons.bathtub_outlined, color: Colors.grey),
                      ),
                      Text('3', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
