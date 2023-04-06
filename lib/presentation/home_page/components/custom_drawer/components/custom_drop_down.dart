import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.value,
    required this.trueText,
    required this.falseText,
    required this.onChanged,
  });

  final bool value;
  final String trueText;
  final String falseText;
  final Function(bool) onChanged;
  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  late bool defaultValue = widget.value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        style: Theme.of(context).textTheme.labelLarge,
        value: defaultValue,
        items: [
          DropdownMenuItem(
            value: true,
            child: Text(
              widget.trueText,
              style: TextStyle(
                color: Theme.of(context).highlightColor,
              ),
            ),
          ),
          DropdownMenuItem(
            value: false,
            child: Text(
              widget.falseText,
              style: TextStyle(
                color: Theme.of(context).highlightColor,
              ),
            ),
          ),
        ],
        onChanged: (bool? value) {
          if (value != null) {
            setState(() {
              defaultValue = value;
            });
            widget.onChanged(value);
          }
        },
      ),
    );
  }
}
