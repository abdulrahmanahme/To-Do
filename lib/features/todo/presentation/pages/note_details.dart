import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/config/app_colors.dart';
import 'package:todo/core/model/parameter_todo_model.dart';
import 'package:todo/features/todo/data/models/note_model.dart';
import 'package:todo/features/todo/presentation/pages/edit_note_page.dart';
import 'package:todo/features/todo/presentation/widgets/show_note_page.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/toast/toast.dart';
import '../manager/cubit/todo_cubit.dart';

class NoteDetailPage extends StatefulWidget {
  final int noteId;

  const NoteDetailPage({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late NoteModel note;
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>sl<ToDoCubit>()..readNote(ParameterToDo(id: widget.noteId)),
        child: BlocConsumer<ToDoCubit, ToDoState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            var cubit = context.read<ToDoCubit>();
            return Scaffold(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              appBar: AppBar(
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                actions: [
                  IconButton(
                      icon: const Icon(Icons.edit_outlined,color: AppColors.blueColor,),
                      onPressed: () async {
                        if (state is ReadNoteLoadingState) return;
                        await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditNotePage(
                            note: cubit.note,
                          ),
                        ));
                        cubit.readNote(ParameterToDo(id: widget.noteId));
                      }),
                  IconButton(
                    icon: const Icon(Icons.delete,color:AppColors.errorColor,size: 30,),
                    onPressed: () async {
                      await cubit.deleteNote(ParameterToDo(id: widget.noteId));
                          AppToast.errorBar(message:'Note Deleted Successfully' );
                      Navigator.of(context).pop();
                    },
                  ),
                ],
                elevation: 2,
              ),
              body: state is ReadNoteLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : ShowNotePage(cubit: cubit),
            );
          },
        ),
      );
}


