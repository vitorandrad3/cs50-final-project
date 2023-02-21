import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.title,
      required this.onSaved,
      required this.validatorMessage,
      this.textInputType = TextInputType.name});

  final String validatorMessage;
  final String title;
  final void Function(String? value) onSaved;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width * 0.88,
      child: TextFormField(
        validator: (value) {
          return value!.isEmpty ? validatorMessage : null;
        },
        keyboardType: textInputType,
        onSaved: onSaved,
        decoration: InputDecoration(
          hintText: title,
          fillColor: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
