import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/config/app_colors.dart';
import '../../../../config/app_text_styles.dart';
import '../../../../core/utils/app_strings.dart';

class BuildDescription extends StatelessWidget {
  const BuildDescription({
    super.key,
    required this.description,
    required this.onChangedDescription,
  });

  final String? description;
  final ValueChanged<String> onChangedDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 150.h,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child:  TextFormField(
          maxLines: 30,
          initialValue: description,
          style:AppTextStyle.font23black400,
          decoration:InputDecoration(
              border: InputBorder.none,
              hintText: AppStrings.typeSomething,
              hintStyle:const TextStyle(
                color: AppColors.blackColor,
              )),
          validator: (description) => description != null && description.isEmpty
              ? AppStrings.theDescription
              : null,
          onChanged: onChangedDescription,
        ),
      ),
    );
  }
}