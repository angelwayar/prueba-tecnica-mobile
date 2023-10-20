import 'package:flutter/material.dart';
import 'package:mobile/commons/extensions.dart';
import '../../domain/entities/historical.entity.dart';

class DateHistoryItem extends StatelessWidget {
  DateHistoryItem({
    super.key,
    required this.historicalList
  });

  final _descriptionType = {
    'Services': 'Servicios',
    'Food': 'Comida',
    'Shopping': 'Compras',
    'Education': 'Educación',
    'Health': 'Salud',
    'VariousExpenses': 'Gastos varios',
    'Salary': 'Salario',
    'Investments': 'Inversiones',
    'Gifts': 'Regalos',
  };

  final List<HistoricalEntity> historicalList;

  getSymbol( String type ) {
    return type == 'Income' ? '+' : '-';
  }

  getDescription( String type ) {
    return _descriptionType[type];
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return ListView.builder(
      itemCount: historicalList.length,
      itemBuilder: (BuildContext context, int index) {
        final item = historicalList[index];
        final date = item.expenseDate.toTime();
        if (index == 0 || item.expenseDate != historicalList[index - 1].expenseDate) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date.getLabel(),
                style: textStyle.bodyLarge!,
              ),
              ListTile(
                title: Text(
                  getDescription(item.transactionDescriptionType),
                  style: textStyle.bodySmall!,
                ),
                subtitle: Text(
                  '10:00',
                  style: textStyle.labelSmall!,
                ),
                trailing: Text(
                  '${getSymbol(item.transactionType)} Bs${item.amount}',
                  style: textStyle.bodyMedium!,
                ),
                contentPadding: const EdgeInsets.all(0),
              ),
            ],
          );
        } else {
          return ListTile(
            title: Text(
              getDescription(item.transactionDescriptionType),
              style: textStyle.bodySmall!,
            ),
            subtitle: Text(
              '10:10',
              style: textStyle.labelSmall!,
            ),
            trailing: Text(
              '${getSymbol(item.transactionType)} Bs${item.amount}',
              style: textStyle.bodyMedium!,
            ),
            contentPadding: const EdgeInsets.all(0),
          );
        }
      }
    );
  }
}
