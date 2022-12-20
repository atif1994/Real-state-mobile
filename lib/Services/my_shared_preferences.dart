import 'package:shared_preferences/shared_preferences.dart';

import '../Models/user_model.dart';

class MySharedPreferences {
  static const String _userIdKey = 'userId';
  static const String _firstNameKey = 'firstName';
  static const String _lastNameKey = 'lastName';
  static const String _emailKey = 'email';
 


  static storeUserData({required UserModel userModel}) async {
    await SharedPreferences.getInstance().then((value) {
      value.setInt(_userIdKey, userModel.userId);
      value.setString(_emailKey, userModel.email);
      value.setString(_firstNameKey, userModel.firstname);
      value.setString(_lastNameKey, userModel.lastname);
    
    });
  }

  static Future<UserModel> getUserData() async {
    late UserModel userModel;

    await SharedPreferences.getInstance().then((value) {
      value.getInt(_userIdKey) ?? value.setInt(_userIdKey, 0);

      value.getString(_firstNameKey) ?? value.setString(_firstNameKey, '');

      value.getString(_lastNameKey) ?? value.setString(_lastNameKey, '');

      value.getString(_emailKey) ?? value.setString(_emailKey, '');
      
      

      

      userModel = UserModel(
        userId: value.getInt(_userIdKey)!,
        email: value.getString(_emailKey)!,
        lastname: value.getString(_lastNameKey)!,
        firstname: value.getString(_firstNameKey)!,
     

      );
    });

    return userModel;
  }

  static clearData() async {
    await SharedPreferences.getInstance().then((value) {
      value.clear();
    });
  }
}
