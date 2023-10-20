import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:mobile/src/expenses/domain/repositories/expense.repository.dart';
import '../../data/models/models.dart';

part 'expenses_event.dart';
part 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final ExpensesRepository _repository;

  ExpensesBloc(this._repository) : super(ExpensesState()) {
    on<ExpensesCreated>(_onExpensesCreated);
  }

  Future<void> _onExpensesCreated(
    ExpensesCreated event,
    Emitter emit,
  ) async {
    try {
      await _repository.createExpense(event.expensesForm);
      emit(state.copyWith(status: ExpensesStatus.success));
    } on DioException catch (_) {
      emit(state.copyWith(status: ExpensesStatus.failure));
    }
  }
}
