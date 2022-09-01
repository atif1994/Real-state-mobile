import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prologic_29/My%20Widgets/my_button.dart';
import 'package:prologic_29/My%20Widgets/my_text_field_2.dart';
import 'package:prologic_29/Views/Home/post_tile.dart';
import '../../Services/constants.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  int iWantTo = 0;
  
  late TabController tabController;
  List<String> homePropertyTypeList = ['House', 'Upper Portion', 'Lower Portion', 'Farm House', 'Penthouse', 'Flat', 'Room'];
  List<String> plotPropertyTypeList = ['Residential Plot', 'Commercial Plot', 'Agricultural Land', 'Industrial Land', 'Plot File', 'Plot Form'];
  List<String> commercialPropertyTypeList = ['Office', 'Shop', 'Warehouse', 'Factory', 'Building', 'Other'];
  String selectedPropertyType = '';

  double minPriceRange = 0;
  double maxPriceRange = 100;
  final TextEditingController minPriceRangeController =TextEditingController();
  final TextEditingController maxPriceRangeController =TextEditingController();

  double minAreaRange = 0;
  double maxAreaRange = 100;
  final TextEditingController minAreaRangeController =TextEditingController();
  final TextEditingController maxAreaRangeController =TextEditingController();

  List<String> bedroomList = ['Any', 'Studio', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10+'];
  String selectedBedroom = 'Any';

  List<String> bathroomList = ['Any', '1', '2', '3', '4', '5', '6+'];
  String selectedBathroom = 'Any';

  bool onTapSearch = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);

    minPriceRangeController.text = minPriceRange.round().toString();
    maxPriceRangeController.text = maxPriceRange.round().toString();

    minAreaRangeController.text = minAreaRange.round().toString();
    maxAreaRangeController.text = maxAreaRange.round().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: horizontalPadding),
          child: Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                reverseDuration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SizeTransition(sizeFactor: animation, child: child);
                  // return ScaleTransition(scale: animation, child: child);
                },
                child: onTapSearch ? Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.currency_exchange),
                        const Expanded(
                            child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: horizontalPadding),
                          child: Text('I want to',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )),
                        CupertinoSlidingSegmentedControl<int>(
                            groupValue: iWantTo,
                            padding: const EdgeInsets.all(5),
                            thumbColor: primaryColor,
                            children: {
                              0: Text('Buy',
                                  style: TextStyle(
                                    color: iWantTo == 0 ? Colors.white : Colors.black,
                                  )),
                              1: Text('Rent',
                                  style: TextStyle(
                                    color: iWantTo == 1 ? Colors.white : Colors.black,
                                  )),
                              2: Text('Invest',
                                  style: TextStyle(
                                    color: iWantTo == 2 ? Colors.white : Colors.black,
                                  )),
                            },
                            onValueChanged: (v) {
                              setState(() {
                                iWantTo = v!;
                              });
                            }),
                      ],
                    ),
                    myDivider(),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: horizontalPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text('City',
                                    textScaleFactor: 1.25,
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Text('Islamabad',
                                  style: TextStyle(color: primaryColor)),
                            ],
                          ),
                        )),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    myDivider(),
                    SizedBox(
                      height: 120,
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.apartment_outlined),
                              Expanded(
                                child: Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: horizontalPadding),
                                  child: Text('Property Type',
                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                ),
                              )
                            ],
                          ),
                          TabBar(
                            controller: tabController,
                              labelPadding: const EdgeInsets.only(top: 10, bottom: 10),
                              padding: const EdgeInsets.only(bottom: 10),
                              tabs: const [
                                Text('Homes'),
                                Text('Plots'),
                                Text('Commercial'),
                              ]
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: tabController,
                                children: [
                                  ListView.builder(
                                    primary: true,
                                      shrinkWrap: false,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: homePropertyTypeList.length,
                                      itemBuilder: (context, index){
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              selectedPropertyType = homePropertyTypeList[index];
                                            });
                                          },
                                          child: Chip(
                                            backgroundColor: selectedPropertyType == homePropertyTypeList[index] ? primaryColor : Colors.grey[200],
                                            label: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 5),
                                              child: Text(homePropertyTypeList[index],
                                                  style: TextStyle(color: selectedBathroom == homePropertyTypeList[index] ? Colors.white : Colors.black))
                                            ),
                                          ),
                                        ),
                                      );
                                      },
                                  ),
                                  ListView.builder(
                                    primary: true,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: plotPropertyTypeList.length,
                                    itemBuilder: (context, index){
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              selectedPropertyType = plotPropertyTypeList[index];
                                            });
                                          },
                                          child: Chip(
                                            backgroundColor: selectedPropertyType == plotPropertyTypeList[index] ? primaryColor : Colors.grey[200],
                                            label: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 5),
                                              child: Text(plotPropertyTypeList[index],
                                                style: TextStyle(color: selectedPropertyType == plotPropertyTypeList[index] ? Colors.white : Colors.black)
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  ListView.builder(
                                    primary: true,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: commercialPropertyTypeList.length,
                                    itemBuilder: (context, index){
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              selectedPropertyType = commercialPropertyTypeList[index];
                                            });
                                          },
                                          child: Chip(
                                            backgroundColor: selectedPropertyType == commercialPropertyTypeList[index] ? primaryColor : Colors.grey[200],
                                            label: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 5),
                                              child: Text(commercialPropertyTypeList[index],
                                                style: TextStyle(color: selectedPropertyType == commercialPropertyTypeList[index] ? Colors.white : Colors.black)
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ]
                            ),
                          ),
                        ],
                      ),
                    ),
                    myDivider(),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.sell_outlined),
                            Expanded(
                              child: Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: horizontalPadding),
                                child: Text('Price range',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: MyTextField2(
                                controller: minPriceRangeController,
                                textInputType: TextInputType.number,
                                onChanged: (v){
                                  setState(() {
                                    minPriceRange = double.parse(v);
                                  });
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                              child: Text('to'),
                            ),
                            Flexible(
                              child: MyTextField2(
                                controller: maxPriceRangeController,
                                textInputType: TextInputType.number,
                                onChanged: (v){
                                  setState(() {
                                    maxPriceRange = double.parse(v);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        RangeSlider(
                            min: 0,
                            max: 100,
                            labels: RangeLabels(minPriceRange.toString(), maxPriceRange.toString()),
                            values: RangeValues(minPriceRange, maxPriceRange),
                            onChanged: (v){
                              setState(() {
                                minPriceRange = v.start;
                                maxPriceRange = v.end;

                                minPriceRangeController.text = v.start.round().toString();
                                maxPriceRangeController.text = v.end.round().toString();
                              });
                            }
                        )
                      ],
                    ),
                    myDivider(),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.square_foot_outlined),
                            Expanded(
                              child: Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: horizontalPadding),
                                child: Text('Area range',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Text('Marla',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: MyTextField2(
                                controller: minAreaRangeController,
                                textInputType: TextInputType.number,
                                onChanged: (v){
                                  setState(() {
                                    minAreaRange = double.parse(v);
                                  });
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                              child: Text('to'),
                            ),
                            Flexible(
                              child: MyTextField2(
                                controller: maxAreaRangeController,
                                textInputType: TextInputType.number,
                                onChanged: (v){
                                  setState(() {
                                    maxAreaRange = double.parse(v);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        RangeSlider(
                            min: 0,
                            max: 100,
                            labels: RangeLabels(minAreaRange.toString(), maxAreaRange.toString()),
                            values: RangeValues(minAreaRange, maxAreaRange),
                            onChanged: (v){
                              setState(() {
                                minAreaRange = v.start;
                                maxAreaRange = v.end;

                                minAreaRangeController.text = v.start.round().toString();
                                maxAreaRangeController.text = v.end.round().toString();
                              });
                            }
                        )
                      ],
                    ),
                    myDivider(),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.bed_outlined),
                            Expanded(
                                child: Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: horizontalPadding),
                                  child: Text('Bedrooms',
                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                )),
                          ],
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: bedroomList.map((e) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedBedroom = e;
                                });
                              },
                              child: Chip(
                                backgroundColor: selectedBedroom == e ? primaryColor : Colors.grey[200],
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Text(e, style: TextStyle(color: selectedBedroom == e ? Colors.white : Colors.black)),
                                  ),
                              ),
                            ),
                          )).toList(),
                        ),
                      ],
                    ),
                    myDivider(),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.bathtub_outlined),
                            Expanded(
                                child: Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: horizontalPadding),
                                  child: Text('Bathrooms',
                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                )),
                          ],
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: bathroomList.map((e) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedBathroom = e;
                                });
                              },
                              child: Chip(
                                backgroundColor: selectedBathroom == e ? primaryColor : Colors.grey[200],
                                label: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(e, style: TextStyle(color: selectedBathroom == e ? Colors.white : Colors.black)),
                                ),
                              ),
                            ),
                          )).toList(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: MyButton(onTap: (){
                        setState(() {
                          onTapSearch = false;
                        });
                      }, text: 'Search'),
                    ),
                  ],
                ) : ListTile(title: Text('Search'), trailing: Icon(Icons.search), onTap: (){setState(() {
                  onTapSearch = true;
                });}),
              ),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index){
                  return const PostTile();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}