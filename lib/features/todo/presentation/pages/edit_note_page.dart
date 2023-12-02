import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/todo/data/models/note_model.dart';
import 'package:todo/features/todo/presentation/widgets/note_widget.dart';
import '../../../../core/model/parameter_todo_model.dart';
import '../../../../core/services/services_locator.dart';
import '../manager/cubit/todo_cubit.dart';
import '../widgets/save_button.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({
    Key? key,
    this.note,
  }) : super(key: key);
  final NoteModel? note;

  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  final _formKey = GlobalKey<FormState>();
  late int number;
  late String title;
  late String description;
  late String image;
  @override
  void initState() {
    super.initState();
    number = widget.note?.number ?? 0;
    title = widget.note?.title ?? '';
    description = widget.note?.description ?? '';
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sl<ToDoCubit>(),
        child: BlocConsumer<ToDoCubit, ToDoState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = context.read<ToDoCubit>();
            return Scaffold(
                appBar: AppBar(
                  actions: [
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
                        } else {
                          await cubit.createNote(ParameterToDo(
                            note: NoteModel(
                              title: title,
                              number: number,
                              description: description,
                              createdTime: DateTime.now(),
                            ),
                          ));
                        }
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                  elevation: 2,
                ),
                body: Form(
                  key: _formKey,
                  child: NoteFormWidget(
                    number: number,
                    title: title,
                    description: description,
                    onChangedNumber: (number) =>
                        setState(() => this.number = number),
                    onChangedTitle: (title) =>
                        setState(() => this.title = title),
                    onChangedDescription: (description) =>
                        setState(() => this.description = description),
                  ),
                ));
          },
        ),
      );
}

