import 'package:dog_license_application/constants/localization_constants.dart';
import 'package:intl/intl.dart';

bool isEnglish() {
  return Intl.getCurrentLocale() == kENLocale;
}
