import 'package:comictrakk/features/search/presentation/cubit/search_cubit.dart';
import 'package:comictrakk/features/search/presentation/cubit/search_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/network/mock_comic_api_client.dart';

void main(){

  group('SearchCubit', () {
    late SearchCubit searchCubit;
    MockComicApiClient mockApi = MockComicApiClient();

    setUp(() {
      searchCubit = SearchCubit(mockApi: mockApi);
    });

    tearDown(() {
      mockApi.testBehaviour = "";
      searchCubit.close();
    });

    test('initial state is SearchInitial', () {
      expect(searchCubit.state, isA<SearchInitial>());
    });


    test("on empty search don't change state", () {
      searchCubit.search("  ");

      expect(searchCubit.state, isA<SearchInitial>());
    });


    test("test search behaviour", () async {
      mockApi.testBehaviour = "wait";

      final search = searchCubit.search("Miles Morales");

      expect(searchCubit.state, isA<SearchLoading>());

      await search;

      expect(searchCubit.state, isA<SearchLoaded>());

      SearchLoaded mockState = searchCubit.state as SearchLoaded;

      expect(mockState.results.length, 20);
    });

    test("on search fail emit error state", () async {
      mockApi.testBehaviour = "fail";
      await searchCubit.search("Miles Morales");

      expect(searchCubit.state, isA<SearchError>());

      SearchError mockState = searchCubit.state as SearchError;

      expect(mockState.message, "Exception: Something went wrong...");
    });
  });
}
