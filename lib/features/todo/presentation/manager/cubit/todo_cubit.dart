import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/core/usecase/use_case.dart';
import '../../../../../core/model/parameter_todo_model.dart';
import '../../../domain/usecases/close_use_case.dart';
import '../../../domain/usecases/create_db_use_case.dart';
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
      this.closeNoteDBUseCase)
      : super(ToDoInitialState());
  final CreateDBUseCase createDBUseCase;
  final InitDBUseCase initDBUseCase;
  final ReadAllNoteDBUseCase readAllNoteDBUseCase;
  final ReadNoteDBUseCase readNoteDBUseCase;
  final UpdateNoteDBUseCase updateNoteDBUseCase;
  final DeleteNoteDBUseCase deleteNoteDBUseCase;
  final CloseNoteDBUseCase closeNoteDBUseCase;

  void createDB(ParameterDB parameter) async {
    emit(CreateDBLoadingState());
    final result = await createDBUseCase(
        ParameterDB(db: parameter.db, version: parameter.version));
    result.fold(
        (l) => {
              print('$l'),
              emit(CreateDBSuccessState()),
            },
        (r) => {
              print('$r'),
              emit(CreateDBErrorState()),
            });
  }

  void initDB(ParameterToDo parameter) async {
    emit(InitDBLoadingState());
    final result =
        await initDBUseCase(ParameterToDo(filePath: parameter.filePath));
    result.fold(
        (l) => {
              print('$l'),
              emit(InitDBSuccessState()),
            },
        (r) => {
              emit(InitDBErrorState()),
              print('$r'),
            });
  }

  void readAllNote(ParameterToDo parameter) async {
    emit(ReadAllLoadingState());
    final result = await readNoteDBUseCase(ParameterToDo(id: parameter.id));
    result.fold(
        (l) => {
              print('$l'),
              emit(ReadAllSuccessState()),
            },
        (r) => {
              print('$r'),
              emit(ReadAllErrorState()),
            });
  }

  void updateNote(ParameterToDo parameter) async {
    emit(ReadNoteLoadingState());
    final result =
        await updateNoteDBUseCase(ParameterToDo(note: parameter.note));
    result.fold(
        (l) => {
              print('$l'),
              emit(ReadNoteSuccessState()),
            },
        (r) => {
              print('$r'),
              emit(ReadNoteErrorState()),
            });
  }

  void deleteNote(ParameterToDo parameter) async {
    emit(UpdateNoteLoadingState());

    final result = await deleteNoteDBUseCase(ParameterToDo(id: parameter.id));
    result.fold(
        (l) => {
              emit(UpdateNoteSuccessState()),
              print('$l'),
            },
        (r) => {
              emit(UpdateNoteErrorState()),
              print('$r'),
            });
  }

  void closeNote(NoParameter noParameter) async {
    emit(CloseNoteLoadingState());
    final result = await closeNoteDBUseCase(noParameter);
    result.fold(
        (l) => {
              emit(CloseNoteSuccessState()),
              print('$l'),
            },
        (r) => {
              emit(CloseNoteErrorState()),
              print('$r'),
            });
  }
}
