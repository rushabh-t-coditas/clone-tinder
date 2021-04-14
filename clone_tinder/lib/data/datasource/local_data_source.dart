import 'package:clone_tinder/data/models/results.dart';
import 'package:clone_tinder/data/models/user_data.dart';
import 'package:clone_tinder/data/database/data_table.dart';
import 'package:clone_tinder/data/database/db_client.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';

class LocalDataSource {
  DBClient _dbClient;
  int count;

  LocalDataSource() {
    _dbClient = DBClient();
  }

  Future<int> getCount() async {
    var database = await _dbClient.database;
    count = Sqflite.firstIntValue(await database
        .rawQuery('SELECT COUNT (*) from ${DataTable.tableName}'));
    return count;
  }

  Future<UserData> getUser() async {
    var database = await _dbClient.database;
    List<Map<String, dynamic>> mapValues =
        await database.query(DataTable.tableName, limit: count);

    List<Results> result = {mapValues ?? []}.isNotEmpty
        ? mapValues
            .map((v) => DataTable.resultsFromMapValues(v)..isFavourite = true)
            .toList()
        : [];
    return UserData(results: result);
  }

  Future<UserData> getUserById(String id) async {
    var database = await _dbClient.database;
    List<Map<String, dynamic>> mapValues = await database.query(
        DataTable.tableName,
        where: '${DataTable.id} = ?',
        whereArgs: [id]);

    Results result = DataTable.resultsFromMapValues(mapValues.first);
    return UserData(results: [result]);
  }

  Future<bool> removeUserById(String id) async {
    var database = await _dbClient.database;
    bool success = await database.delete(
          DataTable.tableName,
          where: '${DataTable.id} = ?',
          whereArgs: [id],
        ) >
        0;
    return success;
  }

  Future<bool> saveUser(Results result) async {
    var database = await _dbClient.database;
    bool success = await database.insert(
          DataTable.tableName,
          {
            DataTable.id: result.id,
            DataTable.results: result.toJsonString(),
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        ) >
        0;
    return success;
  }
}
