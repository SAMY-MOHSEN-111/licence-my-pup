import 'package:dog_license_application/generated/l10n.dart';
import 'package:dog_license_application/widgets/primary_button_component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ForgetPasswordDialog extends StatelessWidget {
  const ForgetPasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Dialog(
          child: SizedBox(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      S.of(context).forgot_password_dialog__title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const FaIcon(FontAwesomeIcons.squareWhatsapp, size: 64, color: Colors.green),
                    const Text(
                      "01156261362",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    PrimaryButtonComponent(
                      // height: 45,
                      // width: 140,
                      text: S.of(context).forgot_password_dialog__button,
                      onTap: () => Get.back(),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
