import 'dart:convert';
import 'dart:io';
import 'dart:io' as Io;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prologic_29/My%20Widgets/my_button.dart';
import 'package:prologic_29/My%20Widgets/my_text_field_2.dart';
import 'package:prologic_29/Services/constants.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:prologic_29/data/Controllers/addProperty_Controller.dart';
import 'package:prologic_29/data/Controllers/property_controllers/featured_property_controller.dart';
import 'package:prologic_29/data/Models/addproperty_model/postDataProperty_model.dart';
import 'package:sizer/sizer.dart';

import '../../data/Services/constants.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/styles/app_textstyles.dart';

class Property extends StatefulWidget {
  const Property({Key? key}) : super(key: key);

  @override
  State<Property> createState() => _PropertyState();
}

class _PropertyState extends State<Property>
    with SingleTickerProviderStateMixin {
  bool checkBoxValue1 = false;
  bool checkBoxValue2 = false;
  bool checkBoxValue3 = false;
  bool checkBoxValue4 = false;
  bool checkBoxValue5 = false;
  bool checkBoxValue6 = false;
  String dropdownvalue = 'PKR';
  String dropdownvalue3 = 'Apartment';
  final _formKey = GlobalKey<FormState>();
  // List of items in our dropdown menu
  var items = [
    'PKR',
    'USD',
  ];
  String? selectedValue;
  TextEditingController kilometercontroller = TextEditingController();

  int iWantTo = 1;
  String? facilityname;
  late TabController tabController;
  List<String> homePropertyTypeList = [
    'House',
    'Upper Portion',
    'Lower Portion',
    'Farm House',
    'Penthouse',
    'Flat',
    'Room'
  ];
  List<String> plotPropertyTypeList = [
    'Residential Plot',
    'Commercial Plot',
    'Agricultural Land',
    'Industrial Land',
    'Plot File',
    'Plot Form'
  ];
  List<String> commercialPropertyTypeList = [
    'Office',
    'Shop',
    'Warehouse',
    'Factory',
    'Building',
    'Other'
  ];

  int selectedCategory = 0;

  double minPriceRange = 0.0;
  double maxPriceRange = 100.0;
  final TextEditingController minPriceRangeController = TextEditingController();
  final TextEditingController maxPriceRangeController = TextEditingController();

  double minAreaRange = 0.0;
  double maxAreaRange = 100.0;
  final TextEditingController minAreaRangeController = TextEditingController();
  final TextEditingController maxAreaRangeController = TextEditingController();

  List category = [];
  var newitems = [
    'Apartment',
    'Villa',
    'Condo',
    'House',
    'Land',
    'Commerical property',
    'Plot',
    'Shop',
    'Flat',
    'Building'
  ];

  List<String> bedroomList = [
    'Any',
    'Studio',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10+'
  ];
  int selectedBedroom = 0;

  List<String> bathroomList = ['Any', '1', '2', '3', '4', '5', '6+'];
  int selectedBathroom = 0;
  List<String> floorList = [
    'Any',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6+',
  ];
  int selectedFloor = 0;

  var postDataproperty = PostDataProperty();
  @override
  void initState() {
    // TODO: implement onInit
    getCitiese();
    super.initState();
    tabController = TabController(length: 3, vsync: this);

    minPriceRangeController.text = minPriceRange.round().toString();
    maxPriceRangeController.text = maxPriceRange.round().toString();
    minAreaRangeController.text = minAreaRange.round().toString();
    maxAreaRangeController.text = maxAreaRange.round().toString();
  }

  String dropdownvalue22 = 'Select Facility';

  var facilities = [
    'Select Facility',
    'Mosque Nearby',
    'Play Ground',
    'Park',
  ];
  List addedFeaturesList = [];
  List<dynamic> featuresList = [
    'Balcony',
    'Security Staff',
    'Parking Area',
    'Electricity',
    'Accessible by Road',
    'Sui Gas'
  ];

  int? facilityid;
  List addedFacilityList = [];
  List facilitiesIdList = [];
  List<dynamic> addFeaturesList = [];
  List facilitiesList = [];
  List kmList = [];
  String? km;

  var obj = {};
  List featureOBJ = [];

  var addPropertyController = Get.put(AddProperrtyController());
  var cityListController = Get.put(DashboardController());
  List citiese = [];

  void getCitiese() {
    for (int i = 0; i < cityListController.citiesModel.data!.length; i++) {
      citiese.add(cityListController.citiesModel.data![i].name.toString() ?? "");
    }
  }

  List<String> base64List = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        title: InkWell(
            onTap: () {
              print(addPropertyController.selectedPropertyCategory.value);
              // for (Home home in addPropertyController.homelist) {
              //   print(home.name);
              // }
            },
            child: Text("Add Property", style: AppTextStyles.appbar)),
        // actions: <Widget>[
        // IconButton(
        //   icon: const Icon(Icons.add),
        //   onPressed: () {
        //     Get.to(() => const NewsFeed());
        //   },
        // ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: horizontalPadding),
          child: Column(
            children: [
              Column(
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
                      Obx(() => addPropertyController.loadingPropertytypes.value
                          ? showShimmer()
                          : CupertinoSlidingSegmentedControl<int>(
                              backgroundColor: primaryColor,
                              groupValue: iWantTo,
                              padding: const EdgeInsets.all(5),
                              //thumbColor: primaryColor,
                              thumbColor: AppColors.themecolor,
                              children: Map.fromEntries(addPropertyController
                                  .propertytypesModel.data!
                                  .map((item) => MapEntry(
                                      item.id!,
                                      Text(
                                        item.name!,
                                        style: const TextStyle(
                                            color: AppColors.colorWhite),
                                      )))),
                              // {
                              //   0: Text('Sell',
                              //       style: TextStyle(
                              //         color: iWantTo == 0
                              //             ? AppColors.colorWhite
                              //             : AppColors.appthem,
                              //       )),
                              //   1: Text('Rent',
                              //       style: TextStyle(
                              //         color: iWantTo == 1
                              //             ? AppColors.colorWhite
                              //             : AppColors.appthem,
                              //       )),
                              // },
                              onValueChanged: (v) {
                                setState(() {
                                  iWantTo = v!;
                                });
                              })),
                    ],
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
                              child: Text('Property Title',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                      MyTextField2(
                        controller: titleController,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.sell_outlined),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: horizontalPadding),
                              child: Text('Property Description',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                      MyTextField2(
                        controller: dispController,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.sell_outlined),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: horizontalPadding),
                              child: Text('Content',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                      MyTextField2(
                        controller: contentController,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.location_on_outlined),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: horizontalPadding),
                              child: Text('City',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      Obx(() => addPropertyController.loadingAddProperty.value
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: AppColors.appthem,
                            ))
                          : addPropertyController
                                      .errorLoadingAddProperty.value !=
                                  ''
                              ? Center(
                                  child: Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              getCitiese();
                                            },
                                            icon: const Icon(
                                              Icons.refresh,
                                              color: AppColors.appthem,
                                            )),
                                        SizedBox(
                                          height: 1.0.h,
                                        ),
                                        Text(addPropertyController
                                            .errorLoadingAddProperty.value),
                                      ],
                                    ),
                                  ),
                                )
                              : ListTile(
                                  leading:
                                      const Icon(Icons.location_on_outlined),
                                  title: Text(addPropertyController
                                      .selectedValueCity.value),
                                  onTap: () => _showCityList(),
                                ))
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            )
                          ],
                        ),
                        TabBar(
                            controller: tabController,
                            labelPadding:
                                const EdgeInsets.only(top: 10, bottom: 10),
                            padding: const EdgeInsets.only(bottom: 10),
                            tabs: const [
                              Text('Homes'),
                              Text('Plots'),
                              Text('Commercial'),
                            ]),
                        Expanded(
                          child:
                              TabBarView(controller: tabController, children: [
                            Obx(() => addPropertyController
                                    .loadingPropertyCategory.value
                                ? showchipshimmer()
                                : ListView.builder(
                                    primary: true,
                                    shrinkWrap: false,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        addPropertyController.homelist.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: GestureDetector(
                                            onTap: () {
                                              addPropertyController
                                                      .selectedPropertyCategory
                                                      .value =
                                                  addPropertyController
                                                      .homelist[index].id!;
                                            },
                                            child: Obx(
                                              () => Chip(
                                                backgroundColor:
                                                    addPropertyController
                                                                .selectedPropertyCategory
                                                                .value ==
                                                            addPropertyController
                                                                .homelist[index]
                                                                .id!
                                                        ? primaryColor
                                                        : Colors.grey[200],
                                                label: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Text(
                                                        addPropertyController
                                                            .homelist[index]
                                                            .name!,
                                                        style: TextStyle(
                                                            color: addPropertyController
                                                                        .selectedPropertyCategory
                                                                        .value ==
                                                                    addPropertyController
                                                                        .homelist[
                                                                            index]
                                                                        .id!
                                                                ? Colors.white
                                                                : Colors
                                                                    .black))),
                                              ),
                                            )),
                                      );
                                    },
                                  )),
                            Obx(() => addPropertyController
                                    .loadingPropertyCategory.value
                                ? showchipshimmer()
                                : ListView.builder(
                                    primary: true,
                                    shrinkWrap: false,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        addPropertyController.plotlist.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: GestureDetector(
                                            onTap: () {
                                              addPropertyController
                                                      .selectedPropertyCategory
                                                      .value =
                                                  addPropertyController
                                                      .plotlist[index].id!;
                                            },
                                            child: Obx(
                                              () => Chip(
                                                backgroundColor:
                                                    addPropertyController
                                                                .selectedPropertyCategory
                                                                .value ==
                                                            addPropertyController
                                                                .plotlist[index]
                                                                .id!
                                                        ? primaryColor
                                                        : Colors.grey[200],
                                                label: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Text(
                                                        addPropertyController
                                                            .plotlist[index]
                                                            .name!,
                                                        style: TextStyle(
                                                            color: addPropertyController
                                                                        .selectedPropertyCategory
                                                                        .value ==
                                                                    addPropertyController
                                                                        .plotlist[
                                                                            index]
                                                                        .id!
                                                                ? Colors.white
                                                                : Colors
                                                                    .black))),
                                              ),
                                            )),
                                      );
                                    },
                                  )),
                            Obx(() => addPropertyController
                                    .loadingPropertyCategory.value
                                ? showchipshimmer()
                                : ListView.builder(
                                    primary: true,
                                    shrinkWrap: false,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: addPropertyController
                                        .commerciallist.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: GestureDetector(
                                            onTap: () {
                                              addPropertyController
                                                      .selectedPropertyCategory
                                                      .value =
                                                  addPropertyController
                                                      .commerciallist[index]
                                                      .id!;
                                            },
                                            child: Obx(
                                              () => Chip(
                                                backgroundColor:
                                                    addPropertyController
                                                                .selectedPropertyCategory
                                                                .value ==
                                                            addPropertyController
                                                                .commerciallist[
                                                                    index]
                                                                .id!
                                                        ? primaryColor
                                                        : Colors.grey[200],
                                                label: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Text(
                                                        addPropertyController
                                                            .commerciallist[
                                                                index]
                                                            .name!,
                                                        style: TextStyle(
                                                            color: addPropertyController
                                                                        .selectedPropertyCategory
                                                                        .value ==
                                                                    addPropertyController
                                                                        .commerciallist[
                                                                            index]
                                                                        .id!
                                                                ? Colors.white
                                                                : Colors
                                                                    .black))),
                                              ),
                                            )),
                                      );
                                    },
                                  )),
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
                              child: Text('Society information and location',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                      MyTextField2(
                        controller: locatController,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.sell_outlined),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: horizontalPadding),
                              child: Text('Sector And Block Name',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                      MyTextField2(
                        controller: sectorController,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.sell_outlined),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: horizontalPadding),
                              child: Text('Plot Number',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                      MyTextField2(
                        controller: plotNoController,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.sell_outlined),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: horizontalPadding),
                              child: Text('Street No',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                      MyTextField2(
                        controller: streetNoController,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.sell_outlined),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: horizontalPadding),
                              child: Text('Property Price',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                      MyTextField2(
                        controller: priceController,
                        textInputType: TextInputType.number,
                        onChanged: (v) {
                          minPriceRange = double.parse(v);
                        },
                      ),
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
                              child: Text('Square (m²)',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      MyTextField2(
                        controller: squareController,
                        textInputType: TextInputType.number,
                        onChanged: (v) {
                          minAreaRange = double.parse(v);
                        },
                      ),
                    ],
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
                              // define
                              child: Text('Currency',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                      //define
                      Padding(
                        padding: const EdgeInsets.only(right: 180),
                        child: DropdownButton(
                          // Initial Value
                          value: dropdownvalue,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
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
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: bedroomList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedBedroom = index;
                                  });
                                },
                                child: Chip(
                                  backgroundColor: selectedBedroom == index
                                      ? AppColors.appthem
                                      : Colors.grey[200],
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(bedroomList[index],
                                        style: TextStyle(
                                            color: selectedBedroom == index
                                                ? Colors.white
                                                : Colors.black)),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
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
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: bathroomList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedBathroom = index;
                                  });
                                },
                                child: Chip(
                                  backgroundColor: selectedBathroom == index
                                      ? AppColors.appthem
                                      : Colors.grey[200],
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(bathroomList[index],
                                        style: TextStyle(
                                            color: selectedBathroom == index
                                                ? Colors.white
                                                : Colors.black)),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // Wrap(
                      //   alignment: WrapAlignment.center,
                      //   children: bathroomList
                      //       .map((e) => Padding(
                      //             padding:
                      //                 const EdgeInsets.symmetric(horizontal: 5),
                      //             child: GestureDetector(
                      //               onTap: () {
                      //                 setState(() {
                      //                   selectedBathroom = e;
                      //                 });
                      //               },
                      //               child: Chip(
                      //                 backgroundColor: selectedFloor == e
                      //                     ? AppColors.appthem
                      //                     : Colors.grey[200],
                      //                 label: Padding(
                      //                   padding: const EdgeInsets.symmetric(
                      //                       horizontal: 5),
                      //                   child: Text(e,
                      //                       style: TextStyle(
                      //                           color: selectedFloor == e
                      //                               ? Colors.white
                      //                               : Colors.black)),
                      //                 ),
                      //               ),
                      //             ),
                      //           ))
                      //       .toList(),
                      // ),
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
                            child: Text('Floors',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          )),
                        ],
                      ),
                      // Wrap(
                      //   alignment: WrapAlignment.center,
                      //   children: floorList
                      //       .map((e) => Padding(
                      //             padding:
                      //                 const EdgeInsets.symmetric(horizontal: 5),
                      //             child: GestureDetector(
                      //               onTap: () {
                      //                 setState(() {
                      //                   selectedFloor = e;
                      //                 });
                      //               },
                      //               child: Chip(
                      //                 backgroundColor: selectedFloor == e
                      //                     ? AppColors.appthem
                      //                     : Colors.grey[200],
                      //                 label: Padding(
                      //                   padding: const EdgeInsets.symmetric(
                      //                       horizontal: 5),
                      //                   child: Text(e,
                      //                       style: TextStyle(
                      //                           color: selectedFloor == e
                      //                               ? Colors.white
                      //                               : Colors.black)),
                      //                 ),
                      //               ),
                      //             ),
                      //           ))
                      //       .toList(),
                      // ),
                      SizedBox(
                        height: 12.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: floorList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedFloor = index;
                                  });
                                },
                                child: Chip(
                                  backgroundColor: selectedFloor == index
                                      ? AppColors.appthem
                                      : Colors.grey[200],
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(floorList[index],
                                        style: TextStyle(
                                            color: selectedFloor == index
                                                ? Colors.white
                                                : Colors.black)),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Text('Distance Key Between Facilities',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              myDivider(),

              SizedBox(
                height: 15.h,
                width: 120.w,
                child: addPropertyController.listfac.isEmpty
                    ? const Center(
                        child: Text("Add Some Facilities"),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const PageScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: addPropertyController.listfac.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: primaryColor.shade300,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: ListTile(
                                  title: Padding(
                                    padding: EdgeInsets.only(right: 8.0.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(addPropertyController
                                            .listfac[index].name
                                            .toString()),
                                        Text(
                                            "KM: ${addPropertyController.listfac[index].distance}"),
                                      ],
                                    ),
                                  ),
                                  trailing: GestureDetector(
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onTap: () {
                                      addPropertyController.listfac
                                          .removeAt(index);
                                      setState(() {});
                                    },
                                  ),
                                )),
                          );
                        },
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Obx(() => addPropertyController.loadingGetFacilities.value
                      ? loader
                      : DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: const Color.fromARGB(255, 241, 239, 239),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 168, 166, 166),
                                  width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: DropdownButton<String>(
                              value:
                                  addPropertyController.dropdownvalue22.value,
                              items: addPropertyController
                                  .getFacilitiesModel.data!
                                  .map((e) {
                                return DropdownMenuItem<String>(
                                  value: e.id.toString(),
                                  child: Text(e.name.toString()),
                                );
                              }).toList(),
                              onChanged: (value) {
                                for (var v in addPropertyController
                                    .getFacilitiesModel.data!) {
                                  if (value == v.id.toString()) {
                                    facilityname = v.name;
                                  }
                                }
                                print(value);
                                addPropertyController.dropdownvalue22.value =
                                    value.toString();

                                facilityid = int.parse(value!);
                              },
                              underline: const SizedBox(),
                              isExpanded: true,
                              hint: const Text('Select'),
                            ),
                          ),
                        )),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: kilometercontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Km';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Kilometer (km)',
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onChanged: (value) {
                        km = value;
                      },
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: MyButton(
                    onTap: () {
                      int indexwhere = addPropertyController.listfac
                          .indexWhere((facility) => facility.id == facilityid);
                      if (_formKey.currentState!.validate()) {
                        if (indexwhere != -1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.red,
                              content: Text('Facility already added'),
                            ),
                          );
                        } else {
                          setState(() {
                            facilityname ??= addPropertyController
                                .getFacilitiesModel.data![0].name;

                            ListFacility facility = ListFacility(
                                id: facilityid,
                                distance: km,
                                name: facilityname);
                            addPropertyController.listfac.add(facility);
                            kilometercontroller.clear();
                          });
                        }
                      }
                    },
                    text: 'Add New'),
              ),
              SizedBox(
                height: 2.0.h,
              ),
              // Row(
              //   children: [
              //     const Text('Type',
              //         style: TextStyle(fontWeight: FontWeight.bold)),
              //     SizedBox(
              //       height: 3.0.h,
              //     ),
              //   ],
              // ),

              //myDivider(),
              // Column(
              //   children: [
              //     Row(
              //       children: const [
              //         Expanded(
              //           child: Padding(
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: horizontalPadding),
              //             child: Text('Type',
              //                 style: TextStyle(fontWeight: FontWeight.bold)),
              //           ),
              //         )
              //       ],
              //     ),
              //     const MyTextField2(),
              //   ],
              // ),

              SizedBox(
                height: 1.0.h,
              ),
              Row(children: const [
                Text('Features', style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
              myDivider(),
              Container(
                // height: 40.h,
                child:
                    Obx(() => addPropertyController.loadingGetFacilities.value
                        ? loader
                        : ListView.builder(
                            physics: const PageScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: addPropertyController
                                .getFeaturesModel.data!.length,
                            itemBuilder: (_, index) {
                              return Obx(() => Row(children: [
                                    Checkbox(
                                        value: addPropertyController.sindex
                                            .contains(addPropertyController
                                                .getFeaturesModel
                                                .data![index]
                                                .id),
                                        onChanged: (value) {
                                          addPropertyController.sindex.contains(
                                                  addPropertyController
                                                      .getFeaturesModel
                                                      .data![index]
                                                      .id)
                                              ? addPropertyController.sindex
                                                  .remove(addPropertyController
                                                      .getFeaturesModel
                                                      .data![index]
                                                      .id)
                                              : addPropertyController.sindex
                                                  .add(addPropertyController
                                                      .getFeaturesModel
                                                      .data![index]
                                                      .id);
                                        }),
                                    Text(addPropertyController
                                        .getFeaturesModel.data![index].name
                                        .toString())
                                  ]));
                            },
                          )),
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
                          child: Text('Upload images of property',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 224, 222, 222),
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Add Photos'),
                              SizedBox(
                                width: 2.w,
                              ),
                              const Icon(Icons.image)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  imageFileList!.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            "Your images are here",
                            style: TextStyle(
                                color: Color.fromARGB(255, 136, 135, 135)),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade200,
                          ),
                          padding: EdgeInsets.all(1.h),
                          height: Get.height * .3,
                          width: Get.width * 5,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: imageFileList?.length == null
                                ? 0
                                : imageFileList!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.file(
                                    fit: BoxFit.cover,
                                    File(imageFileList![index].path)),
                              );
                            },
                          ),
                        ),
                  imageFileList!.isEmpty
                      ? const SizedBox()
                      : ElevatedButton(
                          onPressed: () {
                            imageFileList!.length = 0;
                            setState(() {});
                          },
                          child: const Text("Clear"))
                ],
              ),
              myDivider(),

              Column(
                children: [

                  Padding(
                      padding: EdgeInsets.only(top: 1.h, bottom: 3.h),
                      child: Obx(() => addPropertyController
                              .loadingAddProperty.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.appthem,
                              ),
                            )
                          : addPropertyController
                                      .errorLoadingAddProperty.value !=
                                  ""
                              ? Container(
                                  child: Column(children: [
                                    IconButton(
                                        onPressed: () {
                                          addPropertyController.getAddProperty(
                                              titleController.text,
                                              dispController.text,
                                              contentController.text,
                                              sectorController.text,
                                              streetNoController.text,
                                              plotNoController.text,
                                              locatController.text,
                                              addPropertyController
                                                  .selectedValueCityId.value
                                                  .toString(),
                                              priceController.text,
                                              squareController.text,
                                              selectedFloor.toString(),
                                              selectedBathroom,
                                              selectedBedroom,
                                              addPropertyController
                                                  .selectedPropertyCategory
                                                  .value,
                                              iWantTo,
                                              addPropertyController.sindex, //
                                              facilities,
                                              base64List,
                                              addedFacilityList);
                                        },
                                        icon: const Icon(Icons.refresh)),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    Text(addPropertyController
                                        .errorLoadingAddProperty.value)
                                  ]),
                                )
                              //  showDialogFunc(
                              //     context,
                              //     addPropertyController
                              //         .errorLoadingAddProperty.value)
                              : CustomButton(
                                  // isloading:
                                  //     addPropertyController.loadingAddProperty.value,
                                  onPressed: () {
                                    addPropertyController.getAddProperty(
                                        titleController.text,
                                        dispController.text,
                                        contentController.text,
                                        sectorController.text,
                                        streetNoController.text,
                                        plotNoController.text,
                                        locatController.text,
                                        addPropertyController
                                            .selectedValueCityId.value
                                            .toString(),
                                        priceController.text,
                                        squareController.text,
                                        selectedFloor.toString(),
                                        selectedBathroom,
                                        selectedBedroom,
                                        addPropertyController
                                            .selectedPropertyCategory.value,
                                        iWantTo,
                                        addPropertyController.sindex, //
                                        facilities,
                                        base64List,
                                        addedFacilityList);

                                    // setState(() {
                                    //   // AddPropertyServices.addPropertyAPI(
                                    //   //     name: titleController.text,
                                    //   //     disp: dispController.text,
                                    //   //     content: contentController.text,
                                    //   //     cityId: addPropertyController
                                    //   //         .selectedValueCityId.value
                                    //   //         .toString(),
                                    //   //     //type sell or rent
                                    //   //     typeId: iWantTo,
                                    //   //     categoryId: selectedPropertyCategory,
                                    //   //     location: locatController.text,
                                    //   //     block: sectorController.text,
                                    //   //     plotNo: plotNoController.text,
                                    //   //     streetNo: streetNoController.text,
                                    //   //     price: priceController.text,
                                    //   //     square: squareController.text,
                                    //   //     bedroomNo: selectedBedroom,
                                    //   //     bathNo: selectedBathroom,
                                    //   //     numberFloor: selectedFloor.toString(),
                                    //   //     feature: addFeaturesList,
                                    //   //     imageList: base64List

                                    //   //     // titleController.text,
                                    //   //     // dispController.text,
                                    //   //     // contentController.text,
                                    //   //     // sectorController.text,
                                    //   //     // streetNoController.text,
                                    //   //     // plotNoController.text,
                                    //   //     // locatController.text,
                                    //   //     // cityController.text,
                                    //   //     // stateController.text,
                                    //   //     // priceController.text,
                                    //   //     // currController.text,
                                    //   //     // squareController.text,
                                    //   //     // floorNoController.text,
                                    //   //     // selectedBathroom,
                                    //   //     // selectedBedroom,
                                    //   //     // categoryController.text,
                                    //   //     // typeController.text,
                                    //   //     // features,
                                    //   //     // facilities
                                    //   //     );
                                    // });
                                  },
                                  text: 'Add Property'))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  final titleController = TextEditingController();
  final dispController = TextEditingController();
  final contentController = TextEditingController();
  final typeController = TextEditingController();
  final locatController = TextEditingController();
  final cityController = TextEditingController();
  final sectorController = TextEditingController();
  final plotNoController = TextEditingController();
  final streetNoController = TextEditingController();
  final priceController = TextEditingController();
  final squareController = TextEditingController();
  final currController = TextEditingController();
  final distanceController = TextEditingController();
  final stateController = TextEditingController();
  final imgpath = TextEditingController();
  List<Feature> features = [];

  //City Alert Dialog Box
  Future<void> _showCityList() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        int cityid = 0;
        dynamic cityname = '';
        return AlertDialog(
          title: const Text('Select City'),
          content: SizedBox(
              height: Get.height * .3,
              width: 100,

              child: ListView.builder(
                //scrollDirection: Axis.horizontal,
                itemCount: citiese.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () {
                        cityname = citiese[index];
                        addPropertyController.selectedValueCityId.value = index;
                        // addPropertyController.selectedValueCity.value =
                        //     citiese[index];
                      },
                      child: Obx(() => Chip(
                            backgroundColor: addPropertyController
                                        .selectedValueCityId.value ==
                                    index
                                ? AppColors.appthem
                                : Colors.grey[200],
                            label: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(citiese[index].toString(),
                                  style: TextStyle(
                                      color: addPropertyController
                                                  .selectedValueCityId.value ==
                                              index
                                          ? Colors.white
                                          : Colors.black)),
                            ),
                          )),
                    ),
                  );
                },
              )),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.black))),
              ),
              child: const Text(
                'Submit',
              ),
              onPressed: () {
                addPropertyController.selectedValueCity.value = cityname;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

//bottom sheet for image
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
      setState(() {});

//single image path print
      print("list===== ${imageFileList![0].path}");

//add all base64
      for (int i = 0; i <= imageFileList!.length; i++) {
        final bytes = Io.File(imageFileList![i].path).readAsBytesSync();
        String img64 = base64Encode(bytes);
        // print(" convert64-----$img64--===}");
        base64List.add("data:image/jpeg;base64,$img64");
        print(" listBase----${base64List[0]}---");
      }
    }
    print("Image List Length:${imageFileList!.length}");
    setState(() {});
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return SizedBox(
            height: 170,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // GestureDetector(
                //   onTap: (() {
                //     cameraimg();
                //   }),
                //   child: Column(
                //     children: [
                //       Mycontainer(Icons.camera_alt),
                //       Text(
                //         'Camera',
                //         style: AppTextStyles.labelSmall.copyWith(
                //             fontSize: 13.sp, fontWeight: FontWeight.bold),
                //       )
                //     ],
                //   ),
                // ),

                GestureDetector(
                    onTap: () {
                      selectImages();
                      Get.back();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Mycontainer(Icons.image),
                        Text(
                          'Gallery',
                          style: AppTextStyles.labelSmall.copyWith(
                              fontSize: 13.sp, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              ],
            ),
          );
        });
  }

  Mycontainer(icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      // height: 50,
      // width: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: AppColors.colorblack)),
      child: Padding(
        padding: const EdgeInsets.all(23),
        child: Icon(
          icon,
          size: 40,
        ),
      ),
    );
  }
}

class ListFacility {
  int? id;
  String? name;
  String? distance;
  ListFacility({
    this.id,
    this.name,
    this.distance,
  });
}
