import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/todo/data/models/note_model.dart';
import 'package:todo/features/todo/presentation/widgets/edit_note_page.dart';
import 'package:todo/features/todo/presentation/widgets/note_widget.dart';
import '../../../../core/services/services_locator.dart';
import '../manager/cubit/todo_cubit.dart';

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
                    EditNotePageWidget(
                        title: title,
                        description: description,
                        widget: widget,
                        cubit: cubit,
                        number: number),
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
