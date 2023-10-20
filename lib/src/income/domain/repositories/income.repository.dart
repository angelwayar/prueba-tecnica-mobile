import '../entities/Income.entity.dart';

abstract class IncomeRepository {
  Future<void> incomeRecord(Income exponse);
}
