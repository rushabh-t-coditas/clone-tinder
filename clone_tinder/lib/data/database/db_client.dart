import 'package:clone_tinder/data/database/data_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBClient {
  static final String dbName = "users.db";
  static final int dbVersion = 1;

  DBClient._constructor();

  static final DBClient _instance = DBClient._constructor();

  factory DBClient() => _instance;

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initializeDB();
      return _database;
    }
  }

  Future<Database> initializeDB() async {
    String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: dbVersion,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );
  }

  Future onCreate(Database db, int version) async {
    await db.execute(DataTable.create);
  }

  void onUpgrade(Database db, int oldVersion, int newVersion) {}
}
