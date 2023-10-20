import 'package:mobile/src/expenses/data/models/expense.model.dart';
import 'package:mobile/src/expenses/domain/entities/expense.entity.dart';
import '../datasources/expenses.datasource.dart';
import '../../domain/repositories/expense.repository.dart';

class ExpenseRepositoryImpl implements ExpensesRepository {
  final ExpensesDataSource _service;

  ExpenseRepositoryImpl(this._service);

  @override
  Future<void> createExpense(Expense exponse) async {
    await _service.createExpense(exponse as ExpenseModel);
  }
}
