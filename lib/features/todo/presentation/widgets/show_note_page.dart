import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo/config/app_text_styles.dart';
import 'package:todo/core/utils/app_strings.dart';
import 'package:todo/features/todo/presentation/manager/cubit/todo_cubit.dart';
import '../../../../config/app_colors.dart';

class ShowNotePage extends StatelessWidget {
  const ShowNotePage({
    super.key,
    required this.cubit,
  });

  final ToDoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          Text(
            AppStrings.title,
            style: AppTextStyle.fontSize20,
          ),
          const SizedBox(height: 8),
          Container(
            height: 70.h,
            decoration: BoxDecoration(
              color: AppColors.greyColor.withOpacity(.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Expanded(
                child:
                    Text(cubit.note.title, style: AppTextStyle.font23black400),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text('${AppStrings.time}: ${DateFormat.yMMMd().format(cubit.note.createdTime)}',
              style: AppTextStyle.fontSize20),
          const SizedBox(height: 15),
          Text(
            AppStrings.description,
            style: AppTextStyle.fontSize20,
          ),
          const SizedBox(height: 8),
          Container(
            height: 100.h,
            decoration: BoxDecoration(
              color: AppColors.greyColor.withOpacity(.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Expanded(
                child: Text(cubit.note.description,
                    style: AppTextStyle.font23black400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
