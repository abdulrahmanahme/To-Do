import 'package:dartz/dartz.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo/features/todo/data/models/note_model.dart';

import '../../../../core/error/failure.dart';

abstract class BaseToDoLocalDataSource {
  Future<Database> initDB(String filePath);
  Future<Database> createDB(Database db, int version);
  Future<NoteModel> readNote(int id);
  Future<List<NoteModel>> readAllNotes();
  Future<int> update(NoteModel note);
  Future<int> delete(int id);
  Future<dynamic> close();
  Future<Database> get database;
}

class ToDoLocalDataSource extends BaseToDoLocalDataSource {
  final ToDoLocalDataSource instance = ToDoLocalDataSource._init();

  ToDoLocalDataSource._init();
  static Database? _database;

  @override
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB('notes.db');
    return _database!;
  }

  @override
  Future close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Future<Database> createDB(Database db, int version) {
    // TODO: implement createDB
    throw UnimplementedError();
  }

  @override
  Future<int> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Database> initDB(String filePath) {
    // TODO: implement initDB
    throw UnimplementedError();
  }

  @override
  Future<List<NoteModel>> readAllNotes() {
    // TODO: implement readAllNotes
    throw UnimplementedError();
  }

  @override
  Future<NoteModel> readNote(int id) {
    // TODO: implement readNote
    throw UnimplementedError();
  }

  @override
  Future<int> update(NoteModel note) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
