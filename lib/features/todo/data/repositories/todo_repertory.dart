import 'package:dartz/dartz.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:todo/features/todo/domain/entities/note_entite.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/base_todo_repositories.dart';
import '../datasources/todo_local_data_source.dart';

class ToDoRepertory extends BaseToDoRepository {
  BaseToDoLocalDataSource baseToDoLocalDataSource;
  ToDoRepertory(this.baseToDoLocalDataSource);

  @override
  Future<Either<Failure, dynamic>> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Database>> createDB(Database db, int version) {
    // TODO: implement createDB
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Database>> initDB(String filePath) {
    // TODO: implement initDB
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Note>>> readAllNotes() {
    // TODO: implement readAllNotes
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Note>> readNote(int id) {
    // TODO: implement readNote
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> update(Note note) {
    // TODO: implement update
    throw UnimplementedError();
  }

 
}
