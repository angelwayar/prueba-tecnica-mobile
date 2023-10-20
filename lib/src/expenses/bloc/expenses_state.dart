part of 'expenses_bloc.dart';

enum ExpensesStatus { success, failure }

class ExpensesState {
  final ExpensesStatus status;

  ExpensesState({
    this.status = ExpensesStatus.success,
  });

  ExpensesState copyWith({ExpensesStatus? status}) {
    return ExpensesState(
      status: status ?? this.status,
    );
  }
}
