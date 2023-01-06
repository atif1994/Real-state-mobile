import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:prologic_29/data/Controllers/search_controller.dart';
import 'package:prologic_29/My%20Widgets/my_button.dart';
import 'package:prologic_29/Views/Home/Post/post_tile.dart';
import '../../My Widgets/my_text_field_2.dart';
import '../../data/Services/constants.dart';

class Search extends GetView<SearchController> {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: horizontalPadding),
            child: Column(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  reverseDuration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return SizeTransition(sizeFactor: animation, child: child);
                    // return ScaleTransition(scale: animation, child: child);
                  },
                  child: controller.onTapSearch.value
                      ? Column(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.currency_exchange),
                                const Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: horizontalPadding),
                                  child: Text('I want to',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                )),
                                CupertinoSlidingSegmentedControl<int>(
                                    groupValue: controller.iWantTo.value,
                                    padding: const EdgeInsets.all(5),
                                    thumbColor: primaryColor,
                                    children: {
                                      0: Text('Buy',
                                          style: TextStyle(
                                            color: controller.iWantTo.value == 0
                                                ? Colors.white
                                                : Colors.black,
                                          )),
                                      1: Text('Rent',
                                          style: TextStyle(
                                            color: controller.iWantTo.value == 1
                                                ? Colors.white
                                                : Colors.black,
                                          )),
                                      2: Text('Invest',
                                          style: TextStyle(
                                            color: controller.iWantTo.value == 2
                                                ? Colors.white
                                                : Colors.black,
                                          )),
                                    },
                                    onValueChanged: (v) {
                                      controller.iWantTo.value = v!;
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 5),
                                        child: Text('City',
                                            textScaleFactor: 1.25,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Text('Islamabad',
                                          style:
                                              TextStyle(color: primaryColor)),
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: horizontalPadding),
                                          child: Text('Property Type',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      )
                                    ],
                                  ),
                                  TabBar(
                                      controller: controller.tabController,
                                      labelPadding: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      tabs: const [
                                        Text('Homes'),
                                        Text('Plots'),
                                        Text('Commercial'),
                                      ]),
                                  Expanded(
                                    child: TabBarView(
                                        controller: controller.tabController,
                                        children: [
                                          ListView.builder(
                                            primary: true,
                                            shrinkWrap: false,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller
                                                .homePropertyTypeList.length,
                                            itemBuilder: (context, index) {
                                              return Obx(() {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .selectedPropertyType
                                                          .value = controller
                                                              .homePropertyTypeList[
                                                          index];
                                                    },
                                                    child: Chip(
                                                      backgroundColor: controller
                                                                  .selectedPropertyType
                                                                  .value ==
                                                              controller
                                                                      .homePropertyTypeList[
                                                                  index]
                                                          ? primaryColor
                                                          : Colors.grey[200],
                                                      label: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      5),
                                                          child: Text(
                                                              controller.homePropertyTypeList[
                                                                  index],
                                                              style: TextStyle(
                                                                  color: controller
                                                                              .selectedPropertyType
                                                                              .value ==
                                                                          controller.homePropertyTypeList[
                                                                              index]
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black))),
                                                    ),
                                                  ),
                                                );
                                              });
                                            },
                                          ),
                                          ListView.builder(
                                            primary: true,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller
                                                .plotPropertyTypeList.length,
                                            itemBuilder: (context, index) {
                                              return Obx(() {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .selectedPropertyType
                                                          .value = controller
                                                              .plotPropertyTypeList[
                                                          index];
                                                    },
                                                    child: Chip(
                                                      backgroundColor: controller
                                                                  .selectedPropertyType
                                                                  .value ==
                                                              controller
                                                                      .plotPropertyTypeList[
                                                                  index]
                                                          ? primaryColor
                                                          : Colors.grey[200],
                                                      label: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 5),
                                                        child: Text(
                                                            controller.plotPropertyTypeList[
                                                                index],
                                                            style: TextStyle(
                                                                color: controller
                                                                            .selectedPropertyType
                                                                            .value ==
                                                                        controller.plotPropertyTypeList[
                                                                            index]
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black)),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                            },
                                          ),
                                          ListView.builder(
                                            primary: true,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller
                                                .commercialPropertyTypeList
                                                .length,
                                            itemBuilder: (context, index) {
                                              return Obx(() {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .selectedPropertyType
                                                          .value = controller
                                                              .commercialPropertyTypeList[
                                                          index];
                                                    },
                                                    child: Chip(
                                                      backgroundColor: controller
                                                                  .selectedPropertyType
                                                                  .value ==
                                                              controller
                                                                      .commercialPropertyTypeList[
                                                                  index]
                                                          ? primaryColor
                                                          : Colors.grey[200],
                                                      label: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 5),
                                                        child: Text(
                                                            controller.commercialPropertyTypeList[
                                                                index],
                                                            style: TextStyle(
                                                                color: controller
                                                                            .selectedPropertyType
                                                                            .value ==
                                                                        controller.commercialPropertyTypeList[
                                                                            index]
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black)),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                            },
                                          ),
                                        ]),
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: horizontalPadding),
                                        child: Text('Price range',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: MyTextField2(
                                        controller:
                                            controller.minPriceRangeController,
                                        textInputType: TextInputType.number,
                                        onChanged: (v) {
                                          controller.minPriceRange.value =
                                              double.parse(v);
                                        },
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: horizontalPadding),
                                      child: Text('to'),
                                    ),
                                    Flexible(
                                      child: MyTextField2(
                                        controller:
                                            controller.maxPriceRangeController,
                                        textInputType: TextInputType.number,
                                        onChanged: (v) {
                                          controller.maxPriceRange.value =
                                              double.parse(v);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                RangeSlider(
                                    min: 0,
                                    max: 100,
                                    labels: RangeLabels(
                                        controller.minPriceRange.toString(),
                                        controller.maxPriceRange.toString()),
                                    values: RangeValues(
                                        controller.minPriceRange.value,
                                        controller.maxPriceRange.value),
                                    onChanged: (v) {
                                      controller.minPriceRange.value = v.start;
                                      controller.maxPriceRange.value = v.end;

                                      controller.minPriceRangeController.text =
                                          v.start.round().toString();
                                      controller.maxPriceRangeController.text =
                                          v.end.round().toString();
                                    })
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: horizontalPadding),
                                        child: Text('Area range',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    Text('Marla',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: MyTextField2(
                                        controller:
                                            controller.minAreaRangeController,
                                        textInputType: TextInputType.number,
                                        onChanged: (v) {
                                          controller.minAreaRange.value =
                                              double.parse(v);
                                        },
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: horizontalPadding),
                                      child: Text('to'),
                                    ),
                                    Flexible(
                                      child: MyTextField2(
                                        controller:
                                            controller.maxAreaRangeController,
                                        textInputType: TextInputType.number,
                                        onChanged: (v) {
                                          controller.maxAreaRange.value =
                                              double.parse(v);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                RangeSlider(
                                    min: 0,
                                    max: 100,
                                    labels: RangeLabels(
                                        controller.minAreaRange.toString(),
                                        controller.maxAreaRange.toString()),
                                    values: RangeValues(
                                        controller.minAreaRange.value,
                                        controller.maxAreaRange.value),
                                    onChanged: (v) {
                                      controller.minAreaRange.value = v.start;
                                      controller.maxAreaRange.value = v.end;

                                      controller.minAreaRangeController.text =
                                          v.start.round().toString();
                                      controller.maxAreaRangeController.text =
                                          v.end.round().toString();
                                    })
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: horizontalPadding),
                                      child: Text('Bedrooms',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    )),
                                  ],
                                ),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  children: controller.bedroomList
                                      .map((e) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: GestureDetector(
                                              onTap: () {
                                                controller
                                                    .selectedBedroom.value = e;
                                              },
                                              child: Chip(
                                                backgroundColor: controller
                                                            .selectedBedroom
                                                            .value ==
                                                        e
                                                    ? primaryColor
                                                    : Colors.grey[200],
                                                label: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  child: Text(e,
                                                      style: TextStyle(
                                                          color: controller
                                                                      .selectedBedroom
                                                                      .value ==
                                                                  e
                                                              ? Colors.white
                                                              : Colors.black)),
                                                ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: horizontalPadding),
                                      child: Text('Bathrooms',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    )),
                                  ],
                                ),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  children: controller.bathroomList
                                      .map((e) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: GestureDetector(
                                              onTap: () {
                                                controller
                                                    .selectedBathroom.value = e;
                                              },
                                              child: Chip(
                                                backgroundColor: controller
                                                            .selectedBathroom
                                                            .value ==
                                                        e
                                                    ? primaryColor
                                                    : Colors.grey[200],
                                                label: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  child: Text(e,
                                                      style: TextStyle(
                                                          color: controller
                                                                      .selectedBathroom
                                                                      .value ==
                                                                  e
                                                              ? Colors.white
                                                              : Colors.black)),
                                                ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: MyButton(
                                  onTap: () {
                                    controller.onTapSearch.value = false;
                                  },
                                  text: 'Search'),
                            ),
                          ],
                        )
                      : ListTile(
                          title: const Text('Search'),
                          trailing: const Icon(Icons.search),
                          onTap: () {
                            controller.onTapSearch.value = true;
                          }),
                ),
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return PostTile(
                      index: index,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
