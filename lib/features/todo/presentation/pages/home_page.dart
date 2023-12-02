import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/config/app_text_styles.dart';
import 'package:todo/core/utils/app_strings.dart';
import 'package:todo/features/todo/presentation/pages/note_details.dart';
import '../manager/cubit/todo_cubit.dart';
import '../widgets/build_note.dart';
import '../widgets/floating_action_button_widget.dart';
import '../widgets/note_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocConsumer<ToDoCubit, ToDoState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = context.read<ToDoCubit>();
            return SafeArea(
              child: Center(
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
                                  await Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) => NoteDetailPage(
                                      noteId: note.id!,
                                    ),
                                  ));
                                  cubit.readAllNote();
                                },
                                child: NoteCardWidget(note: note, index: index),
                              );
                            },
                          ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButtonWidget(
          cubit: context.read<ToDoCubit>(),
        ),
      );
}
