import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/pages/library/library_page.dart';
import 'package:comictrakk/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final AppDatabase _db = AppDatabase.defaults();

  MainApp({super.key});

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: PersistentTabView(
          controller: _controller,
          tabs: [
            PersistentTabConfig(
              screen: SearchPage(_db),
              item: ItemConfig(
                icon: Icon(Icons.search),
                title: "Search",
              ),
            ),
            PersistentTabConfig(
              screen: LibraryPage(_db),
              item: ItemConfig(
                icon: Icon(Icons.home),
                title: "Library",
              ),
            ),
            PersistentTabConfig(
              screen: SearchPage(_db),
              item: ItemConfig(
                icon: Icon(Icons.settings),
                title: "Settings",
              ),
            ),
          ],
          navBarBuilder: (navBarConfig) => Style13BottomNavBar(
            navBarConfig: navBarConfig,
          ),
        )
    );
  }
}
