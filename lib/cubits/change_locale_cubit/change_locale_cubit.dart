import 'package:bloc/bloc.dart';
import 'package:dog_license_application/constants/localization_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

part 'change_locale_state.dart';

class ChangeLocaleCubit extends Cubit<ChangeLocaleState> {
  String? locale;

  ChangeLocaleCubit(String this.locale) : super(ChangeLocaleInitial());

  void changeLocale(BuildContext context) {
    final storage = GetStorage();
    if (locale == kENLocale) {
      Get.updateLocale(const Locale('de', 'DE'));
      locale = kDELocale;
    } else {
      Get.updateLocale(const Locale('en', 'US'));
      locale = kENLocale;
    }
    storage.write('locale', locale);
    emit(ChangeLocaleSuccess());
  }
}
