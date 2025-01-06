import 'package:flutter/material.dart';

class CustomDropDownField extends StatelessWidget {
  final List<String> items;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? value;
  final bool filled;
  final Color? fillColor;
  final void Function(String?)? onChanged;

  const CustomDropDownField({
    super.key,
    required this.items,
    this.hintText,
    this.validator,
    this.value,
    this.filled = true,
    this.fillColor,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dropdown Field
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: filled,
            fillColor: fillColor ?? Colors.grey[200],
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
          value: value,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
