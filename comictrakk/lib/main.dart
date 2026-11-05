import 'package:flutter/material.dart';
import 'features/search/presentation/views/search_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SearchPage()
    );
  }
}
