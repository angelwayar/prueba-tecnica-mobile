import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/components/sun_button/sun_button.dart';
import '../../../shared/components/sun_text/sun_text.dart';

class SplahsPage extends StatelessWidget {
  const SplahsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 44),
            SunText(
              text: 'Bienvenido, Pepito!',
              style: Theme.of(context).textTheme.titleLarge!,
            ),
            const SizedBox(height: 44),
            Icon(
              Icons.store,
              color: Theme.of(context).colorScheme.onTertiary,
              size: 85,
            ),
            const SizedBox(height: 44),
            SunText(
              text: 'Registrar tus ingresos y gastos nunca fue tan facil',
              style: Theme.of(context).textTheme.labelLarge!,
            ),
            const SizedBox(height: 44),
            Icon(
              Icons.insert_chart_outlined_outlined,
              color: Theme.of(context).colorScheme.primary,
              size: 85,
            ),
            const SizedBox(height: 44),
            SunText(
              text:
                  'Ahora podras tener el control de tus finanzas en linea desde la comodidad de tu celular',
              style: Theme.of(context).textTheme.labelLarge!,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            SunButton(
              title: 'Comenzar',
              colorTitle: Theme.of(context).colorScheme.onPrimary,
              color: Theme.of(context).colorScheme.primary,
              onPressed: () => Modular.to.navigate('/home'),
            ),
          ],
        ),
      ),
    );
  }
}
