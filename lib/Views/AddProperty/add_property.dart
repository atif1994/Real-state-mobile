// ignore_for_file: avoid_print, non_constant_identifier_names, avoid_unnecessary_containers

import 'dart:convert';
import 'dart:io';
import 'dart:io' as Io;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prologic_29/My%20Widgets/my_button.dart';
import 'package:prologic_29/My%20Widgets/my_text_field_2.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:prologic_29/data/Controllers/addProperty_Controller.dart';
import 'package:prologic_29/data/Controllers/property_controllers/featured_property_controller.dart';
import 'package:prologic_29/data/Models/addproperty_model/postDataProperty_model.dart';
import 'package:sizer/sizer.dart';

import '../../data/Services/constants.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/styles/app_textstyles.dart';

import '../newsFeeed/newsfeed.dart';

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

  int iWantTo = 0;

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

  int selectedPropertyCategory = 0;
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
  List<dynamic> featuresList = [
    'Balcony',
    'Security Staff',
    'Parking Area',
    'Electricity',
    'Accessible by Road',
    'Sui Gas'
  ];
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
      citiese.add(cityListController.citiesModel.data![i].name ?? "");
    }
  }

  List<String> base64List = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        title: Text("Add Property", style: AppTextStyles.appbar),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Get.to(() => const NewsFeed());
            },
          ),
        ],
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
                      CupertinoSlidingSegmentedControl<int>(
                          groupValue: iWantTo,
                          padding: const EdgeInsets.all(5),
                          //thumbColor: primaryColor,
                          thumbColor: AppColors.appthem,
                          children: {
                            0: Text('Sell',
                                style: TextStyle(
                                  color: iWantTo == 0
                                      ? AppColors.colorWhite
                                      : AppColors.appthem,
                                )),
                            1: Text('Rent',
                                style: TextStyle(
                                  color: iWantTo == 1
                                      ? AppColors.colorWhite
                                      : AppColors.appthem,
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
                          )
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
                            ListView.builder(
                              primary: true,
                              shrinkWrap: false,
                              scrollDirection: Axis.horizontal,
                              itemCount: homePropertyTypeList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedPropertyCategory = index;
                                      });
                                    },
                                    child: Chip(
                                      backgroundColor:
                                          selectedPropertyCategory == index
                                              ? primaryColor
                                              : Colors.grey[200],
                                      label: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Text(
                                              homePropertyTypeList[index],
                                              style: TextStyle(
                                                  color:
                                                      selectedPropertyCategory ==
                                                              index
                                                          ? Colors.white
                                                          : Colors.black))),
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
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedPropertyCategory = index;
                                      });
                                    },
                                    child: Chip(
                                      backgroundColor:
                                          selectedPropertyCategory == index
                                              ? primaryColor
                                              : Colors.grey[200],
                                      label: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(plotPropertyTypeList[index],
                                            style: TextStyle(
                                                color:
                                                    selectedPropertyCategory ==
                                                            index
                                                        ? Colors.white
                                                        : Colors.black)),
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
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedPropertyCategory = index;
                                      });
                                    },
                                    child: Chip(
                                      backgroundColor:
                                          selectedPropertyCategory == index
                                              ? primaryColor
                                              : Colors.grey[200],
                                      label: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(
                                            commercialPropertyTypeList[index],
                                            style: TextStyle(
                                                color:
                                                    selectedPropertyCategory ==
                                                            index
                                                        ? Colors.white
                                                        : Colors.black)),
                                      ),
                                    ),
                                  ),
                                );
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
                child: facilitiesList.isEmpty
                    ? const Center(
                        child: Text("Add Some Facilities"),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: facilitiesList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: ListTile(
                                  title: Row(
                                    children: [
                                      Text(facilitiesList[index]),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text("KM: ${kmList[index]}"),
                                    ],
                                  ),
                                  trailing: GestureDetector(
                                    child: const Icon(Icons.delete),
                                    onTap: () {
                                      kmList.removeAt(index);
                                      facilitiesList.removeAt(index);
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
                  DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: const Color.fromARGB(255, 241, 239, 239),
                        border: Border.all(
                            color: const Color.fromARGB(255, 168, 166, 166),
                            width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: DropdownButton(
                          isExpanded: true,
                          value: dropdownvalue22,
                          items: facilities.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue22 = newValue!;
                            });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          facilitiesList.add(dropdownvalue22);
                          kmList.add(km);
                        });
                      }
                    },
                    text: 'Add New'),
              ),
              SizedBox(
                height: 2.0.h,
              ),
              SizedBox(
                height: 1.0.h,
              ),
              Row(children: const [
                Text('Features', style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
              myDivider(),
              Row(children: [
                Checkbox(
                    value: checkBoxValue1,
                    onChanged: (value) {
                      setState(() {
                        checkBoxValue1 = value!;
                        if (checkBoxValue1 == true) {
                          addFeaturesList.add(featuresList[0]);
                        } else {
                          addFeaturesList.remove("Balcony");
                        }
                      });
                    }),
                const Text('Balcony')
              ]),
              Row(children: [
                Checkbox(
                    value: checkBoxValue2,
                    onChanged: (value) {
                      setState(() {
                        checkBoxValue2 = value!;
                        if (value == true) {
                          addFeaturesList.add(featuresList[1]);
                        } else {
                          addFeaturesList.remove('Security Staff');
                        }
                      });
                    }),
                const Text('Security Staff')
              ]),
              Row(children: [
                Checkbox(
                    value: checkBoxValue3,
                    onChanged: (value) {
                      setState(() {
                        checkBoxValue3 = value!;
                        if (value == true) {
                          addFeaturesList.add(featuresList[2]);
                        } else {
                          addFeaturesList.remove('Parking Area');
                        }
                      });
                    }),
                const Text('Parking Area')
              ]),
              Row(children: [
                Checkbox(
                    value: checkBoxValue4,
                    onChanged: (value) {
                      setState(() {
                        checkBoxValue4 = value!;
                        if (value == true) {
                          addFeaturesList.add(featuresList[3]);
                        } else {
                          addFeaturesList.remove('Electricity');
                        }
                      });
                    }),
                const Text('Electricity')
              ]),
              Row(children: [
                Checkbox(
                    value: checkBoxValue5,
                    onChanged: (value) {
                      setState(() {
                        checkBoxValue5 = value!;
                        if (value == true) {
                          addFeaturesList.add(featuresList[4]);
                        } else {
                          addFeaturesList.remove('Accessible by Road');
                        }
                      });
                    }),
                const Text('Accessible by Road')
              ]),
              Row(children: [
                Checkbox(
                    value: checkBoxValue6,
                    onChanged: (value) {
                      setState(() {
                        checkBoxValue6 = value!;
                        if (value == true) {
                          addFeaturesList.add(featuresList[5]);
                          print("Add Feature =====>>>$addFeaturesList");
                        } else {
                          addFeaturesList.remove('Sui Gas');
                          print("remove Feature =====>>>$addFeaturesList");
                        }
                      });
                    }),
                const Text('Sui Gas'),
              ]),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Add Photos'),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Icon(Icons.image)
                        ],
                      ),
                    ),
                  ),
                  imageFileList!.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text("Please select image"),
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
                                              selectedPropertyCategory,
                                              iWantTo,
                                              addFeaturesList,
                                              facilities,
                                              base64List);
                                        },
                                        icon: const Icon(Icons.refresh)),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    Text(addPropertyController
                                        .errorLoadingAddProperty.value)
                                  ]),
                                )
                              : CustomButton(
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
                                        selectedPropertyCategory,
                                        iWantTo,
                                        addFeaturesList,
                                        facilities,
                                        base64List);
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
                        addPropertyController.selectedValueCityId.value = index;
                        addPropertyController.selectedValueCity.value =
                            citiese[index];
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
                GestureDetector(
                    onTap: () {
                      selectImages();
                      Get.back();
                    },
                    child: Column(
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
