import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:prologic_29/My%20Widgets/my_button.dart';
import 'package:prologic_29/Services/constants.dart';
import 'package:prologic_29/Views/Home/Post/post_comments.dart';

class PostDetails extends StatefulWidget {
  final int index;

  const PostDetails({super.key, required this.index});

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  bool showMoreDescription = false;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: s.height * 0.5,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'Post Image Hero Tag ${widget.index}',
                child: CachedNetworkImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cHJvcGVydHl8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // SliverList(
          //     delegate: SliverChildBuilderDelegate((context, index) {
          //   return Column(
          //     children: [
          //       Hero(
          //         tag: 'Post Image Hero Tag $index',
          //         child: CachedNetworkImage(
          //             imageUrl:
          //             'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cHJvcGVydHl8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
          //       ),
          //       const Text('PKR 100000000', textScaleFactor: 1.5, style: TextStyle(fontWeight: FontWeight.bold),),
          //       myDivider(),
          //       const Text('1 Kanal upper portion for Rent'),
          //       Row(
          //         children: const [
          //           Icon(
          //             Icons.location_on_outlined,
          //             color: Colors.grey,
          //           ),
          //           Expanded(
          //               child: Text(
          //                 'DHA Phase 2, Islamabad',
          //                 style: TextStyle(color: Colors.grey),
          //               )),
          //         ],
          //       ),
          //       myDivider(),
          //       Row(
          //         children: const [
          //           Icon(
          //             Icons.location_on_outlined,
          //             color: Colors.grey,
          //           ),
          //           Expanded(
          //               child: Text(
          //                 'DHA Phase 2, Islamabad',
          //                 style: TextStyle(color: Colors.grey),
          //               )),
          //         ],
          //       ),
          //       myDivider(),
          //     ],
          //   );
          // },))
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 10),
                    child: Text(
                      'PKR 100000000',
                      textScaleFactor: 1.5,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  myDivider(),
                  const Text('1 Kanal upper portion for Rent'),
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                      ),
                      Expanded(
                          child: Text(
                        'DHA Phase 2, Islamabad',
                        style: TextStyle(color: Colors.grey),
                      )),
                    ],
                  ),
                  myDivider(),
                  Row(
                    children: const [
                      Icon(
                        Icons.square_foot_outlined,
                        color: Colors.grey,
                      ),
                      Expanded(
                          child: Text(
                        '185 Marla',
                        style: TextStyle(color: Colors.grey),
                      )),
                    ],
                  ),
                  myDivider(),
                  Row(
                    children: [
                      Expanded(
                        child: RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          // allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                          const EdgeInsets.symmetric(
                              horizontal: 1.0),
                          itemBuilder: (context, _) =>
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {

                          },
                        ),
                      ),
                      TextButton(onPressed: (){
                        Get.to(const PostComments());
                      }, child: const Text('Comments')),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Details',
                      textScaleFactor: 1.5,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  _thisDetailRow(
                    icon: Icons.search,
                    text1: 'Property ID',
                    text2: '123456',
                  ),
                  _thisDetailRow(
                    icon: Icons.search,
                    text1: 'Type',
                    text2: 'House',
                  ),
                  _thisDetailRow(
                    icon: Icons.search,
                    text1: 'Price',
                    text2: 'PKR 100000000',
                  ),
                  _thisDetailRow(
                    icon: Icons.search,
                    text1: 'Bed(s)',
                    text2: '5',
                  ),
                  _thisDetailRow(
                    icon: Icons.search,
                    text1: 'Bath(s)',
                    text2: '8',
                  ),
                  _thisDetailRow(
                    icon: Icons.search,
                    text1: 'Area',
                    text2: '100 Marla',
                  ),
                  _thisDetailRow(
                    icon: Icons.search,
                    text1: 'Purpose',
                    text2: 'For Sale',
                  ),
                  _thisDetailRow(
                    icon: Icons.search,
                    text1: 'City',
                    text2: 'Islamabad',
                  ),
                  _thisDetailRow(
                    icon: Icons.search,
                    text1: 'Location',
                    text2: 'DHA Phase 2',
                  ),
                  myDivider(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Description',
                      textScaleFactor: 1.5,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Advocates for Neuro-Symbolic Artificial Intelligence (NeSy) assert that combining deep learning with symbolic reasoning will lead to stronger AI than either paradigm on its own. As successful as deep learning has been, it is generally accepted that even our best deep learning systems are not very good at abstract reasoning. And since reasoning is inextricably linked to language, it makes intuitive sense that Natural Language Processing (NLP), would be a particularly well-suited candidate for NeSy. We conduct a structured review of studies implementing NeSy for NLP, with the aim of answering the question of whether NeSy is indeed meeting its promises: reasoning, out-of-distribution generalization, interpretability, learning and reasoning from small data, and transferability to new domains. We examine the impact of knowledge representation, such as rules and semantic networks, language structure and relational structure, and whether implicit or explicit reasoning contributes to higher promise scores. We find that systems where logic is compiled into the neural network lead to the most NeSy goals being satisfied, while other factors such as knowledge representation, or type of neural architecture do not exhibit a clear correlation with goals being met. We find many discrepancies in how reasoning is defined, specifically in relation to human level reasoning, which impact decisions about model architectures and drive conclusions which are not always consistent across studies. Hence we advocate for a more methodical approach to the application of theories of human reasoning as well as the development of appropriate benchmarks, which we hope can lead to a better understanding of progress in the field. We make our data and code available on github for further analysis.',
                    textAlign: TextAlign.justify,
                    maxLines: showMoreDescription ? null : 4,
                    // overflow: TextOverflow.ellipsis,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            showMoreDescription = !showMoreDescription;
                          });
                        },
                        child: Text(
                            showMoreDescription ? 'Show less' : 'Show more')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: horizontalPadding),
                    child: Row(
                      children: [
                        Flexible(child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: MyButton(onTap: (){}, text: 'Call'),
                        )),
                        Flexible(child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: MyButton(onTap: (){}, text: 'Email'),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _thisDetailRow({
    required IconData icon,
    required String text1,
    required String text2,
  }) {
    return Row(
      children: [
        Icon(icon),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Text(text1),
        )),
        Text(text2),
      ],
    );
  }
}
