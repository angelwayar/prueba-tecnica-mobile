class HistoricalEntity {
  HistoricalEntity({
    required this.transactionDescriptionType,
    required this.amount,
    required this.expenseDate,
    required this.transactionType,
  });

  final String transactionDescriptionType;
  final double amount;
  final String expenseDate;
  final String transactionType;
}
