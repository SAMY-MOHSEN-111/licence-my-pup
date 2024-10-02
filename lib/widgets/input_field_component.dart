import 'package:dog_license_application/constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputFieldComponent extends StatelessWidget {
  final IconData icon;
  final int? maxLines;
  final double fontSize;
  final String hintText;
  final bool isReadOnly;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const InputFieldComponent({
    this.maxLines = 1,
    super.key,
    this.onTap,
    this.controller,
    this.fontSize = 16,
    required this.icon,
    required this.hintText,
    required this.validator,
    required this.onChanged,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      style: TextStyle(fontSize: fontSize),
      controller: controller,
      readOnly: isReadOnly,
      onChanged: (str){
        str = str.trim();
        onChanged!(str);
      },
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: kPrimaryColor.withOpacity(0.05),
        hintText: hintText,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 45,
          maxWidth: 45,
          minHeight: 23,
          maxHeight: 23,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: FaIcon(icon, size: 21),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 1.2),
        ),
      ),
      onTap: onTap,
    );
  }
}
