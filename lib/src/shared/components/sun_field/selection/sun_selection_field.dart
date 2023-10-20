import 'dart:core';
import 'package:flutter/material.dart';

class SunSelectionField extends StatelessWidget {
  const SunSelectionField({
    super.key,
    required this.controller,
    required this.voidCallback,
    required this.optionMap,
    this.hintText,
  });

  final TextEditingController controller;
  final Function(String) voidCallback;
  final Map<String, String> optionMap;
  final String? hintText;

  Widget getList() {
    final optionList = [];
    optionMap.forEach((key, value) {
      optionList.add(value);
    });
    return Builder(
      builder: (context) {
        return ListView(
          children: optionList
              .map((option) => ListTile(
                    title: Text(option),
                    selected: controller.text == option,
                    selectedColor: Theme.of(context).colorScheme.onSurface,
                    leading: controller.text == option
                        ? const Icon(Icons.check)
                        : const SizedBox(),
                    onTap: () {
                      voidCallback(option);
                      Navigator.pop(context);
                    },
                  ))
              .toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextFormField(
        readOnly: true,
        controller: controller,
        style: Theme.of(context).textTheme.bodySmall,
        onTap: () async {
          showModalBottomSheet(
            context: context,
            enableDrag: true,
            isScrollControlled: true,
            useSafeArea: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Fuente de Ingreso',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  centerTitle: true,
                ),
                body: SizedBox(width: double.infinity, child: getList()),
              );
            },
          );
        },
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
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
                color: Theme.of(context).colorScheme.onTertiary, width: 2),
          ),
          focusColor: Colors.red,
        ),
      ),
    );
  }
}
