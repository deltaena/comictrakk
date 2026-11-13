import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class SqliteSubservice {

  String get tableName;
  String get tableCreateQuery;
  int get version;

  static Database? _db;

  Future<Batch> openBatch() async {
    Database db = await open();

    return db.batch();
  }

  Future<Database> open() async {
    WidgetsFlutterBinding.ensureInitialized();

    if(_db == null || !(_db!.isOpen) ) {
      _db = await openDatabase(
        join(await getDatabasesPath(), 'comictrakk.db'),
        version: version,

        onCreate: (db, version) {
          return db.execute(
            tableCreateQuery,
          );
        },
      );
    }

    return _db!;
  }

  Future<void> closeDatabase() async {
    if (_db != null) {
      await _db!.close();
      _db = null;
    }

    // Completely wipe the database file from disk to prevent data leakage
    final path = join(await getDatabasesPath(), tableName);
    await databaseFactory.deleteDatabase(path);
  }
}