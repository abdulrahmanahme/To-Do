import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo/config/app_routes.dart';
import 'package:todo/core/usecase/use_case.dart';
import 'package:todo/features/todo/data/models/note_model.dart';
import '../../../../../core/model/parameter_todo_model.dart';
import '../../../domain/entities/note_entite.dart';
import '../../../domain/usecases/close_use_case.dart';
import '../../../domain/usecases/create_db_use_case.dart';
import '../../../domain/usecases/create_note_use_case.dart';
import '../../../domain/usecases/delete_note_use_case.dart';
import '../../../domain/usecases/init_db_use_case.dart';
import '../../../domain/usecases/read_all_notes_use_case.dart';
import '../../../domain/usecases/read_note_use_case.dart';
import '../../../domain/usecases/update_use_case.dart';
part 'todo_state.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit(
      this.createDBUseCase,
      this.initDBUseCase,
      this.readAllNoteDBUseCase,
      this.readNoteDBUseCase,
      this.updateNoteDBUseCase,
      this.deleteNoteDBUseCase,
      this.closeNoteDBUseCase,
      this.createNoteDBUseCase)
      : super(ToDoInitialState());
  final CreateDBUseCase createDBUseCase;
  final InitDBUseCase initDBUseCase;
  final ReadAllNoteDBUseCase readAllNoteDBUseCase;
  final ReadNoteDBUseCase readNoteDBUseCase;
  final UpdateNoteDBUseCase updateNoteDBUseCase;
  final DeleteNoteDBUseCase deleteNoteDBUseCase;
  final CloseNoteDBUseCase closeNoteDBUseCase;
  final CreateNoteDBUseCase createNoteDBUseCase;
  late List<Note> notes;
  late NoteModel note;

  FutureOr<void> createDB(ParameterDB parameter) async {
    emit(CreateDBLoadingState());
    final result = await createDBUseCase(
        ParameterDB(db: parameter.db, version: parameter.version));
    result.fold(
        (l) => {
              print('$l'),
              emit(CreateDBErrorState()),
            },
        (r) => {
              emit(CreateDBSuccessState()),
              print('$r'),
            });
  }

  FutureOr<void> initDB(ParameterToDo parameter) async {
    emit(InitDBLoadingState());
    final result =
        await initDBUseCase(ParameterToDo(filePath: parameter.filePath));
    result.fold(
        (l) => {
              print('$l'),
              emit(InitDBErrorState()),
            },
        (r) => {
              emit(InitDBSuccessState()),
              print('$r'),
            });
  }

  FutureOr<void> readAllNote() async {
    emit(ReadAllLoadingState());
    final result = await readAllNoteDBUseCase(const NoParameter());
    result.fold(
        (l) => {
              print('$l'),
              emit(ReadAllErrorState()),
            },
        (r) => {
              notes = r,
              print('$r'),
              emit(ReadAllSuccessState()),
            });
  }

  FutureOr<void> readNote(ParameterToDo parameter) async {
    emit(ReadNoteLoadingState());
    final result = await readNoteDBUseCase(ParameterToDo(id: parameter.id));
    result.fold(
        (l) => {
              print('$l'),
              emit(ReadNoteErrorState()),
            },
        (r) => {
              note = r,
              print('$r'),
              emit(ReadNoteSuccessState()),
            });
  }

  FutureOr<void> updateNote(ParameterToDo parameter) async {
    emit(UpdateNoteLoadingState());
    final result =
        await updateNoteDBUseCase(ParameterToDo(note: parameter.note));
    result.fold(
        (l) => {
              print('eeeee$l'),
              emit(UpdateNoteErrorState()),
            },
        (r) => {
              print(' rrrrrrr${r}'),
              emit(UpdateNoteSuccessState()),
            });
  }

  FutureOr<void> deleteNote(ParameterToDo parameter) async {
    emit(UpdateNoteLoadingState());

    final result = await deleteNoteDBUseCase(ParameterToDo(id: parameter.id));
    result.fold(
        (l) => {
              emit(UpdateNoteErrorState()),
              print('$l'),
            },
        (r) => {
              emit(UpdateNoteSuccessState()),
              print('$r'),
            });
  }

  FutureOr<void> closeNote(NoParameter noParameter) async {
    emit(CloseNoteLoadingState());
    final result = await closeNoteDBUseCase(noParameter);
    result.fold(
        (l) => {
              emit(CloseNoteErrorState()),
              print('$l'),
            },
        (r) => {
              emit(CloseNoteSuccessState()),
              print('$r'),
            });
  }

  FutureOr<void> createNote(ParameterToDo parameter) async {
    emit(CreateNoteLoadingState());
    final result =
        await createNoteDBUseCase(ParameterToDo(note: parameter.note));
    result.fold(
        (l) => {
              emit(CreateNoteErrorState()),
              print('$l'),
            },
        (r) => {
              emit(CreateNoteSuccessState()),
              print('$r'),
              print('pppppppppppp'),
            });
  }

  void editNote({required NoteModel note, required int id, context}) async {
    Navigator.popAndPushNamed(context, AppRoutes.editNotePage, arguments: note);
    await readNote(ParameterToDo(id: id));
  }
}
