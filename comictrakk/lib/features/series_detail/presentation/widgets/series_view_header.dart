import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/series/cubit/series_cubit.dart';
import 'package:comictrakk/features/series/cubit/series_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeriesViewHeader extends StatelessWidget {
  final Series _series;

  const SeriesViewHeader(this._series, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesCubit, SeriesState>(
      builder: (context, state) {
        if (state is SeriesError) print("deltalog: error: ${state.message}");

        return Center(
          child: SizedBox(
            height: 150,
            child: Container(
              color: Colors.black38,
              child: Column(
                children: [
                  Text(_series.name),
                  Text("Vol. ${_series.volume}"),
                  Text(
                    "${_series.yearBegan} - ${(_series.yearEnd == -1) ? "present" : _series.yearEnd.toString()}",
                  ),

                  //if(state is SeriesDetailLoaded && state.series != null) Text(state.series!.description)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
