import 'package:comictrakk/core/models/series/series_snippet.dart';
import 'package:comictrakk/features/series_detail/presentation/cubit/series_detail_cubit.dart';
import 'package:comictrakk/features/series_detail/presentation/cubit/series_detail_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/constants/mock_models.dart';
import '../../../../core/network/mock_comic_api_client.dart';

void main(){

  group("SearchDetail", () {
    SeriesSnippet mockSeriesSnippet = MockModels().mockSeriesSnippet;
    MockComicApiClient mockApi = MockComicApiClient();

    late SeriesDetailCubit seriesDetailCubit;

    setUp(() {
      seriesDetailCubit = SeriesDetailCubit(seriesSnippet: mockSeriesSnippet, mockApi: mockApi);
    });

    tearDown(() {
      mockApi.testBehaviour = "";
      seriesDetailCubit.close();
    });


    test("initial status is loading", () {
      expect(seriesDetailCubit.state, isA<SeriesDetailLoading>());
    });


    test("on load don't change status", () async {
      mockApi.testBehaviour = "wait";
      var test = seriesDetailCubit.loadInitialData();

      expect(seriesDetailCubit.state, isA<SeriesDetailLoading>());

      await test;
    });


    test("on loaded data return issues and series detail", () async {
      await seriesDetailCubit.loadInitialData();

      expect(seriesDetailCubit.state, isA<SeriesDetailLoaded>());

      SeriesDetailLoaded loadedState = seriesDetailCubit.state as SeriesDetailLoaded;

      expect(loadedState.series.id, 5537);
      expect(loadedState.issues.length, 100);
    });

    test("on loading fail return exception", () async {
      mockApi.testBehaviour = "fail";

      await seriesDetailCubit.loadInitialData();

      expect(seriesDetailCubit.state, isA<SeriesDetailError>());

      SeriesDetailError errorState = seriesDetailCubit.state as SeriesDetailError;

      expect(errorState.message, "Exception: Something went wrong...");
    });
  });

}
