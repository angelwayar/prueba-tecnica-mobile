import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:mobile/src/income/domain/repositories/income.repository.dart';
import '../../data/models/income.model.dart';

part 'income_event.dart';
part 'income_state.dart';

class IncomeBloc extends Bloc<IncomeEvent, IncomeState> {
  final IncomeRepository _repository;

  IncomeBloc(this._repository) : super(IncomeState()) {
    on<IncomeRecord>(_onIncomeRecord);
  }

  Future<void> _onIncomeRecord(
    IncomeRecord event,
    Emitter emit,
  ) async {
    try {
      await _repository.incomeRecord(event.incomeForm);
      emit(state.copyWith(status: IncomeStatus.success));
    } on DioException catch (_) {
      emit(state.copyWith(status: IncomeStatus.failure));
    }
  }
}
