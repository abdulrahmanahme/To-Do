import 'package:sqflite/sqlite_api.dart';
import 'package:todo/features/todo/data/models/note_model.dart';
import '../../../../config/consts/app_const.dart';
import '../../../../config/consts/note_const.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseToDoLocalDataSource {
  Future<Database> initDB(String filePath);
  Future createDB(Database db, int version);
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
  Future close() async {
    final db = await instance.database;
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
  ${NoteFields.time} ${AppConst.textType},
  )
''');
  }

  @override
  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      AppConst.tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<Database> initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: createDB);
  }

  @override
  Future<List<NoteModel>> readAllNotes() async {
    final db = await instance.database;
    final orderBy = '${NoteFields.time} ASC';
    final result = await db.query(AppConst.tableNotes, orderBy: orderBy);

    return result.map((json) => NoteModel.fromJson(json)).toList();
  }

  @override
  Future<NoteModel> readNote(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      AppConst.tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return NoteModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  @override
  Future<int> update(NoteModel note) async {
    final db = await instance.database;
    return db.update(
      AppConst.tableNotes,
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    );
  }
}
