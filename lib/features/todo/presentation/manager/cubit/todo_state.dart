part of 'todo_cubit.dart';

sealed class ToDoState extends Equatable {
  const ToDoState();

  @override
  List<Object> get props => [];
}

final class ToDoInitialState extends ToDoState {}

final class LoadingState extends ToDoState {}

final class SuccessState extends ToDoState {}

final class ErrorState extends ToDoState {}
