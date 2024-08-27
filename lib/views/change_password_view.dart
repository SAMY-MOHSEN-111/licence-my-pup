import 'package:dog_license_application/cubits/profile_cubit/profile_cubit.dart';
import 'package:dog_license_application/generated/l10n.dart';
import 'package:dog_license_application/models/request/change_password_request_model.dart';
import 'package:dog_license_application/validators/required_field_validator.dart';
import 'package:dog_license_application/widgets/drawer_component.dart';
import 'package:dog_license_application/widgets/password_field_component.dart';
import 'package:dog_license_application/widgets/primary_button_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChangePasswordView extends StatefulWidget {
  static const String id = "/ChangePasswordView";

  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final GlobalKey<FormState> passwordDataKey = GlobalKey();
  ChangePasswordRequestModel changePasswordRequestModel = ChangePasswordRequestModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var bloc = BlocProvider.of<ProfileCubit>(context);
        return ModalProgressHUD(
          inAsyncCall: bloc.isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).change_password_view__title),
            ),
            drawer: const DrawerComponent(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Form(
                      key: passwordDataKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 35),
                          PasswordFieldComponent(
                            hintText: S.of(context).change_password_view__old_password,
                            validator: (str) => requiredFieldValidator(str, context),
                            onChanged: (password) =>
                                changePasswordRequestModel.currentPassword = password,
                          ),
                          const SizedBox(height: 10),
                          PasswordFieldComponent(
                            hintText: S.of(context).change_password_view__new_password,
                            validator: (str) => requiredFieldValidator(str, context),
                            onChanged: (password) =>
                                changePasswordRequestModel.newPassword = password,
                          ),
                          const SizedBox(height: 10),
                          PasswordFieldComponent(
                            hintText: S.of(context).change_password_view__confirm_password,
                            validator: (str) => requiredFieldValidator(str, context),
                            onChanged: (password) =>
                                changePasswordRequestModel.confirmPassword = password,
                          ),
                          const SizedBox(height: 15),
                          PrimaryButtonComponent(
                            text: S.of(context).change_password_view__submit,
                            onTap: () {
                              if (passwordDataKey.currentState!.validate()) {
                                bloc.changePassword(changePasswordRequestModel);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
