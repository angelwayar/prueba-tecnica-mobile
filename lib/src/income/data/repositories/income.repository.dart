import 'package:mobile/src/income/data/models/income.model.dart';
import 'package:mobile/src/income/domain/entities/Income.entity.dart';
import '../../domain/repositories/income.repository.dart';
import '../datasources/income.datasource.dart';

class IncomeRepositoryImpl implements IncomeRepository {
  final IncomeDataSource _service;

  IncomeRepositoryImpl(this._service);

  @override
  Future<void> incomeRecord(Income income) async {
    await _service.incomeRecord(income as IncomeModel);
  }
}
