import '../entities/historical.entity.dart';

abstract class HistoricalRepository {
  Future<List<HistoricalEntity>> getHistorical({
    int? userId,
    Map<String, String>? query,
  });
}
