import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'themes/sun_theme_components.dart';

final ThemeData themeSun = SunThemeComponents.copyWith();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Track finance',
      theme: themeSun,
      routerConfig: Modular.routerConfig,
    );
  }
}
