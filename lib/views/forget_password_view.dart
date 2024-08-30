import 'package:dog_license_application/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:dog_license_application/generated/l10n.dart';
import 'package:dog_license_application/models/request/forget_password_request_model.dart';
import 'package:dog_license_application/themes/pinput_theme.dart';
import 'package:dog_license_application/validators/pinput_field_validator.dart';
import 'package:dog_license_application/validators/required_field_validator.dart';
import 'package:dog_license_application/widgets/password_field_component.dart';
import 'package:dog_license_application/widgets/primary_button_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pinput/pinput.dart';

class ForgetPasswordView extends StatefulWidget {
  static const String id = "/ForgetPasswordView";

  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final GlobalKey<FormState> passwordDataKey = GlobalKey();
  var forgetPasswordRequestModel = ForgetPasswordRequestModel();

  @override
  Widget build(BuildContext context) {
    forgetPasswordRequestModel.email = Get.arguments as String;
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        var bloc = BlocProvider.of<AuthenticationCubit>(context);
        return ModalProgressHUD(
          inAsyncCall: bloc.isLoading,
          child: Scaffold(
            appBar: AppBar(title: const Text("Forget Password")),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Form(
                      key: passwordDataKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          const Text("Check your email", style: TextStyle(fontSize: 20)),
                          const SizedBox(height: 10),
                          const Text("We have sent a 4-digit OTP to your email",
                              style: TextStyle(fontSize: 14, color: Color(0xff989898))),
                          const SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Pinput(
                                length: 4,
                                onCompleted: (pin) => forgetPasswordRequestModel.otp = pin,
                                defaultPinTheme: kDefaultPinTheme,
                                focusedPinTheme: kFocusedPinTheme,
                                submittedPinTheme: kSubmittedPinTheme,
                                validator: (str) => pinputFieldValidator(str, 4),
                              ),
                            ],
                          ),
                          const SizedBox(height: 35),
                          PasswordFieldComponent(
                            hintText: S.of(context).change_password_view__new_password,
                            validator: (str) => requiredFieldValidator(str, context),
                            onChanged: (password) => forgetPasswordRequestModel.newPassword = password,
                          ),
                          const SizedBox(height: 10),
                          PasswordFieldComponent(
                            hintText: S.of(context).change_password_view__confirm_password,
                            validator: (str) => requiredFieldValidator(str, context),
                            onChanged: (password) =>
                                forgetPasswordRequestModel.confirmPassword = password,
                          ),
                          const SizedBox(height: 15),
                          PrimaryButtonComponent(
                            text: S.of(context).change_password_view__submit,
                            onTap: () {
                              if (passwordDataKey.currentState!.validate()) {
                                bloc.resetPassword(forgetPasswordRequestModel);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
