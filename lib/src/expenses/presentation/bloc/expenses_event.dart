part of 'expenses_bloc.dart';

sealed class ExpensesEvent {
  const ExpensesEvent();
}

class ExpensesCreated extends ExpensesEvent {
  final ExpenseModel expensesForm;

  const ExpensesCreated({
    required this.expensesForm,
  });
}
