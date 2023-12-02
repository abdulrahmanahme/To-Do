import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/model/parameter_todo_model.dart';
import 'package:todo/features/todo/presentation/widgets/show_note_page.dart';
import '../../../../core/services/services_locator.dart';
import '../manager/cubit/todo_cubit.dart';
import '../widgets/note_detials.dart';

class NoteDetailPage extends StatelessWidget {
  final int noteId;
  const NoteDetailPage({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            sl<ToDoCubit>()..readNote(ParameterToDo(id: noteId)),
        child: BlocConsumer<ToDoCubit, ToDoState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = context.read<ToDoCubit>();
            return Scaffold(
              appBar: AppBar(
                actions: [
                  NoteDetails(
                    noteId: noteId,
                    state: state,
                    cubit: cubit,
                  ),
                ],
                elevation: 2,
              ),
              body: state is ReadNoteLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : ShowNotePage(
                      cubit: cubit,
                    ),
            );
          },
        ),
      );
}
