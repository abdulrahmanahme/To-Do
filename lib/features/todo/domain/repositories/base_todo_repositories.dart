import 'package:dartz/dartz.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo/features/todo/domain/usecases/create_db_use_case.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/model/parameter_todo_model.dart';
import '../entities/note_entite.dart';
abstract class BaseToDoRepository{
  Future<Either<Failure, Database>> initDB(ParameterToDo filePath);
  Future<Either<Failure, Database>> createDB(ParameterDB db, ParameterDB version,);
  Future<Either<Failure,Note>> readNote(ParameterToDo id);
  Future<Either<Failure,List<Note>>> readAllNotes();
  Future<Either<Failure,int>> update(ParameterToDo note);
  Future<Either<Failure,int>> delete(ParameterToDo note);
  Future<Either<Failure,dynamic>> close();

}