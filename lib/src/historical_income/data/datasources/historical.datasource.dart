import 'package:dio/dio.dart';
import 'package:mobile/commons/extensions.dart';
import '../models/historical.model.dart';

abstract class HistoricalDataSource {
  final Dio _dio = Dio();

  Future<List<HistoricalModel>> getHistorical({
    int? userId,
    Map<String, String>? query,
  });
}

class HistoricalServices extends HistoricalDataSource {
  @override
  Future<List<HistoricalModel>> getHistorical({
    int? userId,
    Map<String, String>? query,
  }) async {
    //* THIS IS A MOCK OF THE API
    final response = await Future.delayed(
      const Duration(seconds: 2),
      () => {
        'historicalRecord': [
          {
            "transactionDescriptionType": "Food",
            "amount": 23.0,
            "expenseDate": "2023-09-23",
            "transactionType": "other"
          },
          {
            "transactionDescriptionType": "Food",
            "amount": 23.0,
            "expenseDate": "2023-09-23",
            "transactionType": "other"
          },
          {
            "transactionDescriptionType": "Food",
            "amount": 12.0,
            "expenseDate": "2023-10-01",
            "transactionType": "other"
          },
          {
            "transactionDescriptionType": "Food",
            "amount": 92.0,
            "expenseDate": "2023-10-05",
            "transactionType": "other"
          }
        ]
      },
    );

    final historicalList = (response['historicalRecord'] as List)
        .map((item) => HistoricalModel.fromJson(item))
        .toList();
    historicalList.sort(
      (a, b) => b.expenseDate.toTime().compareTo(a.expenseDate.toTime()),
    );
    return historicalList;
  }
}
