import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final Color? borderColor;
  final ValueChanged<String>? onchanged;
  final TextInputType? type;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.borderColor,
    this.onchanged,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onchanged,
      keyboardType: type,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: icon != null ? Icon(icon) : null,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor ?? Colors.grey[200]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor ?? Colors.grey[200]!),
        ),
      ),
    );
  }
}
