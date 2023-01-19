import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/My%20Widgets/my_button.dart';
import 'package:prologic_29/My%20Widgets/my_text_field_2.dart';
import 'package:prologic_29/data/Controllers/addProperty_Controller.dart';
import 'package:prologic_29/data/Models/postDataProperty_model.dart';
import 'package:prologic_29/data/Services/property_services/addproperty_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  String selectedPropertyType = '';

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
  String selectedBedroom = 'Any';

  List<String> bathroomList = ['Any', '1', '2', '3', '4', '5', '6+'];
  String selectedBathroom = 'Any';
  List<String> floorList = [
    'Any',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6+',
  ];
  String selectedFloor = 'Any';
  var postDataproperty = PostDataProperty();
  @override
  void initState() {
    // TODO: implement onInit
    super.initState();
    tabController = TabController(length: 3, vsync: this);

    minPriceRangeController.text = minPriceRange.round().toString();
    maxPriceRangeController.text = maxPriceRange.round().toString();

    minAreaRangeController.text = minAreaRange.round().toString();
    maxAreaRangeController.text = maxAreaRange.round().toString();
  }

  String dropdownvalue2 = 'Select Facility';
  var facilities = [
    'Select Facility',
    'Mosque Nearby',
    'Play Ground',
    'Park',
  ];
  void postDataSharedPref(String title) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(title, title);
  }

  var addPropertyController = Get.put(AddProperrtyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        title: Text("Add Property", style: AppTextStyles.appbar),
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
                        onChanged: (title) {
                          setState(() {
                            postDataSharedPref(title);
                            postDataproperty.name = title;
                            print("Post DAta ======${postDataproperty.name}");
                          });
                        },
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
                        onChanged: (disp) {
                          setState(() {
                            postDataSharedPref(disp);
                          });
                        },
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
                      const MyTextField2(),
                    ],
                  ),
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Text('Islamabad',
                                style: TextStyle(color: AppColors.appthem)),
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
                                        selectedPropertyType =
                                            homePropertyTypeList[index];
                                      });
                                    },
                                    child: Chip(
                                      backgroundColor: selectedPropertyType ==
                                              homePropertyTypeList[index]
                                          ? primaryColor
                                          : Colors.grey[200],
                                      label: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Text(
                                              homePropertyTypeList[index],
                                              style: TextStyle(
                                                  color: selectedPropertyType ==
                                                          homePropertyTypeList[
                                                              index]
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
                                        selectedPropertyType =
                                            plotPropertyTypeList[index];
                                      });
                                    },
                                    child: Chip(
                                      backgroundColor: selectedPropertyType ==
                                              plotPropertyTypeList[index]
                                          ? primaryColor
                                          : Colors.grey[200],
                                      label: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(plotPropertyTypeList[index],
                                            style: TextStyle(
                                                color: selectedPropertyType ==
                                                        plotPropertyTypeList[
                                                            index]
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
                                        selectedPropertyType =
                                            commercialPropertyTypeList[index];
                                      });
                                    },
                                    child: Chip(
                                      backgroundColor: selectedPropertyType ==
                                              commercialPropertyTypeList[index]
                                          ? primaryColor
                                          : Colors.grey[200],
                                      label: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(
                                            commercialPropertyTypeList[index],
                                            style: TextStyle(
                                                color: selectedPropertyType ==
                                                        commercialPropertyTypeList[
                                                            index]
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
                      const MyTextField2(),
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
                      const MyTextField2(),
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
                      const MyTextField2(),
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
                      const MyTextField2(),
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
                        controller: minPriceRangeController,
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
                        controller: minAreaRangeController,
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
                              child: Text('Currency',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
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
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: bedroomList
                            .map((e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedBedroom = e;
                                      });
                                    },
                                    child: Chip(
                                      backgroundColor: selectedBedroom == e
                                          ? AppColors.appthem
                                          : Colors.grey[200],
                                      label: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: selectedBedroom == e
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
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          )),
                        ],
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: bathroomList
                            .map((e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedBathroom = e;
                                      });
                                    },
                                    child: Chip(
                                      backgroundColor: selectedFloor == e
                                          ? AppColors.appthem
                                          : Colors.grey[200],
                                      label: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: selectedFloor == e
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
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: floorList
                            .map((e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedFloor = e;
                                      });
                                    },
                                    child: Chip(
                                      backgroundColor: selectedFloor == e
                                          ? AppColors.appthem
                                          : Colors.grey[200],
                                      label: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: selectedFloor == e
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
                          value: dropdownvalue2,
                          items: facilities.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue2 = newValue!;
                            });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Kilometer (km)',
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onChanged: (value) {
                      // do something
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: MyButton(onTap: () {}, text: 'Add New'),
              ),
              SizedBox(
                height: 2.0.h,
              ),
              Row(
                children: [
                  const Text('Type',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 3.0.h,
                  ),
                ],
              ),
              myDivider(),
              Column(
                children: [
                  Row(
                    children: const [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding),
                          child: Text('Type',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                  const MyTextField2(),
                ],
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
                      print(value);
                      setState(() {
                        checkBoxValue1 = value!;
                      });
                    }),
                const Text('Balcony')
              ]),
              Row(children: [
                Checkbox(
                    value: checkBoxValue2,
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        checkBoxValue2 = value!;
                      });
                    }),
                const Text('Security Staff')
              ]),
              Row(children: [
                Checkbox(
                    value: checkBoxValue3,
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        checkBoxValue3 = value!;
                      });
                    }),
                const Text('Parking Area')
              ]),
              Row(children: [
                Checkbox(
                    value: checkBoxValue4,
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        checkBoxValue4 = value!;
                      });
                    }),
                const Text('Electricity')
              ]),
              Row(children: [
                Checkbox(
                    value: checkBoxValue5,
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        checkBoxValue5 = value!;
                      });
                    }),
                const Text('Accessible by Road')
              ]),
              Row(children: [
                Checkbox(
                    value: checkBoxValue6,
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        checkBoxValue6 = value!;
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
                  TextButton(onPressed: () {}, child: const Text('Add Photos'))
                ],
              ),
              myDivider(),
              Row(
                children: const [
                  Text('Category',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Column(
                children: [
                  DecoratedBox(
                    // decoration: CustomDecorations.mainCon,
                    decoration: BoxDecoration(

                        // borderRadius: BorderRadius.circular(5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: const Color.fromARGB(255, 241, 239, 239),
                        border: Border.all(
                            color: const Color.fromARGB(255, 168, 166, 166),
                            width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        isExpanded: true,
                        // Initial Value
                        value: dropdownvalue3,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: newitems.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue3 = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  myDivider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: MyButton(
                        onTap: () {
                          setState(() {
                            AddPropertyServices.addPropertyAPI();
                          });
                        },
                        text: 'Add Property'),
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
