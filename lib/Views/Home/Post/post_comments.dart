import 'package:flutter/material.dart';
import 'package:prologic_29/My%20Widgets/my_text_field_2.dart';
import 'package:prologic_29/data/Services/constants.dart';

class PostComments extends StatefulWidget {
  const PostComments({Key? key}) : super(key: key);

  @override
  State<PostComments> createState() => _PostCommentsState();
}

class _PostCommentsState extends State<PostComments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 75),
            child: ListView.builder(
              primary: true,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: horizontalPadding, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey[200]!, width: 1.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              children: const [
                                CircleAvatar(child: Icon(Icons.person)),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Expanded(
                                      child: Text(
                                    'Uzair Ali',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'This is a good property. Great shape and design with a reasonable price. a good value for money',
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Row(
              children: [
                Flexible(
                    child: Container(
                        color: Colors.white,
                        child: const MyTextField2(
                          hintText: 'Write a comment',
                        ))),
                IconButton(onPressed: () {}, icon: const Icon(Icons.send))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
