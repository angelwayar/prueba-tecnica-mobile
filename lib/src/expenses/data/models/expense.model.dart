class ExpenseModel extends Expense {
  ExpenseModel({
    required super.description,
    required super.amount,
    required super.expenseType,
    required super.expenseDate,
    required super.userId,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['description'] = description;
    data['amount'] = amount;
    data['expenseType'] = expenseType;
    data['expenseDate'] = expenseDate.split('/').reversed.join('-');
    data['userId'] = userId;
    return data;
  }
}

class Expense {
  final String description;
  final double amount;
  final String expenseType;
  final String expenseDate;
  final int userId;

  Expense({
    required this.description,
    required this.amount,
    required this.expenseType,
    required this.expenseDate,
    required this.userId,
  });
}
