import 'package:flutter/material.dart';

class CustomDropdownFormField<T> extends StatefulWidget {
  final String? label;
  final String? value;
  final String? errorText;
  final TextInputType? keyboardType;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final List<String>? items;

  const CustomDropdownFormField({
    super.key,
    this.label,
    this.errorText,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.items,
    this.value,
  });

  @override
  State<CustomDropdownFormField> createState() =>
      _CustomDropdownFormFieldState();
}

class _CustomDropdownFormFieldState extends State<CustomDropdownFormField> {
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
          left: Radius.elliptical(15, 15), right: Radius.elliptical(15, 15)),
    );

    return DropdownButtonFormField(
      //value: widget.value,
      items: (widget.items != null)
          ? widget.items!.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList()
          : null,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        label: widget.label != null ? Text(widget.label!) : null,
        border: border,
        isDense: true,
        // prefixIcon: Icons(Icons.add)
        errorText: widget.errorText,
        errorBorder:
            border.copyWith(borderSide: const BorderSide(color: Colors.red)),
      ),
    );
  }
}
