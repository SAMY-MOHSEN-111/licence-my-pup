import 'package:dog_license_application/constants/theme_constants.dart';
import 'package:dog_license_application/generated/l10n.dart';
import 'package:dog_license_application/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NoAccountComponent extends StatelessWidget {
  const NoAccountComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).login_view__no_account,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                child: const SignupView(),
                duration: const Duration(milliseconds: 350),
                reverseDuration: const Duration(milliseconds: 350),
                type: PageTransitionType.bottomToTop,
              ),
            );
          },
          child: Text(
            S.of(context).login_view__signup,
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
