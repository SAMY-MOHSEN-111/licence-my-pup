import 'package:dog_license_application/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:dog_license_application/validators/required_field_validator.dart';
import 'package:dog_license_application/widgets/input_field_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ForgetPasswordDialog extends StatelessWidget {
  final RxString email;
  final GlobalKey<FormState> globalKey = GlobalKey();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  ForgetPasswordDialog({super.key, RxString? email}) : email = email ?? ''.obs;

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AuthenticationCubit>(context);
    return Center(
      child: Dialog(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: globalKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InputFieldComponent(
                    fontSize: 14,
                    icon: Icons.email,
                    hintText: "Enter your email here",
                    validator: (str) => requiredFieldValidator(str, context),
                    onChanged: (value) => email.value = value,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if(globalKey.currentState!.validate()) bloc.forgetPassword(email.value);
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
