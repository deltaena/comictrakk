import 'package:comictrakk/core/constants/app_assets.dart';
import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/core/widgets/custom_separator.dart';
import 'package:comictrakk/core/widgets/idle_logo.dart';
import 'package:comictrakk/core/widgets/loading_indicator.dart';
import 'package:comictrakk/features/item_search/cubit/search_cubit.dart';
import 'package:comictrakk/features/item_search/cubit/search_state.dart';
import 'package:comictrakk/features/series/cubit/series_cubit.dart';
import 'package:comictrakk/features/series/cubit/series_state.dart';
import 'package:comictrakk/features/series/views/series_listview.dart';
import 'package:comictrakk/features/series/widgets/series_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchViewBody extends StatelessWidget {
  final AppDatabase _db;

  const SearchViewBody(this._db, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesCubit, SeriesState>(
      builder: (context, state) {
        if (state is SeriesInitial) return IdleLogo();
        if (state is SeriesLoading) return Center(child: LoadingIndicator());
        if (state is SeriesLoaded) return Expanded(child: SeriesListView(db: _db, mergers: state.mergers));
        if (state is SeriesError) return Text(state.message);

        return Text("something very bad happened");
      },
    );
  }
}





