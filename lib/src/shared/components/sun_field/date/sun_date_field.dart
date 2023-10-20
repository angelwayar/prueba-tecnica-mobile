import 'dart:core';
import 'package:flutter/material.dart';
import 'package:mobile/src/shared/extensions/extensions_aux.dart';

class SunDateField extends StatelessWidget {
  const SunDateField({
    super.key,
    required this.controller,
    required this.voidCallback,
  });

  final TextEditingController controller;
  final Function(String) voidCallback;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return SizedBox(
      height: 32,
      child: TextFormField(
        readOnly: true,
        controller: controller,
        style: Theme.of(context).textTheme.bodySmall,
        onTap: () async {
          DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: !controller.text.contains('/')
                  ? date
                  : controller.text.textToTime(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100));
          if (newDate == null) return;
          voidCallback(newDate.dateToText());
        },
        decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            suffixIcon: const Icon(
              Icons.calendar_month,
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface,
            )),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onTertiary, width: 2)),
            focusColor: Colors.red),
      ),
    );
  }
}
