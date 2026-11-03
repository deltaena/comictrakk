import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class SqliteSubservice {

  String get dbName;
  String get dbCreateQuery;

  Future<Batch> openBatch() async {
    Database db = await open();

    return db.batch();
  }

  Future<Database> open() async {
    WidgetsFlutterBinding.ensureInitialized();

    return openDatabase(
      join(await getDatabasesPath(), 'comictrakk.db'),

      onCreate: (db, version) {
        return db.execute(
          dbCreateQuery,
        );
      },
      version: 1,
    );
  }

}