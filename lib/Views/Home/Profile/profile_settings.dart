import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prologic_29/Services/constants.dart';
import 'package:prologic_29/Services/my_shared_preferences.dart';
import '../../../Controllers/pick_image_controller.dart';
import '../../../My Widgets/my_button.dart';
import '../../../My Widgets/my_text_field_2.dart';
import '../../profile/profile_screen.dart';

class ProfileSettings extends StatefulWidget {
  ProfileSettings({Key? key}) : super(key: key);
  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  File? imageFile;
  int usid = 0;
  //GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();

  // String firstName='';
  // String lastName='' ;
  final TextEditingController UserController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String country = "";
  String state = "";
  String city = "";
  String address = "";
  // final TextEditingController CountryController = TextEditingController();
  // final TextEditingController SateController = TextEditingController();
  // final TextEditingController CityController = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  void initState() {
    getUserData();
    super.initState();
  }

  updatedata() async {
    Dio dio = Dio();
    print(usid);
    // dio.options.headers={
    //   'Accept': 'application/json',
    //   'Content-Type': 'application/json',
    // };
    final response = await dio.put(
      'https://realestate.tecrux.net/api/v1/me/$usid',
      data: {
        "first_name": firstNameController.text.trim(),
        "username": UserController.text.trim(),
        "last_name": lastNameController.text.trim(),
        "phone": phoneNumberController.text.trim(),
        
        "city": city.trim(),
        "country": country.trim(),
        "state": state.trim()

        // "city":,
        // "state":,
        // "country":,
      },
    );
    final data = response.data;
    print(data);
    if (response.statusCode == 200) {
      final user = data['data'];
    } else {
      Fluttertoast.showToast(msg: 'wrong');
    }
  }

  getUserData() async {
    //  SharedPreferences prefs = await SharedPreferences.getInstance();
    MySharedPreferences.getUserData()
        .then((value) => {usid = value.userId, getData(usid)});
    // });
  }

  getData(id) async {
    dio.Response response =
        await dio.Dio().get('http://realestate.tecrux.net/api/v1/me/$id');
    final data = response.data;
    print(data);
    if (data['error'] == false) {
      final user = data['data'];
      print(user['address']['country']);
      firstNameController.text = user['first_name'];
      lastNameController.text = user['last_name'];
      UserController.text = user['username'];
      emailController.text = user['email'];
      phoneNumberController.text = user['phone'];
      country = user['address']['country'];
      state= user['address']['state'];
      city = user['address']['city'];
    }
  }

//     newdata()async{
//   String fname = await MySharedPreferences.getUserData().then((value) => value.firstname,);
//   String lname = await MySharedPreferences.getUserData().then((value) => value.lastname,);
//   String emaill = await MySharedPreferences.getUserData().then((value) => value.email,);
//   setState(() {
//     firstNameController.text=fname;
//     lastNameController.text=lname;
//     emailController.text=emaill;
//   });
// }
  @override
 
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Settings')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Obx(() => CircleAvatar(
                        radius: 80,
                        backgroundImage: imagePickerController
                                    .isImagePathSet.value ==
                                true
                            ? FileImage(
                                    File(imagePickerController.imagePath.value))
                                as ImageProvider
                            : NetworkImage(''),
                      )),
                  Positioned(
                    bottom: 0,
                    child: InkWell(
                      child: const Icon(
                        Icons.camera,
                        color: Colors.black,
                        // size: ,
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => bottomSheet(context),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField2(
              controller: UserController,
              label: 'User Name',
            ),
            MyTextField2(
              controller: firstNameController,
              label: 'First Name',
            ),
            MyTextField2(
              controller: lastNameController,
              label: 'Last Name',
            ),
            MyTextField2(
              controller: emailController,
              label: 'Email',
              readonly: true,
            ),
            Form(
              key: formkey,
              child: MyTextField2(
                controller: phoneNumberController,
                label: 'Phone Number',
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return 'Phone Number must be required';
                  }
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CSCPicker(
              layout: Layout.vertical,
              dropdownDialogRadius: 30,
              searchBarRadius: 30,

              ///Enable disable state dropdown [OPTIONAL PARAMETER]
              showStates: true,

              /// Enable disable city drop down [OPTIONAL PARAMETER]
              showCities: true,

              ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
              // flagState: CountryFlag.DISABLE,

              ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
              dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300, width: 1)),

              ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
              disabledDropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey.shade300,
                  border: Border.all(color: Colors.grey.shade300, width: 1)),

              ///placeholders for dropdown search field
              countrySearchPlaceholder: "Country",
              stateSearchPlaceholder: "State",
              citySearchPlaceholder: "City",

              ///labels for dropdown
              countryDropdownLabel: "*Country",
              stateDropdownLabel: "*State",
              cityDropdownLabel: "*City",

              ///Default Country
              //defaultCountry: DefaultCountry.India,

              ///Disable country dropdown (Note: use it with default country)
              //disableCountry: true,

              ///selected item style [OPTIONAL PARAMETER]
              // ignore: prefer_const_constructors
              selectedItemStyle: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),

              ///DropdownDialog Heading style [OPTIONAL PARAMETER]
              // ignore: prefer_const_constructors
              dropdownHeadingStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),

              ///DropdownDialog Item style [OPTIONAL PARAMETER]
              dropdownItemStyle: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),

              ///Dialog box radius [OPTIONAL PARAMETER]
              // dropdownDialogRadius: 10.0,

              ///Search bar radius [OPTIONAL PARAMETER]
              // searchBarRadius: 10.0,

              ///triggers once country selected in dropdown
              onCountryChanged: (value) {
                country= value;

                // setState(() {
                //   ///store value in country variable
                //   countryValue = value;
                // });
              },

              ///triggers once state selected in dropdown
              onStateChanged: (value) {
                state = value.toString();
                // setState(() {
                //   ///store value in state variable
                //   stateValue = value.toString();
                // });
              },

              ///triggers once city selected in dropdown
              onCityChanged: (value) {
                city= value.toString();
                //controller=controller.CityController,
                // setState(() {
                //   ///store value in city variable
                //  // cityValue = value.toString();
                // });
              },
            ),
            //  MyTextField2(
            //   controller: CountryController,
            //   label: 'Country',
            //   validator: (String? val){
            // if(val!.isEmpty){
            //   return 'Country name must be required';
            // }
            //     },
            // ),
            //  MyTextField2(
            //   controller: SateController,
            //   label: 'State or province',
            //   validator: (String? val){
            // if(val!.isEmpty){
            //   return 'State name must be required';
            // }
            //     },
            // ),
            //  MyTextField2(
            //   controller: CityController,
            //   label: 'City',
            // ),
            MyButton(
              text: 'Update Profile',
              onTap: () {
                if (formkey.currentState!.validate()) {
                  updatedata();
                } else {
                  print('unsucessful');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Select or Capture Photo",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Column(
                  children: const [
                    Icon(
                      Icons.camera,
                      color: Colors.purple,
                    ),
                    Text(
                      "Camera",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.camera, context);
                },
              ),
              SizedBox(
                width: size.width * 0.4,
              ),
              InkWell(
                child: Column(
                  children: const [
                    Icon(
                      Icons.image,
                      color: Colors.deepPurple,
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.gallery, context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> takePhoto(ImageSource source, BuildContext context) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    imageFile = File(pickedImage!.path);
    // print(' imagee path:${imageFile}');
    imagePickerController.setImagePath(imageFile!.path);
    Navigator.pop(context);
  }
}


















// import 'dart:io';
// import 'package:dio/dio.dart' as dio;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:prologic_29/Services/constants.dart';
// import 'package:prologic_29/Services/my_shared_preferences.dart';

// import '../../../Controllers/pick_image_controller.dart';
// import '../../../My Widgets/my_button.dart';
// import '../../../My Widgets/my_text_field_2.dart';
// import '../../profile/profile_screen.dart';

// class ProfileSettings extends StatefulWidget {

  
//    ProfileSettings({Key? key}) : super(key: key);

//   @override
//   State<ProfileSettings> createState() => _ProfileSettingsState();
// }

// class _ProfileSettingsState extends State<ProfileSettings> {
//   File? imageFile;
//   int usid=0;
//   // String firstName='';

//   // String lastName='' ;
  
  
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//   final TextEditingController CountryController = TextEditingController();
//   final TextEditingController SateController = TextEditingController();
//   final TextEditingController CityController = TextEditingController();


//   ImagePicker imagePicker = ImagePicker();


//      ImagePickerController imagePickerController =
//       Get.put(ImagePickerController());
      
//     void initState() {
    
//      getUserData();
   
//      super.initState();
//   }
//       updatedata() async{
        

//       print(usid);

//       dio.Response response = await dio.Dio().post(
//       'http://realestate.tecrux.net/api/v1/me/$usid',
//       data: {
//         'firstname': firstNameController.text.trim(),
//         'lastname': lastNameController.text.trim(),
//         'email': emailController.text.trim(),
//         'phone': phoneNumberController.text.trim(),
//         // "first_name": "hwbdk",
//         // "last_name": "dbswh",
//         // "email": "rsh7adfg510@gmail.com",
//         // "phone": "894735897"
//       },
//          );

//          final data = response.data;
//          print(data);
        

//       }
//        getUserData() async{
//     //  SharedPreferences prefs = await SharedPreferences.getInstance();
//    MySharedPreferences.getUserData().then((value) =>{
//        usid = value.userId,
//        getData(usid)});
      
//   // });
//    }

//     getData(id) async{
//     dio.Response response = await dio.Dio().get(
//       'http://realestate.tecrux.net/api/v1/me/$id'
//     );
//     final data = response.data;
//     print(data);

//         if (data['error'] == false) {

//       final user = data['data'];
//     firstNameController.text=user['first_name'];
//     lastNameController.text=user['last_name'];
//     emailController.text=user['email'];
//     //phoneNumberController.text=user['phone'];
//     // CountryController.text=user['country'];
//     // SateController.text=user['state'];
//     // CityController.text=user['city'];

//     }
//     }


// //     newdata()async{
// //   String fname = await MySharedPreferences.getUserData().then((value) => value.firstname,);
// //   String lname = await MySharedPreferences.getUserData().then((value) => value.lastname,);
// //   String emaill = await MySharedPreferences.getUserData().then((value) => value.email,);
  
  

// //   setState(() {
// //     firstNameController.text=fname;
// //     lastNameController.text=lname;
// //     emailController.text=emaill;
    

// //   });
// // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       appBar: AppBar(title: const Text('Profile Settings')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
            
//             Padding(
//               padding: const EdgeInsets.all(28.0),
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Obx(() => CircleAvatar(
//                         radius: 80,
//                         backgroundImage: imagePickerController
//                                     .isImagePathSet.value ==
//                                 true
//                             ? FileImage(
//                                     File(imagePickerController.imagePath.value))
//                                 as ImageProvider
//                             : NetworkImage(''),
//                       )),
//                   Positioned(
//                     bottom: 0,
//                     child: InkWell(
//                       child: const Icon(
//                         Icons.camera,
//                         color: Colors.black,
//                         // size: ,
//                       ),
//                       onTap: () {
//                         showModalBottomSheet(
//                           context: context,
//                           builder: (context) => bottomSheet(context),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20,),
//              MyTextField2(
//              controller: firstNameController,
//               label: 'First Name',
//             ),
//             MyTextField2(
//               controller: lastNameController,
//               label: 'Last Name',
//             ),
//             MyTextField2(
//               controller: emailController,              
//               label: 'Email',
//             ),
//             MyTextField2(
//               controller: phoneNumberController,
//               label: 'Phone Number',
//             ),
//              MyTextField2(
//               controller: CountryController,
//               label: 'Country',
//             ),
//              MyTextField2(
//               controller: SateController,
//               label: 'State or province',
//             ),
//              MyTextField2(
//               controller: CityController,
//               label: 'City',
//             ),
            
//             MyButton(
//               text: 'Update Profile',
//               onTap: (){
//                 updatedata();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget bottomSheet(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       width: double.infinity,
//       height: 100,
//       margin: EdgeInsets.symmetric(
//         horizontal: 20,
//         vertical: 20,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "Select or Capture Photo",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(
//             height: 25,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               InkWell(
//                 child: Column(
//                   children: const [
//                     Icon(
//                       Icons.camera,
//                       color: Colors.purple,
//                     ),
//                     Text(
//                       "Camera",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.purple),
//                     ),
//                   ],
//                 ),
//                 onTap: () {
//                   takePhoto(ImageSource.camera, context);
//                 },
//               ),
//               SizedBox(
//                 width: size.width * 0.4,
//               ),
//               InkWell(
//                 child: Column(
//                   children: const [
//                     Icon(
//                       Icons.image,
//                       color: Colors.deepPurple,
//                     ),
//                     Text(
//                       "Gallery",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.deepPurple),
//                     ),
//                   ],
//                 ),
//                 onTap: () {
//                   takePhoto(ImageSource.gallery, context);
//                 },
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Future<void> takePhoto(ImageSource source, BuildContext context) async {
//     final pickedImage =
//         await imagePicker.pickImage(source: source, imageQuality: 100);

//     imageFile = File(pickedImage!.path);
//     // print(' imagee path:${imageFile}');

//     imagePickerController.setImagePath(imageFile!.path);
//     Navigator.pop(context);
//   }
// }
