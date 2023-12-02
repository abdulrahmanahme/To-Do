import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_text_styles.dart';
import '../../../../config/consts/app_const.dart';
import '../../domain/entities/note_entite.dart';

class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.lightColors[index % AppColors.lightColors.length];
    final time = DateFormat.yMMMd().format(note.createdTime);
    final minHeight = AppConst.getMinHeight(index);

    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.grey.shade700),
            ),
            SizedBox(height: 5.h),
            Text(
              note.title,
              style: AppTextStyle.font20black400,
            ),
            SizedBox(height: .5.h),
            Text(note.description, style: AppTextStyle.font20black400),
          ],
        ),
      ),
    );
  }
}
