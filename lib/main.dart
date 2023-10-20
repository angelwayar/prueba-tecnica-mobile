import 'package:mobile/app.dart';
import 'package:mobile/injection.dart' as injection;
import 'package:mobile/modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  injection.Injector().initInjector();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const App(),
    ),
  );
}
