import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/note_model.dart';

/*
class ProfileDatabase {
  ///kişi hakkındaki bilgiler ve sorulardan topladığı puanlar
  static final ProfileDatabase instance = ProfileDatabase._init();

  static Database? _database;

  /// sqflite tan gelir

  ProfileDatabase._init();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    ///path classından gelir

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL'; //About içeriği için
    final integerType = 'INTEGER NOT NULL'; //sınavlardan ve oyunlardan toplanan toplam puan için

    await db.execute('''
CREATE TABLE $tableInfos ( 
${InfoFields.id} $idType, 
  ${InfoFields.point} $integerType,
  ${InfoFields.description} $textType,
  ${InfoFields.time} $textType
  )
''');
  }

  Future<Info> create (Info info) async{
    final db = await instance.database;
    final id = await db?.insert(tableInfos, info.toJson()); ///insert metodu aynı zamanada son eklenen satırın id sini döndürür
    return info.copy(id : id);
  }

  Future<Info> readNote(int id) async {
    final db = await instance.database;

    final maps = await db!.query(
      tableInfos,
      columns: InfoFields.values,
      where: '${InfoFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Info.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Info>> readAllNotes() async{
    final db = await instance.database;
    final orderBy = '${InfoFields.time} ASC';

    final result = await db!.query(tableInfos , orderBy:  orderBy);

    return result.map((json) => Info.fromJson(json)).toList();
  }

  Future<int> update(Info info) async {
    final db = await instance.database;

    return db!.update(
      tableInfos,
      info.toJson(),
      where: '${InfoFields.id} = ?',
      whereArgs: [info.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db!.delete(
      tableInfos,
      where: '${InfoFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db?.close();
  }
}*/

class DbHelper{
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'notedatabase.db'),
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, description TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertnote(Note note) async {
    final db = await initializeDB();
    await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Note>> notes() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('notes');
    return queryResult.map((e) => Note.fromMap(e)).toList();
  }

  Future<void> deletenote(int id) async {
    final db = await initializeDB();
    await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}