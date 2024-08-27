import 'package:dog_license_application/constants/theme_constants.dart';
import 'package:dog_license_application/generated/l10n.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DropdownMenuComponent extends StatelessWidget {
  final String? value;
  final double? height;
  final List<String> dropDownItems;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final IconData prefixIcon;

  const DropdownMenuComponent({
    super.key,
    this.height = 16,
    required this.value,
    required this.onChanged,
    required this.dropDownItems,
    required this.validator,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      hint: Transform.translate(
        offset: const Offset(-100, 0),
        child: Text(S.of(context).register_view__gender),
      ),
      value: value,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: FaIcon(prefixIcon, size: 22, color: Color(0xff4a444d)),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 28,
          maxWidth: 28,
          minHeight: 23,
          maxHeight: 23,
        ),
        fillColor: kPrimaryColor.withOpacity(0.05),
        contentPadding: EdgeInsets.symmetric(vertical: height!),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 1.2),
        ),
      ),
      validator: validator,
      items: dropDownItems.map(mapOptionToMenuItem).toList(),
      onChanged: onChanged,
      iconStyleData: const IconStyleData(
        icon: Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(
            Icons.arrow_drop_down,
            size: 24,
          ),
        ),
      ),
      dropdownStyleData: const DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        elevation: 2,
      ),
      style: const TextStyle(
        color: Color(0xff4a444d),
        fontSize: 18,
      )
    );
  }
}

DropdownMenuItem<String> mapOptionToMenuItem(option) {
  return DropdownMenuItem<String>(
    value: option,
    child: Column(
      children: [
        Text(option),
      ],
    ),
  );
}
