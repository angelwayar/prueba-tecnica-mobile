part of 'historical_bloc.dart';

enum HistoricalStatus { initial, success, failure }

final class HistoricalState {
  final HistoricalStatus status;
  final List<HistoricalEntity> historicalList;
  final bool hasReachedMax;

  const HistoricalState({
    this.status = HistoricalStatus.initial,
    this.historicalList = const [],
    this.hasReachedMax = false,
  });

  HistoricalState copyWith({
    HistoricalStatus? status,
    List<HistoricalEntity>? historicalList,
    bool? hasReachedMax,
  }) {
    return HistoricalState(
      status: status ?? this.status,
      historicalList: historicalList ?? this.historicalList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
