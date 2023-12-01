part of 'todo_cubit.dart';

sealed class ToDoState extends Equatable {
  const ToDoState();

  @override
  List<Object> get props => [];
}

final class ToDoInitialState extends ToDoState {}

///////CreateDBState
final class CreateDBLoadingState extends ToDoState {}

final class CreateDBSuccessState extends ToDoState {}

final class CreateDBErrorState extends ToDoState {}

///////DeleteNote State
final class DeleteNoteLoadingState extends ToDoState {}

final class DeleteNoteSuccessState extends ToDoState {}

final class DeleteNoteErrorState extends ToDoState {}

///////Init DB State
final class InitDBLoadingState extends ToDoState {}

final class InitDBSuccessState extends ToDoState {}

final class InitDBErrorState extends ToDoState {}

///////Read all State
final class ReadAllLoadingState extends ToDoState {}

final class ReadAllSuccessState extends ToDoState {}

final class ReadAllErrorState extends ToDoState {}

///////Read NOTE State
final class ReadNoteLoadingState extends ToDoState {}

final class ReadNoteSuccessState extends ToDoState {}

final class ReadNoteErrorState extends ToDoState {}

///////Update NOTE State
final class UpdateNoteLoadingState extends ToDoState {}

final class UpdateNoteSuccessState extends ToDoState {}

final class UpdateNoteErrorState extends ToDoState {}

///////Close NOTE State
final class CloseNoteLoadingState extends ToDoState {}

final class CloseNoteSuccessState extends ToDoState {}

final class CloseNoteErrorState extends ToDoState {}
