import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/shared/loading.dart';
import 'package:mobile/src/shared/app_bar_minimal.widget.dart';
import '../../data/models/models.dart';
import '../bloc/expenses_bloc.dart';
import '../../../../injection.dart';
import '../../../shared/dialog.dart';
import '../../../../commons/info.dart';
import '../../../shared/components/sun_text/sun_text.dart';
import '../../../shared/components/sun_button/sun_button.dart';
import '../../../shared/components/sun_field/date/sun_date_field.dart';
import '../../../shared/components/sun_field/text/sun_text_field.dart';
import '../../../shared/components/sun_field/selection/sun_selection_field.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerDate = TextEditingController();
  final TextEditingController _controllerAmount = TextEditingController();
  final TextEditingController _controllerDestination = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  Map<String, String> optionMap = {
    'Services': 'Servicios',
    'Food': 'Comida',
    'Shopping': 'Compras',
    'Education': 'Educación',
    'Health': 'Salud',
    'VariousExpenses': 'Gastos varios',
  };

  @override
  void initState() {
    super.initState();
    _controllerDate.text = 'Seleccionar Fecha';
  }

  updateDateField(String newValue) {
    _controllerDate.text = newValue;
  }

  updateSelectionField(dynamic newValue) {
    _controllerDestination.text = newValue;
  }

  String getKey(String value) {
    return optionMap.keys.lastWhere(
      (element) => optionMap[element] == value,
      orElse: () => 'VariousExpenses',
    );
  }

  @override
  void dispose() {
    _controllerDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loading = LoadingWidget(context);

    return Scaffold(
      appBar: AppBarMinimal(
        textTitle: 'Registro de Gastos',
        onLeftIconTap: () => Navigator.pop(context),
      ),
      body: BlocProvider<ExpensesBloc>(
        create: (context) => Injector.getItBloc<ExpensesBloc>(),
        child: BlocListener<ExpensesBloc, ExpensesState>(
          listener: (context, state) {
            switch (state.status) {
              case ExpensesStatus.success:
                loading.hideOverlay();
                showDialogPopUpSuccess(context);
              case ExpensesStatus.failure:
                loading.hideOverlay();
                showDialogPopUpFailure(context);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SunText(
                    text:
                        'Ingresa la informacion que desea registrar \n*Campos requeridos',
                    style: Theme.of(context).textTheme.labelMedium!,
                  ),
                  const SizedBox(height: 24),
                  SunText(
                      text: 'Descripcion de Gasto*',
                      style: Theme.of(context).textTheme.labelMedium!),
                  SunTextField(
                    controller: _controllerDescription,
                    validator: (value) {
                      if (value == '' || value!.isEmpty) return '*';
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  SunText(
                      text: 'Destino',
                      style: Theme.of(context).textTheme.labelMedium!),
                  const SizedBox(height: 22),
                  SunSelectionField(
                    optionMap: optionMap,
                    controller: _controllerDestination,
                    voidCallback: updateSelectionField,
                    hintText: 'Seleccionar una Fuente de Gastos',
                  ),
                  const SizedBox(height: 24),
                  SunText(
                      text: 'Monto',
                      style: Theme.of(context).textTheme.labelMedium!),
                  SunTextField(
                    controller: _controllerAmount,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  SunText(
                      text: 'Fecha',
                      style: Theme.of(context).textTheme.labelMedium!),
                  SunDateField(
                    controller: _controllerDate,
                    voidCallback: updateDateField,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Builder(
                    builder: (context) {
                      return SunButton(
                        title: 'Comenzar',
                        colorTitle: Theme.of(context).colorScheme.onPrimary,
                        color: Theme.of(context).colorScheme.primary,
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) return;
                          loading.showOverlay();
                          final expensesForm = ExpenseModel(
                            description: _controllerDescription.text,
                            amount: double.parse(
                              _controllerAmount.text.isEmpty
                                  ? '0'
                                  : _controllerAmount.text,
                            ),
                            expenseType: getKey(_controllerDestination.text),
                            expenseDate: _controllerDate.text,
                            userId: Info.userId,
                          );
                          context.read<ExpensesBloc>().add(
                                ExpensesCreated(expensesForm: expensesForm),
                              );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
