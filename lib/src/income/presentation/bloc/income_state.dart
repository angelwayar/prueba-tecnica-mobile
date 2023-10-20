part of 'income_bloc.dart';

enum IncomeStatus { success, failure }

class IncomeState {
  final IncomeStatus status;

  IncomeState({this.status = IncomeStatus.success});

  IncomeState copyWith({IncomeStatus? status}) {
    return IncomeState(
      status: status ?? this.status,
    );
  }
}
