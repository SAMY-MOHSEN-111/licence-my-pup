import 'package:dog_license_application/helpers/snack_bar_helper.dart';

String? pinputFieldValidator(String? selection, int pinputLength) {
  if (selection == null || selection.isEmpty || selection.length < pinputLength) {
    showSnackBar("Please fill in the pinput");
    return "";
  }
  return null;
}