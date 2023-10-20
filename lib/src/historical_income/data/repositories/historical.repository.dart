import '../../domain/repositories/historical.repository.dart';
import '../datasources/historical.datasource.dart';
import '../models/historical.model.dart';

class HistoricalRepositoryImpl implements HistoricalRepository {
  final HistoricalDataSource _service;

  HistoricalRepositoryImpl(this._service);

  @override
  Future<List<HistoricalModel>> getHistorical({
    int? userId,
    Map<String, String>? query,
  }) async {
    return _service.getHistorical(userId: userId);
  }
}
