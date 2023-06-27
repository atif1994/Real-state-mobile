import 'dart:convert';
import 'dart:io';
import 'dart:io' as Io;
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

import '../../../../data/Controllers/Shared Inventory Agent/edit_property_controller.dart';
import '../../../../data/Controllers/Shared Inventory Agent/get_property_detail.dart';
import '../../../../data/Services/constants.dart';
import '../../../../utils/constants/app_urls.dart';
import '../../../../utils/constants/appcolors.dart';
import '../../../../utils/styles/app_textstyles.dart';

class EditProperty extends StatefulWidget {
  int? pid;
  EditProperty({Key? key, required this.pid}) : super(key: key);

  @override
  State<EditProperty> createState() => _EditPropertyState();
}

class _EditPropertyState extends State<EditProperty>
    with SingleTickerProviderStateMixin {
  var getpropertydetail = Get.put(PropertyDetailController());
  var addpropertycontroller = Get.put(AddProperrtyController());
  var editpropertycontroller = Get.put(EditProperrtyController());
  var addfacilities = ListFacility();
  bool checkBoxValue1 = false;
  bool checkBoxValue2 = false;
  bool checkBoxValue3 = false;
  bool checkBoxValue4 = false;
  bool checkBoxValue5 = false;
  bool checkBoxValue6 = false;
  String fname = '';
  String dropdownvalue3 = 'Apartment';
  final _formKey = GlobalKey<FormState>();
  // List of items in our dropdown menu
  var items = [
    'PKR',
    'USD',
  ];
  String? selectedValue;

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
  List<Feature> features = [];
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

  List<String> bathroomList = ['Any', '1', '2', '3', '4', '5', '6+'];
  List<String> floorList = [
    'Any',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6+',
  ];

  var postDataproperty = PostDataProperty();
  @override
  void initState() {
    // TODO: implement onInit
    // getCitiese();
    super.initState();

    tabController = TabController(length: 3, vsync: this);
    //addpropertycontroller.selectedValueCity.value

    // addPropertyController.selectedValueCity.value =
    //     getpropertydetail.propertybyIDmodel.data?.city?.name ?? '';
    minPriceRangeController.text = minPriceRange.round().toString();
    maxPriceRangeController.text = maxPriceRange.round().toString();
    minAreaRangeController.text = minAreaRange.round().toString();
    maxAreaRangeController.text = maxAreaRange.round().toString();
  }

  var facilities = [
    'Select Facility',
    'Mosque Nearby',
    'Play Ground',
    'Park',
  ];
  // List addedFeaturesList = [];
  // List<dynamic> featuresList = [
  //   'Balcony',
  //   'Security Staff',
  //   'Parking Area',
  //   'Electricity',
  //   'Accessible by Road',
  //   'Sui Gas'
  // ];

  TextEditingController kilometercontroller = TextEditingController();
  int? facilityid;
  String? facilityname;
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

  // void getCitiese() async {
  //   for (int i = 0; i < cityListController.citiesModel.data!.length; i++) {
  //     citiese.add(cityListController.citiesModel.data![i].name ?? "");
  //   }
  // }

  List<String> base64List = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        title: InkWell(
            onTap: () {
              print(getpropertydetail.networkimglst);
            },
            child: Text("Edit Property", style: AppTextStyles.appbar)),
        // actions: <Widget>[
        // IconButton(
        //   icon: const Icon(Icons.add),
        //   onPressed: () {
        //     Get.to(() => const NewsFeed());
        //   },
        // ),
        // ],
      ),
      body: Obx(() => getpropertydetail.loadingPropertyByID.value
          ? loader
          : getpropertydetail.errorLoadingPropertyByID.value != ''
              ? Center(
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              getpropertydetail.getPropertydetail(widget.pid!);
                            },
                            icon: const Icon(
                              Icons.refresh,
                              color: AppColors.appthem,
                            )),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Text(getpropertydetail.errorLoadingPropertyByID.value),
                      ],
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: horizontalPadding),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.currency_exchange),
                                const Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: horizontalPadding),
                                  child: Text('Type',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                )),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: primaryColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      getpropertydetail
                                          .propertybyIDmodel.data!.type!.name
                                          .toString(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                )
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
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    )
                                  ],
                                ),
                                MyTextField2(
                                  controller: getpropertydetail.titleController,
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
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    )
                                  ],
                                ),
                                MyTextField2(
                                  controller: getpropertydetail.dispController,
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
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ],
                                ),
                                Obx(() => addPropertyController
                                        .loadingAddProperty.value
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                        color: AppColors.appthem,
                                      ))
                                    // : addPropertyController
                                    //             .errorLoadingAddProperty
                                    //             .value !=
                                    //         ''
                                    //     ? Center(
                                    //         child: Expanded(
                                    //           child: Column(
                                    //             mainAxisAlignment:
                                    //                 MainAxisAlignment.center,
                                    //             children: [
                                    //               IconButton(
                                    //                   onPressed: () {
                                    //                     // getCitiese();
                                    //                   },
                                    //                   icon: const Icon(
                                    //                     Icons.refresh,
                                    //                     color:
                                    //                         AppColors.appthem,
                                    //                   )),
                                    //               SizedBox(
                                    //                 height: 1.0.h,
                                    //               ),
                                    //               Text(addPropertyController
                                    //                   .errorLoadingAddProperty
                                    //                   .value),
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       )
                                    : ListTile(
                                        leading: const Icon(
                                            Icons.location_on_outlined),
                                        title: Text(getpropertydetail
                                            .selectedValueCity.value),
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
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      )
                                    ],
                                  ),
                                  TabBar(
                                      controller: tabController,
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
                                        controller: tabController,
                                        children: [
                                          Obx(() => addPropertyController
                                                  .loadingPropertyCategory.value
                                              ? loader
                                              : ListView.builder(
                                                  primary: true,
                                                  shrinkWrap: false,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: addpropertycontroller
                                                      .propertycategoriesModel
                                                      .data!
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            selectedPropertyCategory =
                                                                index;
                                                          });
                                                        },
                                                        child: Chip(
                                                          backgroundColor:
                                                              selectedPropertyCategory ==
                                                                      index
                                                                  ? primaryColor
                                                                  : Colors.grey[
                                                                      200],
                                                          label: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      5),
                                                              child: Text(
                                                                  addpropertycontroller
                                                                      .propertycategoriesModel
                                                                      .data![
                                                                          index]
                                                                      .name
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: selectedPropertyCategory ==
                                                                              index
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .black))),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                )),
                                          ListView.builder(
                                            primary: true,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                plotPropertyTypeList.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedPropertyCategory =
                                                          index;
                                                    });
                                                  },
                                                  child: Chip(
                                                    backgroundColor:
                                                        selectedPropertyCategory ==
                                                                index
                                                            ? primaryColor
                                                            : Colors.grey[200],
                                                    label: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5),
                                                      child: Text(
                                                          plotPropertyTypeList[
                                                              index],
                                                          style: TextStyle(
                                                              color: selectedPropertyCategory ==
                                                                      index
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black)),
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
                                            itemCount:
                                                commercialPropertyTypeList
                                                    .length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedPropertyCategory =
                                                          index;
                                                    });
                                                  },
                                                  child: Chip(
                                                    backgroundColor:
                                                        selectedPropertyCategory ==
                                                                index
                                                            ? primaryColor
                                                            : Colors.grey[200],
                                                    label: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5),
                                                      child: Text(
                                                          commercialPropertyTypeList[
                                                              index],
                                                          style: TextStyle(
                                                              color: selectedPropertyCategory ==
                                                                      index
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black)),
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
                                        child: Text(
                                            'Society information and location',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    )
                                  ],
                                ),
                                MyTextField2(
                                  controller: getpropertydetail.locatController,
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
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    )
                                  ],
                                ),
                                MyTextField2(
                                  controller:
                                      getpropertydetail.sectorController,
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
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    )
                                  ],
                                ),
                                MyTextField2(
                                  controller:
                                      getpropertydetail.plotNoController,
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
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    )
                                  ],
                                ),
                                MyTextField2(
                                  controller:
                                      getpropertydetail.streetNoController,
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
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    )
                                  ],
                                ),
                                MyTextField2(
                                  controller: getpropertydetail.priceController,
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
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ],
                                ),
                                MyTextField2(
                                  controller:
                                      getpropertydetail.squareController,
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
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    )
                                  ],
                                ),
                                //define
                                Padding(
                                  padding: const EdgeInsets.only(right: 180),
                                  child: DropdownButton(
                                    // Initial Value
                                    value: getpropertydetail.dropdownvalue,

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
                                        getpropertydetail.dropdownvalue =
                                            newValue!;
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              getpropertydetail
                                                  .selectedBedroom = index;
                                            });
                                          },
                                          child: Chip(
                                            backgroundColor: getpropertydetail
                                                        .selectedBedroom ==
                                                    index
                                                ? AppColors.appthem
                                                : Colors.grey[200],
                                            label: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Text(bedroomList[index],
                                                  style: TextStyle(
                                                      color: getpropertydetail
                                                                  .selectedBedroom ==
                                                              index
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              getpropertydetail
                                                  .selectedBathroom = index;
                                            });
                                          },
                                          child: Chip(
                                            backgroundColor: getpropertydetail
                                                        .selectedBathroom ==
                                                    index
                                                ? AppColors.appthem
                                                : Colors.grey[200],
                                            label: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Text(bathroomList[index],
                                                  style: TextStyle(
                                                      color: getpropertydetail
                                                                  .selectedBathroom ==
                                                              index
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              getpropertydetail.selectedFloor =
                                                  index;
                                            });
                                          },
                                          child: Chip(
                                            backgroundColor: getpropertydetail
                                                        .selectedFloor ==
                                                    index
                                                ? AppColors.appthem
                                                : Colors.grey[200],
                                            label: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Text(floorList[index],
                                                  style: TextStyle(
                                                      color: getpropertydetail
                                                                  .selectedFloor ==
                                                              index
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        myDivider(),
                        SizedBox(
                          // height: 15.h,
                          width: 120.w,
                          child: Obx(() => getpropertydetail.listfac.isEmpty
                              ? const Center(
                                  child: Text("Add Some Facilities"),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const PageScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: getpropertydetail.listfac.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      color: primaryColor.shade300,
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: ListTile(
                                            title: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8.0.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(getpropertydetail
                                                      .listfac[index].name
                                                      .toString()),
                                                  Text(
                                                      "KM: ${getpropertydetail.listfac[index].distance}"),
                                                ],
                                              ),
                                            ),
                                            trailing: GestureDetector(
                                              child: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                              onTap: () {
                                                // kmList.removeAt(index);
                                                // facilitiesList.removeAt(index);
                                                // addedFacilityList
                                                //     .removeAt(index);
                                                getpropertydetail.listfac
                                                    .removeAt(index);
                                                setState(() {});
                                              },
                                            ),
                                          )),
                                    );
                                  },
                                )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Obx(() => addpropertycontroller
                                    .loadingGetFacilities.value
                                ? loader
                                : DecoratedBox(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        color: const Color.fromARGB(
                                            255, 241, 239, 239),
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 168, 166, 166),
                                            width: 1)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      child: DropdownButton<String>(
                                        value: addpropertycontroller
                                            .dropdownvalue22.value,
                                        items: addpropertycontroller
                                            .getFacilitiesModel.data!
                                            .map((e) {
                                          return DropdownMenuItem<String>(
                                            value: e.id.toString(),
                                            child: Text(e.name.toString()),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          for (var v in addpropertycontroller
                                              .getFacilitiesModel.data!) {
                                            if (value == v.id.toString()) {
                                              facilityname = v.name;
                                            }
                                          }
                                          print(value);
                                          addpropertycontroller.dropdownvalue22
                                              .value = value.toString();

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
                                controller: kilometercontroller,
                                keyboardType: TextInputType.number,
                                // autovalidateMode:
                                //     AutovalidateMode.onUserInteraction,
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
                                        borderRadius:
                                            BorderRadius.circular(10))),
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
                                int indexwhere = getpropertydetail.listfac
                                    .indexWhere((facility) =>
                                        facility.id == facilityid);
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
                                      // facilitiesList.add(addpropertycontroller
                                      //     .dropdownvalue22.value);
                                      // kmList.add(km);
                                      // if (addpropertycontroller
                                      //         .dropdownvalue22 ==
                                      //     "Mosque Nearby") {
                                      //   facilityid = 0;
                                      // } else if (addpropertycontroller
                                      //         .dropdownvalue22 ==
                                      //     "Play Ground") {
                                      //   facilityid = 1;
                                      // } else if (addpropertycontroller
                                      //         .dropdownvalue22 ==
                                      //     "Park") {
                                      //   facilityid = 2;
                                      // }
                                      // addedFacilityList.add(
                                      //     {"id": facilityid, "distance": km});
                                      facilityname ??= addpropertycontroller
                                          .getFacilitiesModel.data![0].name;

                                      ListFacility facility = ListFacility(
                                          id: facilityid,
                                          distance: km,
                                          name: facilityname);
                                      getpropertydetail.listfac.add(facility);
                                      kilometercontroller.clear();
                                      // facilitiesList.clear();
                                      // kmList.clear();
                                      // addedFacilityList.clear();
                                      // print(
                                      //     "faclity list added_____$addedFacilityList");
                                    });
                                  }
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
                        Row(children: [
                          InkWell(
                            onTap: () {
                              print(getpropertydetail.sindex);
                            },
                            child: const Text('Features',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ]),
                        myDivider(),

                        Container(
                          constraints: BoxConstraints(maxHeight: 40.h),
                          child: Obx(() =>
                              addPropertyController.loadingGetFacilities.value
                                  ? loader
                                  : ListView.builder(
                                      physics: const PageScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: addpropertycontroller
                                          .getFeaturesModel.data!.length,
                                      itemBuilder: (_, index) {
                                        return Obx(() => Row(children: [
                                              Checkbox(
                                                  value: getpropertydetail
                                                      .sindex
                                                      .contains(
                                                          addpropertycontroller
                                                              .getFeaturesModel
                                                              .data![index]
                                                              .id),
                                                  onChanged: (value) {
                                                    if (getpropertydetail.sindex
                                                        .contains(
                                                            addpropertycontroller
                                                                .getFeaturesModel
                                                                .data![index]
                                                                .id)) {
                                                      getpropertydetail.sindex.remove(
                                                          addpropertycontroller
                                                              .getFeaturesModel
                                                              .data![index]
                                                              .id);
                                                    } else {
                                                      getpropertydetail.sindex.add(
                                                          addpropertycontroller
                                                              .getFeaturesModel
                                                              .data![index]
                                                              .id);
                                                    }
                                                  }),
                                              Text(addPropertyController
                                                  .getFeaturesModel
                                                  .data![index]
                                                  .name
                                                  .toString())
                                            ]));
                                      },
                                    )),
                        ),

                        // Row(children: [
                        //   Checkbox(
                        //       value: checkBoxValue1,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           checkBoxValue1 = value!;
                        //           if (checkBoxValue1 == true) {
                        //             addFeaturesList.add(featuresList[0]);
                        //             addedFeaturesList.add(0);
                        //           } else {
                        //             addFeaturesList.remove("Balcony");
                        //             addedFeaturesList.remove(0);
                        //           }
                        //         });
                        //       }),
                        //   const Text('Balcony')
                        // ]),
                        // Row(children: [
                        //   Checkbox(
                        //       value: checkBoxValue2,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           checkBoxValue2 = value!;
                        //           if (value == true) {
                        //             addFeaturesList.add(featuresList[1]);
                        //             addedFeaturesList.add(1);
                        //           } else {
                        //             addFeaturesList.remove('Security Staff');
                        //             addedFeaturesList.remove(1);
                        //           }
                        //         });
                        //       }),
                        //   const Text('Security Staff')
                        // ]),
                        // Row(children: [
                        //   Checkbox(
                        //       value: checkBoxValue3,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           checkBoxValue3 = value!;
                        //           if (value == true) {
                        //             addFeaturesList.add(featuresList[2]);
                        //             addedFeaturesList.add(2);
                        //           } else {
                        //             addFeaturesList.remove('Parking Area');
                        //             addedFeaturesList.remove(2);
                        //           }
                        //         });
                        //       }),
                        //   const Text('Parking Area')
                        // ]),
                        // Row(children: [
                        //   Checkbox(
                        //       value: checkBoxValue4,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           checkBoxValue4 = value!;
                        //           if (value == true) {
                        //             addFeaturesList.add(featuresList[3]);
                        //             addedFeaturesList.add(3);
                        //           } else {
                        //             addFeaturesList.remove('Electricity');
                        //             addedFeaturesList.remove(3);
                        //           }
                        //         });
                        //       }),
                        //   const Text('Electricity')
                        // ]),

                        // Row(children: [
                        //   Checkbox(
                        //       value: checkBoxValue5,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           checkBoxValue5 = value!;
                        //           if (value == true) {
                        //             addFeaturesList.add(featuresList[4]);
                        //             addedFeaturesList.add(4);
                        //           } else {
                        //             addFeaturesList
                        //                 .remove('Accessible by Road');
                        //             addedFeaturesList.remove(4);
                        //           }
                        //         });
                        //       }),
                        //   const Text('Accessible by Road')
                        // ]),

                        // Row(children: [
                        //   Checkbox(
                        //       value: checkBoxValue6,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           checkBoxValue6 = value!;
                        //           if (value == true) {
                        //             addFeaturesList.add(featuresList[5]);
                        //             addedFeaturesList.add(5);
                        //           } else {
                        //             addFeaturesList.remove('Sui Gas');
                        //             addedFeaturesList.remove(5);
                        //           }
                        //         });
                        //       }),
                        //   const Text('Sui Gas'),
                        // ]),

                        myDivider(),
                        Column(
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.image),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: horizontalPadding),
                                    child: Text('Customer Images',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              height: Get.height * .3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade200,
                              ),
                              padding: EdgeInsets.all(1.h),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      getpropertydetail.networkimglst.length,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      width: 80.w,
                                      child: Image.network(
                                        "${AppUrls.baseUrl2}${getpropertydetail.networkimglst[index]}",
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }),
                            ),
                            Row(
                              children: const [
                                Icon(Icons.sell_outlined),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: horizontalPadding),
                                    child: Text('Add new images of property',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                _showBottomSheet(context);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 224, 222, 222),
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                            getpropertydetail.imageFileList!.isEmpty
                                ? const Padding(
                                    padding: EdgeInsets.all(18.0),
                                    child: Text(
                                      "Your images are here",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 136, 135, 135)),
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
                                      itemCount: getpropertydetail
                                                  .imageFileList?.length ==
                                              null
                                          ? 0
                                          : getpropertydetail
                                              .imageFileList!.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.file(
                                              fit: BoxFit.cover,
                                              File(getpropertydetail
                                                  .imageFileList![index].path)),
                                        );
                                      },
                                    ),
                                  ),
                            getpropertydetail.imageFileList!.isEmpty
                                ? const SizedBox()
                                : ElevatedButton(
                                    onPressed: () {
                                      getpropertydetail.imageFileList!.length =
                                          0;
                                      setState(() {});
                                    },
                                    child: const Text("Clear"))
                          ],
                        ),
                        myDivider(),
                        Padding(
                            padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Obx(() => editpropertycontroller
                                        .loadingEditSaveProperty.value
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.appthem,
                                        ),
                                      )
                                    : CustomButton(
                                        wi: 30,
                                        onPressed: () {
                                          List<int> idList = getpropertydetail
                                              .listfac
                                              .map((facility) => facility.id!)
                                              .toList();

                                          editpropertycontroller.getAddSaveProperty(
                                              getpropertydetail
                                                  .propertybyIDmodel.data!.id,
                                              getpropertydetail
                                                  .titleController.text,
                                              getpropertydetail
                                                  .propertybyIDmodel
                                                  .data!
                                                  .assignerId,
                                              getpropertydetail
                                                  .dispController.text,
                                              getpropertydetail
                                                  .dispController.text,
                                              getpropertydetail
                                                  .sectorController.text,
                                              getpropertydetail
                                                  .streetNoController.text,
                                              getpropertydetail
                                                  .plotNoController.text,
                                              getpropertydetail
                                                  .locatController.text,
                                              getpropertydetail
                                                  .selectedValueCityId.value
                                                  .toString(),
                                              getpropertydetail
                                                  .priceController.text,
                                              getpropertydetail
                                                  .squareController.text,
                                              getpropertydetail.selectedFloor
                                                  .toString(),
                                              getpropertydetail
                                                  .selectedBathroom,
                                              getpropertydetail.selectedBedroom,
                                              selectedPropertyCategory,
                                              getpropertydetail
                                                  .propertybyIDmodel
                                                  .data!
                                                  .type!
                                                  .id,
                                              getpropertydetail.sindex,
                                              getpropertydetail.networkimglst,
                                              base64List,
                                              idList,
                                              'save');
                                        },
                                        text: 'Save')),
                                Obx(() => editpropertycontroller
                                        .loadingEditProperty.value
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.appthem,
                                        ),
                                      )
                                    : CustomButton(
                                        color: AppColors.themecolor,
                                        wi: 40,
                                        onPressed: () {
                                          List<int> idList = getpropertydetail
                                              .listfac
                                              .map((facility) => facility.id!)
                                              .toList();

                                          editpropertycontroller.getAddProperty(
                                              getpropertydetail
                                                  .propertybyIDmodel.data!.id,
                                              getpropertydetail
                                                  .titleController.text,
                                              getpropertydetail
                                                  .propertybyIDmodel
                                                  .data!
                                                  .assignerId,
                                              getpropertydetail
                                                  .dispController.text,
                                              getpropertydetail
                                                  .dispController.text,
                                              getpropertydetail
                                                  .sectorController.text,
                                              getpropertydetail
                                                  .streetNoController.text,
                                              getpropertydetail
                                                  .plotNoController.text,
                                              getpropertydetail
                                                  .locatController.text,
                                              getpropertydetail
                                                  .selectedValueCityId.value
                                                  .toString(),
                                              getpropertydetail
                                                  .priceController.text,
                                              getpropertydetail
                                                  .squareController.text,
                                              getpropertydetail.selectedFloor
                                                  .toString(),
                                              getpropertydetail
                                                  .selectedBathroom,
                                              getpropertydetail.selectedBedroom,
                                              selectedPropertyCategory,
                                              getpropertydetail
                                                  .propertybyIDmodel
                                                  .data!
                                                  .type!
                                                  .id,
                                              getpropertydetail.sindex,
                                              getpropertydetail.networkimglst,
                                              base64List,
                                              idList,
                                              'publish');
                                        },
                                        text: 'Publish')),
                              ],
                            )),
                      ],
                    ),
                  ),
                )),
    );
  }

  //City Alert Dialog Box
  Future<void> _showCityList() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        int cityid = 0;
        String cityname = '';
        return AlertDialog(
          title: const Text('Select City'),
          content: SizedBox(
              height: Get.height * .3,
              width: 100,
              child: ListView.builder(
                //scrollDirection: Axis.horizontal,
                itemCount: cityListController.citiese.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () {
                        cityname = cityListController.citiese[index];
                        getpropertydetail.selectedValueCityId.value = index;
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
                              child: Text(
                                  cityListController.citiese[index].toString(),
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
                getpropertydetail.selectedValueCity.value = cityname;
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

  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();

    if (selectedImages.isNotEmpty) {
      getpropertydetail.imageFileList!.addAll(selectedImages);
      setState(() {});

//single image path print
      print("list===== ${getpropertydetail.imageFileList![0].path}");

//add all base64
      for (int i = 0; i <= getpropertydetail.imageFileList!.length; i++) {
        final bytes =
            Io.File(getpropertydetail.imageFileList![i].path).readAsBytesSync();
        String img64 = base64Encode(bytes);
        // print(" convert64-----$img64--===}");
        base64List.add("data:image/jpeg;base64,$img64");
        print(" listBase----${base64List[0]}---");
      }
    }
    print("Image List Length:${getpropertydetail.imageFileList!.length}");
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
