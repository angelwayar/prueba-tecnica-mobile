import 'package:flutter_modular/flutter_modular.dart';
import 'src/home/presentation/pages/home.page.dart';
import 'src/income/presentation/pages/incomes.page.dart';
import 'src/splash/presentation/pages/splash.page.dart';
import 'src/expenses/presentation/pages/expenses.page.dart';
import 'src/historical_income/presentation/pages/historical_income.page.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const SplahsPage());
    r.child('/home', child: (_) => const HomePage());
    r.child('/historical-income', child: (_) => const HistoricalIncomePage());
    r.child('/expenses', child: (_) => const ExpensesPage());
    r.child('/income', child: (_) => const IncomesPage());
  }
}
