import 'package:flutter/material.dart';
import 'package:todo/core/utils/app_strings.dart';
import 'package:todo/features/todo/presentation/widgets/save_button.dart';

import '../../../../core/model/parameter_todo_model.dart';
import '../../../../core/toast/toast.dart';
import '../../data/models/note_model.dart';
import '../manager/cubit/todo_cubit.dart';
import '../pages/edit_note_page.dart';

class EditNotePageWidget extends StatelessWidget {
  const EditNotePageWidget({
    super.key,
    required this.title,
    required this.description,
    required this.widget,
    required this.cubit,
    required this.number,
  });

  final String title;
  final String description;
  final EditNotePage widget;
  final ToDoCubit cubit;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SaveButton(
          title: title,
          description: description,
          onPressed: () async {
            final isUpdating = widget.note != null;
            if (isUpdating) {
              await cubit.updateNote(ParameterToDo(
                  note: widget.note!.copy(
                number: number,
                title: title,
                description: description,
              )));
              AppToast.successBar(message: AppStrings.noteUpdate);
            } else {
              await cubit.createNote(ParameterToDo(
                note: NoteModel(
                  title: title,
                  number: number,
                  description: description,
                  createdTime: DateTime.now(),
                ),
              ));
              AppToast.successBar(message: AppStrings.noteCreate);
            }
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
