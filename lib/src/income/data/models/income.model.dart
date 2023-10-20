import '../../domain/entities/Income.entity.dart';

class IncomeModel extends Income {
  const IncomeModel({
    required super.description,
    required super.amount,
    required super.incomeType,
    required super.incomeDate,
    required super.userId,
  });

  factory IncomeModel.fromJson(Map<String, dynamic> json) => IncomeModel(
        description: json["description"],
        amount: json["amount"].toDouble(),
        incomeType: json["incomeType"],
        incomeDate: json["incomeDate"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "amount": amount,
        "incomeType": incomeType,
        "incomeDate": incomeDate,
        "userId": userId,
      };
}
