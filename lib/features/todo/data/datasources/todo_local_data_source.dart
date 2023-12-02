import 'package:sqflite/sqlite_api.dart';
import 'package:todo/core/model/parameter_todo_model.dart';
import 'package:todo/features/todo/data/models/note_model.dart';
import '../../../../config/consts/app_const.dart';
import '../../../../config/consts/note_const.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseToDoLocalDataSource {
  Future<Database> initDB(ParameterToDo parameter);
  Future createDB(Database db, int version);
  Future<NoteModel> readNote(ParameterToDo parameter);
  Future<NoteModel> create(ParameterToDo parameter);
  Future<List<NoteModel>> readAllNotes();
  Future<int> update(ParameterToDo parameter);
  Future<int> delete(ParameterToDo parameter);
  Future<dynamic> close();
  Future<Database> get database;
}

class ToDoLocalDataSource extends BaseToDoLocalDataSource {
  static Database? _database;

  @override
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB(const ParameterToDo(filePath: 'notes.db'));
    return _database!;
  }

  @override
  Future close() async {
    final db = await database;
    _database = null;
    db.close();
  }

  @override
  Future<dynamic> createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE ${AppConst.tableNotes} ( 
  ${NoteFields.id} ${AppConst.idType}, 
  ${NoteFields.number} ${AppConst.integerType},
  ${NoteFields.title} ${AppConst.textType},
  ${NoteFields.description} ${AppConst.textType},
  ${NoteFields.time} ${AppConst.textType}
  )
''');
  }

  @override
  Future<int> delete(ParameterToDo parameter) async {
    final db = await database;
    return await db.delete(
      AppConst.tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [parameter.id],
    );
  }

  @override
  Future<Database> initDB(ParameterToDo parameter) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, parameter.filePath);
    return await openDatabase(path, version: 1, onCreate: createDB);
  }

  @override
  Future<List<NoteModel>> readAllNotes() async {
    final db = await database;
    final orderBy = '${NoteFields.time} ASC';
    final result = await db.query(AppConst.tableNotes, orderBy: orderBy);
    return result.map((json) => NoteModel.fromJson(json)).toList();
  }

  @override
  Future<NoteModel> readNote(ParameterToDo parameter) async {
    final db = await database;
    final maps = await db.query(
      AppConst.tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [parameter.id],
    );
    if (maps.isNotEmpty) {
      return NoteModel.fromJson(maps.first);
    } else {
      throw Exception('ID ${parameter.id} not found');
    }
  }

  @override
  Future<int> update(ParameterToDo parameter) async {
    final db = await database;
    return db.update(
      AppConst.tableNotes,
      parameter.note!.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [parameter.note!.id],
    );
  }

  @override
  Future<NoteModel> create(ParameterToDo parameter) async {
    final db = await database;
    final id = await db.insert(AppConst.tableNotes, parameter.note!.toJson());
    return parameter.note!.copy(id: id);
  }
}
