import 'package:comictrakk/core/widgets/idle_logo.dart';
import 'package:comictrakk/features/trackers/cubit/tracker_cubit.dart';
import 'package:comictrakk/features/trackers/cubit/tracker_state.dart';
import 'package:comictrakk/features/trackers/views/tracking_resume.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryViewBody extends StatelessWidget {
  const LibraryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<TrackerCubit, TrackerState>(
          builder: (context, state) {
            if (state is TrackerInitial) return IdleLogo();
            if (state is TrackerLoaded) return Expanded(flex: 1, child: TrackingResume(state.mergers));

            return Text("something went wrong");
          },
        ),
        Divider(),
        BlocBuilder<TrackerCubit, TrackerState>(
          builder: (context, state) {
            if (state is TrackerInitial) return IdleLogo();
            if (state is TrackerLoaded) return Expanded(flex: 6, child: TrackingResume(state.mergers));

            return Text("something went wrong");
          },
        ),
      ],
    );
  }
}
