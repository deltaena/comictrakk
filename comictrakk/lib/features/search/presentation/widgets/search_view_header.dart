import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/item_search/cubit/search_cubit.dart';
import 'package:comictrakk/features/search_anchor/widgets/delta_search_anchor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewHeader extends StatelessWidget {
  final AppDatabase _db;

  const SearchViewHeader(this._db, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DeltaSearchAnchor(_db),
        ),
      ],
    );
  }
}
