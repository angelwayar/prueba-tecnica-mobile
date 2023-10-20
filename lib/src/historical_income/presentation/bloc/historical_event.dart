part of 'historical_bloc.dart';

sealed class HistoricalEvent {}

class GetHistoryFetched extends HistoricalEvent {
  GetHistoryFetched({this.userId, this.query});

  final int? userId;
  final Map<String, String>? query;
}
