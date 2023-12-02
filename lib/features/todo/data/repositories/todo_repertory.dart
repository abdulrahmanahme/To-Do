import 'package:dartz/dartz.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:todo/core/model/parameter_todo_model.dart';
import 'package:todo/features/todo/data/models/note_model.dart';
import 'package:todo/features/todo/domain/entities/note_entite.dart';
import 'package:todo/features/todo/domain/usecases/create_db_use_case.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/base_todo_repositories.dart';
import '../datasources/todo_local_data_source.dart';

class ToDoRepertory extends BaseToDoRepository {
  BaseToDoLocalDataSource baseToDoLocalDataSource;
  ToDoRepertory(this.baseToDoLocalDataSource);

  @override
  Future<Either<Failure, dynamic>> close() async {
    final result = await baseToDoLocalDataSource.close();
    try {
      return right(result);
    } on Failure catch (failure) {
      return left(LocalFailure(message: failure.message));
    }
  }

  @override
  Future<Either<Failure, Note>> create(ParameterToDo parameter) async {
    final result = await baseToDoLocalDataSource.create(parameter);
    try {
      return right(result);
    } on Failure catch (failure) {
      return left(LocalFailure(message: failure.message));
    }
  }

  @override
  Future<Either<Failure, Database>> createDB(ParameterDB parameter) async {
    final result =
        await baseToDoLocalDataSource.createDB(parameter.db, parameter.version);
    try {
      return right(result);
    } on Failure catch (failure) {
      return left(LocalFailure(message: failure.message));
    }
  }

  @override
  Future<Either<Failure, int>> delete(ParameterToDo parameter) async {
    final result = await baseToDoLocalDataSource.delete(parameter);
    try {
      return right(result);
    } on Failure catch (failure) {
      return left(LocalFailure(message: failure.message));
    }
  }

  @override
  Future<Either<Failure, Database>> initDB(ParameterToDo parameter) async {
    final result = await baseToDoLocalDataSource.initDB(parameter);
    try {
      return right(result);
    } on Failure catch (failure) {
      return left(LocalFailure(message: failure.message));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> readAllNotes() async {
    final result = await baseToDoLocalDataSource.readAllNotes();
    try {
      return right(result);
    } on Failure catch (failure) {
      return left(LocalFailure(message: failure.message));
    }
  }

  @override
  Future<Either<Failure, NoteModel>> readNote(ParameterToDo parameter) async {
    final result = await baseToDoLocalDataSource.readNote(parameter);
    try {
      return right(result);
    } on Failure catch (failure) {
      return left(LocalFailure(message: failure.message));
    }
  }

  @override
  Future<Either<Failure, int>> update(ParameterToDo parameter) async {
    final result = await baseToDoLocalDataSource.update(parameter);
    try {
      return right(result);
    } on Failure catch (failure) {
      return left(LocalFailure(message: failure.message));
    }
  }
}
