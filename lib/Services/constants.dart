// TODO Implement this library.

import 'package:email_validator/email_validator.dart';

emailvalidator(val) {
  if (val == null || val.isEmpty) {
    return '*Please enter your email';
  } else if (!EmailValidator.validate(val, true)) {
    return '*Please enter valid email address';
  }
  return null;
}

RegExp uppercase = RegExp("(?=.*?[A-Z])");
RegExp lowercase = RegExp("(?=.*?[a-z])");
RegExp digit = RegExp("(?=.*?[0-9])");
RegExp specialchar = RegExp("(?=.*?[!@#\$&*~])");
RegExp eightchar = RegExp(".{12,}");
passwordvalidator(val) {
  if (val == null || val.isEmpty) {
    return '*Please enter your password';
  } else if (!uppercase.hasMatch(val)) {
    return '*Password must contain atleast one upper case letter';
  } else if (!lowercase.hasMatch(val)) {
    return '*Password must contain atleast one lower case letter';
  } else if (!digit.hasMatch(val)) {
    return '*Password must contain atleast one digit';
  } else if (!specialchar.hasMatch(val)) {
    return '*Password must contain atleast one special case';
  } else if (!eightchar.hasMatch(val)) {
    return '*Password length should be 12';
  }
  return null;
}

String? requiredValidator(String? v) {
  String string = v!.trim();
  if (string.isEmpty) {
    return 'This field is required';
  } else {
    return null;
  }
}
