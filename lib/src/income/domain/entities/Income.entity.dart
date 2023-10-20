class Income {
  const Income({
    required this.description,
    required this.amount,
    required this.incomeType,
    required this.incomeDate,
    required this.userId,
  });

  final String description;
  final double amount;
  final String incomeType;
  final String incomeDate;
  final int userId;
}
