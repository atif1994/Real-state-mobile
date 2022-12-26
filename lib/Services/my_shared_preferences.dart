import 'package:shared_preferences/shared_preferences.dart';

import '../Models/user_model.dart';

class MySharedPreferences {
  static const String _userIdKey = 'userId';
  // static const String _phoneKey = 'phone';
  static const String _userNameKey = 'userName';
  static const String _firstNameKey = 'firstName';
  static const String _lastNameKey = 'lastName';
  static const String _emailKey = 'email';
  // static const String _cityKey = 'city';
  // static const String _stateKey = 'state';
  // static const String _countryKey = 'country';
 


  static storeUserData({required UserModel userModel}) async {
    await SharedPreferences.getInstance().then((value) {
      value.setInt(_userIdKey, userModel.userId);
      // value.setInt(_phoneKey, userModel.phone);
      value.setString(_emailKey, userModel.email);
      value.setString(_userNameKey, userModel.userName);
      value.setString(_firstNameKey, userModel.firstname);
      value.setString(_lastNameKey, userModel.lastname);
      // value.setString(_stateKey, userModel.state);
      // value.setString(_countryKey, userModel.country);
      // value.setString(_cityKey, userModel.city);
    
    });
  }

  static Future<UserModel> getUserData() async {
    late UserModel userModel;

    await SharedPreferences.getInstance().then((value) {
      value.getInt(_userIdKey) ?? value.setInt(_userIdKey, 0);

      // value.getInt(_phoneKey) ?? value.setInt(_phoneKey, 0);

      value.getString(_userNameKey) ?? value.setString(_userNameKey, '');

      value.getString(_firstNameKey) ?? value.setString(_firstNameKey, '');

      value.getString(_lastNameKey) ?? value.setString(_lastNameKey, '');

      value.getString(_emailKey) ?? value.setString(_emailKey, '');

      // value.getString(_stateKey) ?? value.setString(_stateKey, '');

      // value.getString(_countryKey) ?? value.setString(_countryKey, '');

      // value.getString(_stateKey) ?? value.setString(_stateKey, '');
      
      

      

      userModel = UserModel(
        userId: value.getInt(_userIdKey)!,
        // phone: value.getInt(_phoneKey)!,
        email: value.getString(_emailKey)!,
        userName: value.getString(_userNameKey)!,
        lastname: value.getString(_lastNameKey)!,
        firstname: value.getString(_firstNameKey)!,
        // state: value.getString(_stateKey)!,
        // country: value.getString(_countryKey)!,
        // city: value.getString(_cityKey)!,
     

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
