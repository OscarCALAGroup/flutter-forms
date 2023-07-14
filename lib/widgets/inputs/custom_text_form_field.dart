import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? errorText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.validator,
    this.label,
    this.errorText,
    this.keyboardType, this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
          left: Radius.elliptical(15, 15), right: Radius.elliptical(15, 15)),
    );

    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        label: label != null ? Text(label!) : null,
        border: border,
        isDense: true,
        // prefixIcon: Icons(Icons.add)
        errorText: errorText,
        errorBorder:
            border.copyWith(borderSide: const BorderSide(color: Colors.red)),
      ),
    );
  }
}
