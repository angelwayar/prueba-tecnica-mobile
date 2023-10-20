import 'dart:developer';

import 'package:dio/dio.dart';
import '../models/income.model.dart';

abstract class IncomeDataSource {
  final _dio = Dio()
    ..options.baseUrl = 'uri'
    ..options.connectTimeout = const Duration(seconds: 60)
    ..options.receiveTimeout = const Duration(seconds: 60);

  Future<void> incomeRecord(IncomeModel expenseModel);
}

class IncomeServices extends IncomeDataSource {
  @override
  Future<void> incomeRecord(IncomeModel incomeModel) async {
    //* THIS IS A SUCCESS RESPONSE
    await Future.delayed(const Duration(seconds: 2), () {
      log(incomeModel.toJson().toString());
    });
  }
}
