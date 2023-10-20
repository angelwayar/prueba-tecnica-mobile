import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Initial Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Modular.to.pushNamed('/home'),
          child: const Text('nivagate to Home'),
        ),
      ),
    );
  }
}
