import 'package:flutter/material.dart';
import 'package:todo/config/app_routes.dart';
import 'package:todo/config/app_text_styles.dart';
import 'package:todo/core/utils/app_strings.dart';
import '../../../../config/app_colors.dart';
import '../../../../core/model/parameter_todo_model.dart';
import '../../../../core/toast/toast.dart';
import '../manager/cubit/todo_cubit.dart';
import '../pages/edit_note_page.dart';

class NoteDetails extends StatelessWidget {
  const NoteDetails({
    super.key,
    required this.noteId,
    required this.state,
    required this.cubit,
  });

  final int noteId;
  final ToDoState state;
  final ToDoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            icon: const Icon(
              Icons.edit_outlined,
              color: AppColors.blueColor,
            ),
            onPressed: () async {
              if (state is ReadNoteLoadingState) return;
              await Navigator.pushNamed(context, AppRoutes.editNotePage,
                  arguments: cubit.note);
              cubit.readNote(ParameterToDo(id: noteId));
            }),
        IconButton(
          icon: const Icon(
            Icons.delete,
            color: AppColors.errorColor,
            size: 30,
          ),
          onPressed: () async {
            await cubit.deleteNote(ParameterToDo(id: noteId));
            AppToast.errorBar(message: AppStrings.noteDeleted);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
