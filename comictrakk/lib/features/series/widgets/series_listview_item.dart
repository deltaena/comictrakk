import 'package:comictrakk/core/database/app_database.dart';
import 'package:flutter/material.dart';

class SeriesListViewItem extends StatelessWidget {
  final Function _onTapped;
  final Series _series;

  const SeriesListViewItem({super.key, required this._series, required this._onTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTapped(_series),
      child: SizedBox(
        height: 70,
        child: Row(
          children: [
            getCenterRow(),
            getLeadingRow()
          ],
        ),
      ),
    );
  }

  Expanded getLeadingRow(){
    return Expanded(
      flex: 1,
      child: Center(child: Text("${_series.issueCount}")),
    );
  }

  Expanded getCenterRow(){
    return Expanded(
      flex: 15,
      child: Column(
        children: [
          Text(_series.name,
            overflow: TextOverflow.ellipsis,
          ),
          Text("Vol. ${_series.volume} - ${_series.yearBegan}"),
        ],
      ),
    );
  }
}
