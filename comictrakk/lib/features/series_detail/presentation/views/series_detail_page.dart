import 'package:comictrakk/core/constants/app_assets.dart';
import 'package:comictrakk/core/models/trackable/trackable.dart';
import 'package:comictrakk/features/comic_tracking/presentation/tracking_cubit.dart';
import 'package:comictrakk/features/comic_tracking/presentation/tracking_state.dart';
import 'package:comictrakk/features/series_detail/presentation/cubit/series_detail_cubit.dart';
import 'package:comictrakk/features/series_detail/presentation/cubit/series_detail_state.dart';
import 'package:comictrakk/features/series_detail/presentation/widgets/issue_preview_list_item.dart';
import 'package:comictrakk/core/models/series/series_detail.dart';
import 'package:comictrakk/core/models/series/series_preview.dart';
import 'package:comictrakk/core/enums/comic_tracking_status.dart';
import 'package:comictrakk/features/series_detail/presentation/widgets/propagation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SeriesDetailPage extends StatelessWidget {

  final SeriesPreview _seriesPreview;

  const SeriesDetailPage({super.key, required this._seriesPreview});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SeriesDetailCubit>(
          create: (context) => SeriesDetailCubit(seriesSnippet: _seriesPreview)
        ),
        BlocProvider<TrackingCubit>(
            create: (context) => TrackingCubit()
        )
      ],
      child: SeriesDetailView(seriesPreview: _seriesPreview,)
    );
  }
}

class SeriesDetailView extends StatelessWidget {

  final SeriesPreview _seriesPreview;

  const SeriesDetailView({super.key, required this._seriesPreview});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            getSeriesHeader(),
            BlocListener<SeriesDetailCubit, SeriesDetailState>(
              listener: (context, state) {
                if (state is SeriesDetailLoaded) {
                  context.read<TrackingCubit>().loadInitialStatuses(state.issues);
                }

              },
              child: BlocBuilder<SeriesDetailCubit, SeriesDetailState>(
                builder: (context, state) {
                  if(state is SeriesDetailLoading) {
                    context.read<SeriesDetailCubit>().loadInitialData();
                    return getLoadingIndicator();
                  }
                  if(state is SeriesDetailLoaded) return getIssuesList(state.series, state);
                  if(state is SeriesDetailError) return Text("error: ${state.message}");

                  return (Text("The bad guys made something very bad"));
                })
            )
          ],
        ),
      )
    );
  }

  SizedBox getSeriesHeader(){
    return SizedBox(
      height: 150,
      child: Container(
        color: Colors.black38,
        child: Column(
          children: [
            Text(_seriesPreview.name),
            Text("Vol. ${_seriesPreview.volumeNumber}"),
            Text("${_seriesPreview.yearBegan} - ${(_seriesPreview.yearEnd == -1) ? "present": _seriesPreview.yearEnd.toString()}")
          ]
      ))
    );
  }

  Expanded getIssuesList(SeriesDetail series, SeriesDetailLoaded loadedState){
    return Expanded(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: loadedState.issues.length,
          itemBuilder: (BuildContext context, int index) {
            final issue = loadedState.issues[index];

            return BlocSelector<TrackingCubit, TrackingState, ComicTrackingStatus> (
                selector: (state) {
                  if(state.trackables.isEmpty){
                    return ComicTrackingStatus.fromInt(0);
                  }

                  Map<int, ComicTrackingStatus> statusesMap = { for (Trackable t in state.trackables) t.id: t.getComicStatus() };

                  if(!statusesMap.containsKey(issue.id)){
                    return issue.getComicStatus();
                  }

                  return statusesMap[issue.id]!;
                },
                builder: (context, comicStatus) {
                  issue.setComicStatus(comicStatus);
                  return IssuePreviewListItem(
                    series: series,
                    issue: issue,
                    onStatusSelected: (ComicTrackingStatus selectedStatus) async {
                      bool propagate = false;

                      TrackingCubit trackingCubit = context.read<TrackingCubit>();

                      if(series.seriesType.isCollected) {
                        propagate = await showPropagationDialog(context);
                      }

                      trackingCubit.updateTrackingStatus(issue, selectedStatus, propagate);
                    },
                  );
                }
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Padding(padding: EdgeInsetsGeometry.fromLTRB(0, 2, 0, 2),
                child: SizedBox(
                  height: 1.0,
                  width: double.infinity,
                  child: ColoredBox(color: Color(0xFF000000)),
                )
            );
          },
        )
    );
  }

  Expanded getIdleLogo(){
    return Expanded(
        child: SvgPicture.asset(
          AppAssets.batmanLogo,
          width: 110,
          height: 110,
          fit: BoxFit.contain,
        )
    );
  }

  Center getLoadingIndicator(){
    return Center(child: CircularProgressIndicator());
  }

  Future<bool> showPropagationDialog(BuildContext context) async {
    return await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return PropagationDialog(series: _seriesPreview);
        }
    ) ?? false;
  }
}






















