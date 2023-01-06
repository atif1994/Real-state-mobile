import 'package:get/get.dart';
import 'package:prologic_29/data/Models/profile_model.dart';

class ImagePickerController extends GetxController {
  var imagePath = "".obs;
  var isImagePathSet = false.obs;
  Profile_Model? user_model;
  var isDataLoading = false.obs;

  void setImagePath(String path) {
    imagePath.value = path;
    isImagePathSet.value = true;
  }
//   getApi() async {
//   try{
//     isDataLoading(true);
//     Response response = (await http.get(
//         Uri.tryParse('realestate.tecrux.net/api/v1/login')!,
//         headers: {'app-id': '6218809df11d1d412af5bac4'}
//     )) as Response;
//     if(response.statusCode == 200){
//       ///data successfully
//        print(response.body);
//       var result = jsonDecode(response.body);
//       print(result);

//       user_model =  Profile_Model.fromJson(result);
//     }else{
//       ///error
//     }
//   }catch(e){
//     Get.snackbar('Error while getting data is', '$e');
//     print('Error while getting data is $e');
//   }finally{
//     isDataLoading(false);
//   }
// }
}
