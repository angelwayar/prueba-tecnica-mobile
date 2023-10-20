import 'package:flutter/material.dart';
import 'components/sun_button/sun_button.dart';
import 'components/sun_text/sun_text.dart';

Future<T?> showDialogPopUpSuccess<T>(BuildContext context) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: Colors.deepPurple,
              size: 85,
            ),
            SunText(
              text: 'Registro exitoso',
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 16),
            SunButton(
              title: 'Nuevo registro',
              colorTitle: Theme.of(context).colorScheme.onPrimary,
              color: Theme.of(context).colorScheme.primary,
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(height: 12),
            SunButton(
              title: 'Continuar',
              colorTitle: Theme.of(context).colorScheme.onSurface,
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    },
  );
}

Future<T?> showDialogPopUpFailure<T>(BuildContext context) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 85,
              child: Icon(
                Icons.error_outline_rounded,
                color: Colors.red,
                size: 85,
              ),
            ),
            SunText(
              text: 'Error de Registro',
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 16),
            SunButton(
              title: 'Nuevo registro',
              colorTitle: Theme.of(context).colorScheme.onPrimary,
              color: Theme.of(context).colorScheme.primary,
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(height: 12),
            SunButton(
              title: 'Continuar',
              colorTitle: Theme.of(context).colorScheme.onSurface,
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    },
  );
}
