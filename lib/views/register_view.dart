import 'package:dog_license_application/constants/gender_constants.dart';
import 'package:dog_license_application/constants/theme_constants.dart';
import 'package:dog_license_application/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:dog_license_application/generated/l10n.dart';
import 'package:dog_license_application/models/request/register_request_model.dart';
import 'package:dog_license_application/validators/dropdown_field_validator.dart';
import 'package:dog_license_application/validators/required_field_validator.dart';
import 'package:dog_license_application/views/login_view.dart';
import 'package:dog_license_application/widgets/dropdown_menu.dart';
import 'package:dog_license_application/widgets/input_field_component.dart';
import 'package:dog_license_application/widgets/password_field_component.dart';
import 'package:dog_license_application/widgets/primary_button_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:page_transition/page_transition.dart';

class SignupView extends StatefulWidget {
  static const String id = "/SignupView";

  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  RegisterRequestModel registerRequestModel = RegisterRequestModel();
  String genderSelection = genderDropdownItems[0];
  final TextEditingController dateController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        var bloc = BlocProvider.of<AuthenticationCubit>(context);
        return ModalProgressHUD(
          inAsyncCall: BlocProvider.of<AuthenticationCubit>(context).isLoading,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              backgroundColor: kScaffoldBackgroundColor,
            ),
            body: PopScope(
              canPop: false,
              onPopInvoked: (status) {
                if(status == false) navigateToLoginView(context);
              },
              child: SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        child: Form(
                          key: globalKey,
                          autovalidateMode: autovalidateMode,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _renderSignToArtsText(context),
                              const SizedBox(height: 10),
                              Transform.translate(
                                offset: const Offset(0, 0),
                                child: Text(
                                  S.of(context).register_view__your_future,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              const SizedBox(height: 35),
                              InputFieldComponent(
                                icon: FontAwesomeIcons.userTie,
                                hintText: S.of(context).register_view__username,
                                validator: (str) => requiredFieldValidator(str, context),
                                onChanged: (username) => registerRequestModel.fullName = username,
                              ),
                              const SizedBox(height: 10),
                              DropdownMenuComponent(
                                height: 14,
                                value: genderSelection,
                                dropDownItems: genderDropdownItems,
                                prefixIcon: FontAwesomeIcons.venusMars,
                                onChanged: (option) {
                                  genderSelection = option!;
                                  registerRequestModel.gender = option;
                                },
                                validator: (str) => dropdownFieldValidator(str, context, genderDropdownItems[0]),
                              ),
                              const SizedBox(height: 10),
                              InputFieldComponent(
                                controller: dateController,
                                isReadOnly: true,
                                icon: FontAwesomeIcons.calendar,
                                hintText: S.of(context).register_view__date_of_birth,
                                validator: (str) => requiredFieldValidator(str, context),
                                onChanged: (str) => registerRequestModel.dateOfBirth = str,
                                onTap: () => _selectDate(context),
                              ),
                              const SizedBox(height: 10),
                              InputFieldComponent(
                                icon: FontAwesomeIcons.solidEnvelope,
                                hintText: S.of(context).register_view__email,
                                validator: (str) => requiredFieldValidator(str, context),
                                onChanged: (email) => registerRequestModel.email = email,
                              ),
                              const SizedBox(height: 10),
                              PasswordFieldComponent(
                                hintText: S.of(context).login_view__password,
                                validator: (str) => requiredFieldValidator(str, context),
                                onChanged: (password) => registerRequestModel.password = password,
                              ),
                              const SizedBox(height: 10),
                              PasswordFieldComponent(
                                hintText: S.of(context).register_view__confirm_password,
                                validator: (str) => requiredFieldValidator(str, context),
                                onChanged: (password) => registerRequestModel.confirmPassword = password,
                              ),
                              const SizedBox(height: 25),
                              PrimaryButtonComponent(
                                text: S.of(context).register_view__signup,
                                onTap: () {
                                  if (globalKey.currentState!.validate()) {
                                    bloc.register(registerRequestModel);
                                  }
                                },
                              ),
                              const SizedBox(height: 15),
                              _renderHaveAccountComponent(context),
                              const SizedBox(height: 25)
                            ],
                          ),
                        ),
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

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dateController.text = "${picked.toLocal()}".split(' ')[0];
        registerRequestModel.dateOfBirth = dateController.text;
      });
    }
  }

  Widget _renderSignToArtsText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          softWrap: true,
          text: TextSpan(
            style: const TextStyle(
              fontFamily: "LEMONMILK",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: S.of(context).app_name,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _renderHaveAccountComponent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).register_view__have_account,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () => navigateToLoginView(context),
          child: Text(
            S.of(context).register_view__sign_in,
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> navigateToLoginView(BuildContext context) {
    return Navigator.pushReplacement(
          context,
          PageTransition(
            child: const LoginView(),
            duration: const Duration(milliseconds: 350),
            reverseDuration: const Duration(milliseconds: 350),
            type: PageTransitionType.bottomToTop,
          ),
        );
  }
}
