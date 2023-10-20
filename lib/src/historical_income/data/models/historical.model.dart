import '../../domain/entities/historical.entity.dart';

class HistoricalModel extends HistoricalEntity {
  HistoricalModel({
    required String transactionDescriptionType,
    required double amount,
    required String transactionType,
    required String expenseDate,
  }) : super (
    transactionDescriptionType: transactionDescriptionType,
    amount: amount,
    transactionType: transactionType,
    expenseDate: expenseDate,
  );

  factory HistoricalModel.fromJson(Map<String, dynamic> json) {
    return HistoricalModel(
      transactionDescriptionType: json['transactionDescriptionType'],
      amount: json['amount'],
      transactionType: json['transactionType'],
      expenseDate: json['expenseDate'].toString().split('T')[0],
    );
  }
}