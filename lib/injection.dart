import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'src/expenses/data/repositories/expenses.repository.dart';
import 'src/expenses/domain/repositories/expense.repository.dart';
import 'src/expenses/presentation/bloc/expenses_bloc.dart';
import 'src/expenses/data/datasources/expenses.datasource.dart';
import 'src/historical_income/presentation/bloc/historical_bloc.dart';
import 'src/historical_income/data/datasources/historical.datasource.dart';
import 'src/historical_income/data/repositories/historical.repository.dart';
import 'src/historical_income/domain/repositories/historical.repository.dart';
import 'src/income/presentation/bloc/income_bloc.dart';
import 'src/income/data/datasources/income.datasource.dart';
import 'src/income/data/repositories/income.repository.dart';
import 'src/income/domain/repositories/income.repository.dart';

class Injector {
  static GetIt? _instance;
  static GetIt get getIt =>
      _instance == null ? _instance = GetIt.I : _instance!;
  static getItBloc<T extends Bloc>() => _instance!<T>();

  initInjector() {
    Injector.getIt;
    return [
      /// Injector expense

      getIt.registerFactory(() => ExpensesBloc(_instance!())),
      getIt.registerLazySingleton<ExpensesDataSource>(
        () => ExpensesServices(),
      ),
      getIt.registerLazySingleton<ExpensesRepository>(
        () => ExpenseRepositoryImpl(_instance!()),
      ),

      /// Injector Historical

      getIt.registerFactory(() => HistoricalBloc(_instance!())),
      getIt.registerLazySingleton<HistoricalDataSource>(
        () => HistoricalServices(),
      ),
      getIt.registerLazySingleton<HistoricalRepository>(
        () => HistoricalRepositoryImpl(_instance!()),
      ),

      /// Injector Income
      getIt.registerFactory(() => IncomeBloc(_instance!())),
      getIt.registerLazySingleton<IncomeDataSource>(
        () => IncomeServices(),
      ),
      getIt.registerLazySingleton<IncomeRepository>(
        () => IncomeRepositoryImpl(_instance!()),
      ),
    ];
  }
}
