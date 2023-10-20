import '../entities/expense.entity.dart';

abstract class ExpensesRepository {
  Future<void> createExpense(Expense exponse);
}
