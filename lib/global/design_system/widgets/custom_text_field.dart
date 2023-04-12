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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        validator: (value) {
          return value!.isEmpty ? validatorMessage : null;
        },
        keyboardType: textInputType,
        onSaved: onSaved,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xff01aed6)),
          ),
          hintText: title,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
