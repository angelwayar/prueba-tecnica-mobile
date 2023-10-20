import 'package:flutter/material.dart';

class SunTextField extends StatelessWidget {
  const SunTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.validator,
    this.hintText,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: Theme.of(context).textTheme.bodySmall,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onSurface,
        )),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onTertiary, width: 2),
        ),
        focusColor: Colors.red,
      ),
    );
  }
}
