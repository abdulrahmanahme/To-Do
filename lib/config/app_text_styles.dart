import 'package:flutter/material.dart';
import 'package:todo/config/app_colors.dart';

class AppTextStyle {
  ///FontSize

  static const TextStyle fontSize23 = TextStyle(fontSize: 23);
  static const TextStyle fontSize20 = TextStyle(fontSize: 20);

  ///FontWeight

  static const TextStyle fontWeight400 = TextStyle(fontWeight: FontWeight.w400);
  static const TextStyle fontWeight500 = TextStyle(fontWeight: FontWeight.w500);

  
  ///Font Family
  static const TextStyle fontCircularStd =
      TextStyle(fontFamily: "CircularStd");

  ///FontStyle

  static TextStyle get font23black400 => fontCircularStd
      .merge(fontWeight400)
      .merge(fontSize23)
      .copyWith(color: AppColors.blackColor);

        static TextStyle get font23black500 => fontCircularStd
      .merge(fontWeight500)
      .merge(fontSize23)
      .copyWith(color: AppColors.blackColor);

      static TextStyle get font20black400 => fontCircularStd
      .merge(fontWeight400)
      .merge(fontSize20)
      .copyWith(color: AppColors.blackColor);


}
