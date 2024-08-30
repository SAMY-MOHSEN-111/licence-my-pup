import 'package:dog_license_application/constants/theme_constants.dart';
import 'package:dog_license_application/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:dog_license_application/generated/l10n.dart';
import 'package:dog_license_application/models/request/login_request_model.dart';
import 'package:dog_license_application/validators/required_field_validator.dart';
import 'package:dog_license_application/widgets/forget_password_dialog.dart';
import 'package:dog_license_application/widgets/input_field_component.dart';
import 'package:dog_license_application/widgets/no_account_component.dart';
import 'package:dog_license_application/widgets/password_field_component.dart';
import 'package:dog_license_application/widgets/primary_button_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  static String id = "/LoginView";

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var keepLoggedIn = false;
  LoginRequestModel loginRequestModel = LoginRequestModel();
  final GlobalKey<FormState> globalKey = GlobalKey();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        var bloc = BlocProvider.of<AuthenticationCubit>(context);
        return ModalProgressHUD(
          inAsyncCall: bloc.isLoading,
          child: Scaffold(
            appBar: AppBar(toolbarHeight: 0),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [kPrimaryColor, kSecondaryColor],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: Form(
                        key: globalKey,
                        autovalidateMode: autovalidateMode,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.pets, size: 140, color: Colors.white),
                            const SizedBox(height: 5),
                            Text(
                              S.of(context).app_name,
                              style: const TextStyle(
                                fontSize: 32,
                                letterSpacing: 2,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 25),
                            Container(
                              decoration: const BoxDecoration(
                                color: kScaffoldBackgroundColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18.0,
                                  horizontal: 18.0,
                                ),
                                child: Column(
                                  children: [
                                    _renderWelcomeText(context),
                                    _renderInfoText(context),
                                    const SizedBox(height: 30),
                                    InputFieldComponent(
                                      icon: FontAwesomeIcons.solidEnvelope,
                                      hintText: S.of(context).login_view__email,
                                      validator: (str) => requiredFieldValidator(str, context),
                                      onChanged: (str) => loginRequestModel.email = str,
                                    ),
                                    const SizedBox(height: 10),
                                    PasswordFieldComponent(
                                      hintText: S.of(context).login_view__password,
                                      onChanged: (str) => loginRequestModel.password = str,
                                      validator: (str) => requiredFieldValidator(str, context),
                                    ),
                                    _renderRememberMe(context),
                                    const SizedBox(height: 35),
                                    PrimaryButtonComponent(
                                      text: S.of(context).login_view__login,
                                      onTap: () async {
                                        if (globalKey.currentState!.validate()) {
                                          bloc.login(loginRequestModel);
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 15),
                                    const NoAccountComponent(),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // floatingActionButton: ReusableFAB(
            //   icon: const Icon(Icons.translate),
            //   onPressed: () => BlocProvider.of<ChangeLocaleCubit>(context).changeLocale(context),
            // ),
          ),
        );
      },
    );
  }

  Widget _renderRememberMe(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // change the value of the checkbox when clicking it
            Checkbox(
              visualDensity: VisualDensity.compact,
              value: keepLoggedIn,
              onChanged: (value) {
                setState(() => keepLoggedIn = value!);
              },
            ),
            Text(
              S.of(context).login_view__keep_logged_in,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        _renderResetPassword(context),
      ],
    );
  }

  Widget _renderResetPassword(BuildContext context) {
    return TextButton(
      onPressed: () => Get.dialog(ForgetPasswordDialog()),
      child: Text(
        S.of(context).login_view__reset_password,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  Widget _renderWelcomeText(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        S.of(context).login_view__welcome,
        style: const TextStyle(
          color: kPrimaryColor,
          fontSize: 32,
        ),
      ),
    );
  }

  Widget _renderInfoText(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        S.of(context).login_view__login_your_info,
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
