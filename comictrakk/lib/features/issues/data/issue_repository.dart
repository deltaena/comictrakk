import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/core/network/comic_api_client.dart';
import 'package:comictrakk/features/issues/models/issue_row_merger.dart';
import 'package:comictrakk/features/reprints/data/reprint_mapper.dart';
import 'package:comictrakk/features/reprints/data/reprints_dao.dart';

import 'issue_dao.dart';
import 'issue_mapper.dart';

class IssueRepository {
  final ComicApiClient _api = ComicApiClient();
  final IssueDao _dao;
  final ReprintDao _reprintsDao;

  final IssueMapper _mapper = IssueMapper();
  final ReprintMapper _reprintsMapper = ReprintMapper();

  IssueRepository({required this._dao, required this._reprintsDao});

  Stream<List<IssueRowMerger>> watchIssue(int issueId) => _dao.watchIssuesById(issueId);
  Stream<List<IssueRowMerger>> watchIssuesInSeries(int seriesId) => _dao.watchIssuesInSeries(seriesId);
  Stream<List<IssueRowMerger>> watchTrackedIssues() => _dao.watchTrackedIssues();

  Future<void> fetchIssuesInSeries(int seriesId) async {
    List<Issue> cachedIssues = await _dao.getIssuesInSeries(seriesId);
    if(cachedIssues.isNotEmpty) return;

    List<dynamic> fetchedIssues = await _api.fetchIssuesInSeries(seriesId);
    List<IssuesCompanion> companions = fetchedIssues.map((issue) => _mapper.issueFromMap(issue)).toList();

    _dao.cacheIssues(companions);
  }

  Future<void> fetchIssuesDetails(int issueId) async {
    List<IssueDetail> cachedDetails = await _dao.getIssueDetails(issueId);
    if(cachedDetails.isNotEmpty) return;

    Map<String, dynamic> fetchedDetails = await _api.fetchIssueDetail(issueId);
    IssueDetailsCompanion issues = _mapper.issueDetailFromMap(fetchedDetails);

    List<dynamic> fetchedReprints = fetchedDetails["reprints"];
    List<ReprintsCompanion> reprints = fetchedReprints.map((reprint) => _reprintsMapper.fromMap(issueId, reprint)).toList();

    await _dao.cacheIssueDetail(issues);
    await _reprintsDao.insertMultiple(reprints);
  }

}




















