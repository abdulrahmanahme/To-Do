import 'package:flutter/material.dart';
import 'package:todo/config/app_colors.dart';

class AppTextStyle {
  ///FontSize

  static const TextStyle fontSize23 = TextStyle(fontSize: 23);
  ///FontWeight

  static const TextStyle fontWeight400 = TextStyle(fontWeight: FontWeight.w400);
  ///Font Family
  static const TextStyle fontCircularStd =
      TextStyle(fontFamily: "CircularStd");

  ///FontStyle

  static TextStyle get font23black400 => fontCircularStd
      .merge(fontWeight400)
      .merge(fontSize23)
      .copyWith(color: AppColors.blackColor);


}
