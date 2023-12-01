import 'package:dartz/dartz.dart';
import 'package:sqflite/sqlite_api.dart';
import '../../../../core/error/failure.dart';
import '../entities/note_entite.dart';
abstract class BaseToDoRepository{
  Future<Either<Failure, Database>> initDB(String filePath);
  Future<Either<Failure, Database>> createDB(Database db, int version,);
  Future<Either<Failure,Note>> readNote(int id);
  Future<Either<Failure,List<Note>>> readAllNotes();
  Future<Either<Failure,int>> update(Note note);
  Future<Either<Failure,int>> delete(int id);
  Future<Either<Failure,dynamic>> close();

}