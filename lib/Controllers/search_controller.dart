import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SearchController extends GetxController with GetSingleTickerProviderStateMixin{
  RxInt iWantTo = 0.obs;

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
  RxString selectedPropertyType = ''.obs;

  RxDouble minPriceRange = 0.0.obs;
  RxDouble maxPriceRange = 100.0.obs;
  final TextEditingController minPriceRangeController = TextEditingController();
  final TextEditingController maxPriceRangeController = TextEditingController();

  RxDouble minAreaRange = 0.0.obs;
  RxDouble maxAreaRange = 100.0.obs;
  final TextEditingController minAreaRangeController = TextEditingController();
  final TextEditingController maxAreaRangeController = TextEditingController();

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
  RxString selectedBedroom = 'Any'.obs;

  List<String> bathroomList = ['Any', '1', '2', '3', '4', '5', '6+'];
  RxString selectedBathroom = 'Any'.obs;

  RxBool onTapSearch = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 3, vsync: this);

    minPriceRangeController.text = minPriceRange.round().toString();
    maxPriceRangeController.text = maxPriceRange.round().toString();

    minAreaRangeController.text = minAreaRange.round().toString();
    maxAreaRangeController.text = maxAreaRange.round().toString();
  }
}