part of 'income_bloc.dart';

sealed class IncomeEvent {
  const IncomeEvent();
}

class IncomeRecord extends IncomeEvent {
  final IncomeModel incomeForm;

  const IncomeRecord({required this.incomeForm});
}
