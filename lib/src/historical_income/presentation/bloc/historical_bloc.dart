import 'package:bloc/bloc.dart';
import '../../domain/entities/historical.entity.dart';
import '../../domain/repositories/historical.repository.dart';

part 'historical_event.dart';
part 'historical_state.dart';

class HistoricalBloc extends Bloc<HistoricalEvent, HistoricalState> {
  HistoricalBloc(this._historicalRepository) : super(const HistoricalState()) {
    on<GetHistoryFetched>(_onGetHistoryFetched);
  }

  final HistoricalRepository _historicalRepository;

  Future<void> _onGetHistoryFetched(
    GetHistoryFetched event,
    Emitter<HistoricalState> emit,
  ) async {
    try {
      final historicalList = await _historicalRepository.getHistorical(
        userId: event.userId,
      );
      emit(
        state.copyWith(
          status: HistoricalStatus.success,
          historicalList: historicalList,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: HistoricalStatus.failure,
          historicalList: [],
        ),
      );
    }
  }
}
