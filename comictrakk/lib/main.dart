import 'package:comictrakk/core/database/app_database.dart';
import 'package:flutter/material.dart';
import 'features/search/presentation/views/search_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final AppDatabase _db = AppDatabase.defaults();

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SearchPage(db: _db)
    );
  }
}
