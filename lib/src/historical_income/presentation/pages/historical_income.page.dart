import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection.dart';
import '../../../shared/components/sun_text/sun_text.dart';
import '../bloc/historical_bloc.dart';
import '../widgets/date_history_item.widget.dart';
import '../../../shared/app_bar_minimal.widget.dart';
import '../widgets/histoical_bottom_sheet.widget.dart';

class HistoricalIncomePage extends StatelessWidget {
  const HistoricalIncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMinimal(
        textTitle: 'Historico',
        rightIcon: Icons.menu,
        onLeftIconTap: () => Navigator.pop(context),
        onRightIconTap: () => historicalBottomSheet(context),
      ),
      body: BlocProvider<HistoricalBloc>(
        create: (context) => Injector.getItBloc<HistoricalBloc>(),
        child: BlocBuilder<HistoricalBloc, HistoricalState>(
          builder: (context, state) {
            switch (state.status) {
              case HistoricalStatus.initial:
                return const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
              case HistoricalStatus.success:
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SunText(
                        text:
                            'Selecciona un periodo de tiempo para \nvisualizar tus movimientos',
                        style: Theme.of(context).textTheme.labelLarge!,
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: DateHistoryItem(
                          historicalList: state.historicalList,
                        ),
                      ),
                    ],
                  ),
                );
              case HistoricalStatus.failure:
                return const Center(
                  child: Text('Failure'),
                );
            }
          },
        ),
      ),
    );
  }
}
