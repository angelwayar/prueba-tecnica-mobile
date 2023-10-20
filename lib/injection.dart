import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'src/expenses/bloc/expenses_bloc.dart';
import 'src/expenses/data/datasources/expenses.datasource.dart';
import 'src/historical_income/data/datasources/historical.datasource.dart';
import 'src/historical_income/data/repositories/historical.repository.dart';
import 'src/historical_income/domain/repositories/historical.repository.dart';
import 'src/historical_income/presentation/bloc/historical_bloc.dart';

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
      getIt.registerFactory(() => ExpensesDataSource()),

      /// Injecto Histical

      getIt.registerFactory(() => HistoricalBloc(_instance!())),
      getIt.registerLazySingleton<HistoricalDataSource>(
        () => HistoricalServices(),
      ),
      getIt.registerLazySingleton<HistoricalRepository>(
        () => HistoricalRepositoryImpl(_instance!()),
      ),
    ];
  }
}
