import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/config/app_text_styles.dart';
import 'package:todo/features/todo/presentation/widgets/build_description.dart';
import 'package:todo/features/todo/presentation/widgets/build_title.dart';

import '../../../../core/utils/app_strings.dart';

class NoteFormWidget extends StatelessWidget {
  final int? number;
  String? title;
  final String? description;
  String? image;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  NoteFormWidget({
    Key? key,
    this.number = 0,
    this.title = '',
    this.description = '',
    this.image,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        children: [
          Padding(
            padding:const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.title,style: AppTextStyle.font23black500,),
                BuildTitle(title: title, onChangedTitle: onChangedTitle),
                SizedBox(height: 20.h,),
                Text(AppStrings.description,style: AppTextStyle.font23black500,),
                BuildDescription(
                    description: description,
                    onChangedDescription: onChangedDescription),
              ],
            ),
          ),
        ],
      );
}




