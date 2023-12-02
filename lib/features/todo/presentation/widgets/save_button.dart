
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../config/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class SaveButton extends StatelessWidget {
  const SaveButton(
      {super.key,
      required this.title,
      required this.description,
      required this.onPressed});
  final String title;
  final String description;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: AppColors.whiteColor,
          primary: title.isNotEmpty && description.isNotEmpty
              ? Colors.grey
              : AppColors.successColor,
        ),
        onPressed: onPressed,
        child: Text(AppStrings.save),
      ),
    );
  }
}
