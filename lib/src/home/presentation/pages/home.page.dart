import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/components/sun_button/sun_button.dart';
import '../../../shared/components/sun_text/sun_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SunText(
                text: 'Bienvenido, Pepito!',
                style: Theme.of(context).textTheme.titleLarge!,
              ),
              const SizedBox(height: 36),
              Icon(
                Icons.store,
                color: Theme.of(context).colorScheme.onTertiary,
                size: 85,
              ),
              const SizedBox(height: 44),
              SunText(
                text: 'Selecciona el registro que deseas realizar',
                style: Theme.of(context).textTheme.labelLarge!,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36),
              SunButton(
                title: 'Registro de Ingresos',
                colorTitle: Theme.of(context).colorScheme.onSecondary,
                color: Theme.of(context).colorScheme.secondary,
                height: 75,
                radius: 20,
                onPressed: () => Modular.to.pushNamed('/income'),
              ),
              const SizedBox(height: 16),
              SunButton(
                title: 'Registro de Gastos',
                colorTitle: Theme.of(context).colorScheme.onSecondary,
                color: Theme.of(context).colorScheme.secondary,
                height: 75,
                radius: 20,
                onPressed: () => Modular.to.pushNamed('/expenses'),
              ),
              const SizedBox(height: 16),
              SunButton(
                title: 'Balance',
                colorTitle: Theme.of(context).colorScheme.onSecondary,
                color: Theme.of(context).colorScheme.secondary,
                height: 75,
                radius: 20,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              SunButton(
                title: 'Historico de registros',
                colorTitle: Theme.of(context).colorScheme.onSecondary,
                color: Theme.of(context).colorScheme.secondary,
                height: 75,
                radius: 20,
                onPressed: () => Modular.to.pushNamed('/historical-income'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
