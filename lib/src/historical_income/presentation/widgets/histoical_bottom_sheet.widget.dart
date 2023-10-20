import 'package:flutter/material.dart';

import '../../../shared/components/sun_button/sun_button.dart';

Future<dynamic> historicalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    showDragHandle: true,
    context: context,
    builder: (context) => SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text('Ver historial'),
            ),
            const SizedBox(height: 12),
            const Text(
                'Selecciona el mes o rango de fechas para \nvisualizar tus movimientos.'),
            ListTile(
              title: const Text('Mes Actual'),
              contentPadding: const EdgeInsets.all(0),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Mes Anterior'),
              contentPadding: const EdgeInsets.all(0),
              onTap: () {},
            ),
            const Text('Rango de fecha'),
            SunButton(
              title: 'Continuar',
              colorTitle: Theme.of(context).colorScheme.onPrimary,
              color: Theme.of(context).colorScheme.primary,
              onPressed: () {},
            )
          ],
        ),
      ),
    ),
  );
}
