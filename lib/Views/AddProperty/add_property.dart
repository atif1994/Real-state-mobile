import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/My%20Widgets/my_button.dart';
import 'package:prologic_29/My%20Widgets/my_text_field_2.dart';
import 'package:prologic_29/data/Controllers/addProperty_Controller.dart';
import 'package:prologic_29/data/Controllers/property_controllers/featured_property_controller.dart';
import 'package:prologic_29/data/Models/addproperty_model/postDataProperty_model.dart';
import 'package:sizer/sizer.dart';

import '../../data/Services/constants.dart';
import '../../data/Services/property_services/addproperty_services.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/styles/app_textstyles.dart';

import 'all_property.dart';

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
      citiese.add(cityListController.citiesModel.data![i]?.name ?? "");
    }
  }

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
              Get.to(() => const AllProperty());
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
                      Obx(() => ListTile(
                            leading: const Icon(Icons.location_on_outlined),
                            title: Text(
                                addPropertyController.selectedValueCity.value),
                            onTap: () => _showCityList(),
                          ))
                    ],
                  ),

                  // Row(
                  //   children: [
                  //     const Icon(Icons.location_on_outlined),
                  //     Expanded(
                  //         child: Padding(
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: horizontalPadding),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           const Text('City',
                  //               textScaleFactor: 1.25,
                  //               style: TextStyle(fontWeight: FontWeight.bold)),
                  //           //   Text('Islamabad',
                  //           //       style: TextStyle(color: AppColors.appthem)),
                  //           // Padding(
                  //           //   padding: const EdgeInsets.all(10),
                  //           //   child: DropdownButton(
                  //           //       isExpanded: true,
                  //           //       value: dropdownvalue,
                  //           //       items: items.map((String items) {
                  //           //         return DropdownMenuItem(
                  //           //           value: items,
                  //           //           child: Text(items.toString()),
                  //           //         );
                  //           //       }).toList(),
                  //           //       onChanged: (String? newValue) {
                  //           //         setState(() {
                  //           //           selectedValueCity = newValue!;
                  //           //         });
                  //           //       }),
                  //           // ),

                  //         ],
                  //       ),
                  //     )),
                  //     const Icon(Icons.arrow_forward_ios),
                  //   ],
                  // ),
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
                          // facilitiesList.clear();
                          // kmList.clear();
                        });
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
                  TextButton(onPressed: () {}, child: const Text('Add Photos'))
                ],
              ),
              myDivider(),
              // Row(
              //   children: const [
              //     Text('Category',
              //         style: TextStyle(fontWeight: FontWeight.bold)),
              //   ],
              // ),
              // SizedBox(
              //   height: 1.5.h,
              // ),
              Column(
                children: [
                  // DecoratedBox(
                  //   // decoration: CustomDecorations.mainCon,
                  //   decoration: BoxDecoration(

                  //       // borderRadius: BorderRadius.circular(5),
                  //       borderRadius:
                  //           const BorderRadius.all(Radius.circular(10)),
                  //       color: const Color.fromARGB(255, 241, 239, 239),
                  //       border: Border.all(
                  //           color: const Color.fromARGB(255, 168, 166, 166),
                  //           width: 1)),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: DropdownButton(
                  //       isExpanded: true,
                  //       // Initial Value
                  //       value: dropdownvalue3,

                  //       // Down Arrow Icon
                  //       icon: const Icon(Icons.keyboard_arrow_down),

                  //       // Array list of items
                  //       items: newitems.map((String items) {
                  //         return DropdownMenuItem(
                  //           value: items,
                  //           child: Text(items),
                  //         );
                  //       }).toList(),
                  //       // After selecting the desired option,it will
                  //       // change button value to selected value
                  //       onChanged: (String? newValue) {
                  //         setState(() {
                  //           dropdownvalue3 = newValue!;
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // ),

                  //  myDivider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: MyButton(
                        onTap: () {
                          setState(() {
                            AddPropertyServices.addPropertyAPI(
                              name: titleController.text,
                              disp: dispController.text,
                              content: contentController.text,
                              cityId: addPropertyController
                                  .selectedValueCityId.value
                                  .toString(),
                              //type sell or rent
                              typeId: iWantTo,
                              categoryId: selectedPropertyCategory,
                              location: locatController.text,
                              block: sectorController.text,
                              plotNo: plotNoController.text,
                              streetNo: streetNoController.text,
                              price: priceController.text,
                              square: squareController.text,
                              bedroomNo: selectedBedroom,
                              bathNo: selectedBathroom,
                              numberFloor: selectedFloor.toString(),
                              feature: addFeaturesList,

                              // titleController.text,
                              // dispController.text,
                              // contentController.text,
                              // sectorController.text,
                              // streetNoController.text,
                              // plotNoController.text,
                              // locatController.text,
                              // cityController.text,
                              // stateController.text,
                              // priceController.text,
                              // currController.text,
                              // squareController.text,
                              // floorNoController.text,
                              // selectedBathroom,
                              // selectedBedroom,
                              // categoryController.text,
                              // typeController.text,
                              // features,
                              // facilities
                            );
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
}
