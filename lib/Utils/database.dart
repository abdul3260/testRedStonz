import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:testproject_redstonz/Models/history_model.dart';

class LocalDatabase {
  static Database? _database;
  static final LocalDatabase instance = LocalDatabase._init();
  LocalDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("history.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final integerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';

    db.execute('''
CREATE TABLE $tableHistory (
        ${HistoryFields.id} $idType,
        ${HistoryFields.dateAndTime} $textType,
        ${HistoryFields.ipAddress} $textType,
        ${HistoryFields.deviceName} $textType,
        ${HistoryFields.screenResolution} $textType,
        ${HistoryFields.deviceOperatingSystem} $textType,
      )
''');
  }

  Future<History> create(History history) async {
    final db = await instance.database;

    final id = await db.insert(tableHistory, history.toJson());
    return history.copy(id: id);
    // return db;
  }

  Future<History> readNote(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableHistory,
      columns: HistoryFields.value,
      where: '${HistoryFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return History.fromJson(maps.first);
    } else {
      throw Exception("ID $id not found");
    }
  }

  Future<List<History>> readAllHistory() async {
    // TODO: maybe error here.
    final orderBy = '${HistoryFields.id} ASC';
    final db = await instance.database;
    final result = await db.query(tableHistory);
    return result.map((json) => History.fromJson(json)).toList();
  }

  Future<int> update(History history) async {
    final db = await instance.database;
    return db.update(
      tableHistory,
      history.toJson(),
      where: '${HistoryFields.id} = ?',
      whereArgs: [history.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return db.delete(
      tableHistory,
      where: '${HistoryFields.id}=?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
