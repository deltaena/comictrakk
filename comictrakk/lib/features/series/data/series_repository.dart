import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/core/network/comic_api_client.dart';
import 'package:comictrakk/features/series/data/series_dao.dart';
import 'package:comictrakk/features/series/data/series_mapper.dart';
import 'package:comictrakk/features/series/models/series_merger.dart';

class SeriesRepository {
  final ComicApiClient _api = ComicApiClient();
  final SeriesMapper _mapper = SeriesMapper();
  final SeriesDao _dao;

  SeriesRepository(this._dao);

  Stream<List<SeriesMerger>> watchSeries(int seriesId) => _dao.watchSeriesById(seriesId);
  Stream<List<SeriesMerger>> watchLastSearchedSeries() => _dao.watchLastSearchedSeries();

  Future<List<int>> fetchSeriesByName(String query) async {
    List<dynamic> fetchedSeries = await _api.getSeriesByName(query);
    List<SeriesTCompanion> series = fetchedSeries.map((series) => _mapper.fromMap(series)).toList();

    await _dao.cacheSeriesList(series);

    return series.map((element) => element.id.value).toList();
  }

  Future<void> fetchDetails(int seriesId) async {
    Map<String, dynamic> fetchedDetail = await _api.getSeriesDetail(seriesId);
    SeriesDetailsCompanion detail = _mapper.detailsFromMap(fetchedDetail);

    await _dao.cacheDetail(detail);
  }

}