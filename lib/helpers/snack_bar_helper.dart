import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar(String message) {
  Get.closeAllSnackbars();
  Get.snackbar(
    'Attention',
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.grey[850],
    colorText: Colors.white,
    margin: const EdgeInsets.all(10),
    borderRadius: 8,
    duration: const Duration(milliseconds: 2500),
    snackStyle: SnackStyle.FLOATING,
  );
}
