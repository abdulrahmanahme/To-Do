import 'package:flutter/material.dart';
import 'package:todo/features/todo/presentation/widgets/build_note.dart';
import 'package:todo/features/todo/presentation/widgets/note_card.dart';
import '../../../../config/app_routes.dart';
import '../../../../config/app_text_styles.dart';
import '../../../../core/utils/app_strings.dart';
import '../manager/cubit/todo_cubit.dart';
import '../pages/note_details.dart';

class HomeBuildWidget extends StatelessWidget {
  const HomeBuildWidget({super.key, required this.cubit, required this.state});
  final ToDoState state;
  final ToDoCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: state is ReadAllLoadingState
          ? const CircularProgressIndicator()
          : cubit.notes.isEmpty
              ? Text(
                  AppStrings.addNotes,
                  style: AppTextStyle.font23black400,
                )
              : BuildNote(
                  itemCount: cubit.notes.length,
                  itemBuilder: (context, index) {
                    final note = cubit.notes[index];
                    return GestureDetector(
                      onTap: () async {
                        await Navigator.pushNamed(
                            context, AppRoutes.noteDetailPage,
                            arguments: note.id!);
                        cubit.readAllNote();
                      },
                      child: NoteCardWidget(note: note, index: index),
                    );
                  },
                ),
    );
  }
}
