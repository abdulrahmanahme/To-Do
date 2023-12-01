import 'package:dartz/dartz.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo/features/todo/data/models/note_model.dart';

import '../../../../core/error/failure.dart';

abstract class BaseToDoLocalDataSource {
  Future<Either<Failure, Database>> initDB(String filePath);
  Future<Either<Failure, Database>> createDB(Database db, int version);
   Future<Either<Failure,NoteModel>> readNote(int id);
  Future<Either<Failure,List<NoteModel>>> readAllNotes();
  Future<Either<Failure,int>> update(NoteModel note);
  Future<Either<Failure,int>> delete(int id);
  Future<Either<Failure,dynamic>> close();
}

class ToDoLocalDataSource extends BaseToDoLocalDataSource  {
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
  Future<Either<Failure, List<NoteModel>>> readAllNotes() {
    // TODO: implement readAllNotes
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NoteModel>> readNote(int id) {
    // TODO: implement readNote
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> update(NoteModel note) {
    // TODO: implement update
    throw UnimplementedError();
  }

 
}
