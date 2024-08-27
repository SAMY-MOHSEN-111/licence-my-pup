import 'package:dog_license_application/constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordFieldComponent extends StatefulWidget {
  final String hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const PasswordFieldComponent({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.validator,
  });

  @override
  State<PasswordFieldComponent> createState() => _PasswordFieldComponentState();
}

class _PasswordFieldComponentState extends State<PasswordFieldComponent> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: isObscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: kPrimaryColor.withOpacity(0.05),
        hintText: widget.hintText,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 45,
          maxWidth: 45,
          minHeight: 25,
          maxHeight: 25,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: FaIcon(FontAwesomeIcons.lock, size: 21),
        ),
        suffixIcon: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: FaIcon(
            isObscure
                ? FontAwesomeIcons.solidEye
                : FontAwesomeIcons.solidEyeSlash,
            size: 18,
          ),
          onPressed: () {
            setState(() => isObscure = !isObscure);
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 1.2),
        ),
      ),
    );
  }
}
