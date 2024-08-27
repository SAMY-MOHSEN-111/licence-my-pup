import 'package:dog_license_application/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

String? dropdownFieldValidator(String? selection, BuildContext context, String initial) {
  if (selection == null || selection.isEmpty || selection.endsWith(initial)) {
    return S.of(context).field_validation__required;
  }
  return null;
}