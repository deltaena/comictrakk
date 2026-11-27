import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/core/widgets/custom_separator.dart';
import 'package:comictrakk/features/series/models/series_merger.dart';
import 'package:comictrakk/features/series/widgets/series_listview_item.dart';
import 'package:comictrakk/features/series_detail/presentation/views/series_detail_page.dart';
import 'package:flutter/material.dart';

class SeriesListView extends StatelessWidget {
  final AppDatabase _db;
  final List<SeriesMerger> mergers;

  const SeriesListView({super.key, required this._db, required this.mergers});

  @override
  Widget build(BuildContext context) {
    onSeriesSelected(Series selectedSeries) {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => SeriesDetailPage(db: _db, series: selectedSeries),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: mergers.length,
      itemBuilder: (BuildContext context, int index) =>
          SeriesListViewItem(series: mergers[index].series, onTapped: onSeriesSelected),
      separatorBuilder: (context, index) => CustomSeparator(),
    );
  }
}
