import 'package:dog_license_application/generated/l10n.dart';

String? requiredFieldValidator(String? username, context) {
  if (username == "" || username == null) return S.of(context).field_validation__required;
  return null;
}
