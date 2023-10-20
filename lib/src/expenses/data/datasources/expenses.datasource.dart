import 'package:dio/dio.dart';
import '../models/expense.model.dart';

abstract class ExpensesDataSource {
  final _dio = Dio()
    ..options.baseUrl = 'uri'
    ..options.connectTimeout = const Duration(seconds: 60)
    ..options.receiveTimeout = const Duration(seconds: 60);

  Future<void> createExpense(ExpenseModel expenseModel);
}

class ExpensesServices extends ExpensesDataSource {
  @override
  Future<void> createExpense(ExpenseModel expenseModel) async {
    //* THIS IS A SUCCESS RESPONSE
    await Future.delayed(
      const Duration(seconds: 2),
    );
  }
}
