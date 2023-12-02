import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../config/app_colors.dart';
import '../manager/cubit/todo_cubit.dart';
import '../pages/edit_note_page.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key,
   required this.cubit,
  });
final ToDoCubit cubit;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.greyColor,
      child: const Icon(
        Icons.add,
        color: Colors.grey,
      ),
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const EditNotePage()),
        );
        cubit.readAllNote();
      },
    );
  }
}

