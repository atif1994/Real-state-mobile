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
      value.setString(_firstNameKey, userModel.firstName);
      value.setString(_lastNameKey, userModel.lastName);
      value.setString(_emailKey, userModel.email);
    });
  }

  static Future<UserModel> getUserData() async {
    late UserModel userModel;

    await SharedPreferences.getInstance().then((value) {
      value.getInt(_userIdKey) ??
          value.setInt(_userIdKey, 0);

      value.getString(_firstNameKey) ??
          value.setString(_firstNameKey, '');

      value.getString(_lastNameKey) ??
          value.setString(_lastNameKey, '');

      value.getString(_emailKey) ??
          value.setString(_emailKey, '');

      userModel = UserModel(
        userId: value.getInt(_userIdKey)!,
        firstName: value.getString(_firstNameKey)!,
        lastName: value.getString(_lastNameKey)!,
        email: value.getString(_emailKey)!,
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
