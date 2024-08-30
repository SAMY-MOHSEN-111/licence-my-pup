import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

final kDefaultPinTheme = PinTheme(
  width: 56,
  height: 50,
  textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black),
    borderRadius: BorderRadius.circular(20),
  ),
);

final kFocusedPinTheme = kDefaultPinTheme.copyDecorationWith(
  border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
  borderRadius: BorderRadius.circular(8),
);

final kSubmittedPinTheme = kDefaultPinTheme.copyWith(
  decoration: kDefaultPinTheme.decoration?.copyWith(
    color: const Color.fromRGBO(234, 239, 243, 1),
  ),
);
