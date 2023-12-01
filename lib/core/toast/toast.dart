
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../config/app_colors.dart';

class AppToast {

 static Future successBar({
    @required String? message,
  }) {
    return Fluttertoast.showToast(
      msg: message!,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.successColor,
      textColor: AppColors.whiteColor,
      fontSize: 16.0,
    );
  }
static   Future errorBar({
    @required String? message,
  }) {
    return Fluttertoast.showToast(
      msg: message!,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.errorColor,
      textColor: AppColors.whiteColor,
      fontSize: 16.0,
    );
  }
}
