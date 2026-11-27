import 'package:comictrakk/core/database/app_database.dart';
import 'package:comictrakk/features/reprints/data/reprints_dao.dart';

class ReprintRepository {
  final ReprintDao _dao;

  ReprintRepository(this._dao);

  Future<List<Reprint>> getReprintsOfCollection(int issueId){
    return _dao.getReprintsOfCollection(issueId);
  }

}