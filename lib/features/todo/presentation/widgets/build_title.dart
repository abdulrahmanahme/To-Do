
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_text_styles.dart';
import '../../../../core/utils/app_strings.dart';

class BuildTitle extends StatelessWidget {
  const BuildTitle({
    super.key,
    required this.title,
    required this.onChangedTitle,
  });

  final String? title;
  final ValueChanged<String> onChangedTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color:AppColors.greyColor.withOpacity(.2) ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextFormField(
          maxLines: 1,
          initialValue: title,
          style:AppTextStyle.font23black400,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: AppStrings.title,
            hintStyle:AppTextStyle.font23black400
          ),
          validator: (title) => title != null && title.isEmpty
              ? AppStrings.theTitle
              : null,
          onChanged: onChangedTitle,
        ),
      ),
    );
  }
}