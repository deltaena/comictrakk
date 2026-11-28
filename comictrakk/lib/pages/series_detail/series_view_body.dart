import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/core/widgets/loading_indicator.dart';
import 'package:comictrakk/features/issues/cubit/issue_cubit.dart';
import 'package:comictrakk/features/issues/cubit/issue_state.dart';
import 'package:comictrakk/features/issues/view/issue_listview.dart';
import 'package:comictrakk/features/issues/widgets/slidable_issue_item.dart';
import 'package:comictrakk/features/trackers/cubit/tracker_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeriesViewBody extends StatelessWidget {
  final Series _series;

  const SeriesViewBody(this._series, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IssueCubit, IssueState>(
        builder: (context, state) {
          if(state is IssueLoading) return LoadingIndicator();
          if(state is IssueLoaded) return IssueListview(series: _series, mergers: state.issues);
          if(state is IssueError) return Text(state.message);

          return Text("something really bad happened");
        }
    );
  }

}