import 'package:dog_license_application/constants/gender_constants.dart';
import 'package:dog_license_application/cubits/profile_cubit/profile_cubit.dart';
import 'package:dog_license_application/generated/l10n.dart';
import 'package:dog_license_application/models/request/update_profile_request_model.dart';
import 'package:dog_license_application/validators/dropdown_field_validator.dart';
import 'package:dog_license_application/validators/required_field_validator.dart';
import 'package:dog_license_application/widgets/drawer_component.dart';
import 'package:dog_license_application/widgets/dropdown_menu.dart';
import 'package:dog_license_application/widgets/input_field_component.dart';
import 'package:dog_license_application/widgets/primary_button_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileView extends StatefulWidget {
  static const String id = "/ProfileView";

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController genderController;
  late TextEditingController dateController;

  final GlobalKey<FormState> profileDataKey = GlobalKey();
  final GlobalKey<FormState> passwordDataKey = GlobalKey();
  UpdateProfileRequestModel updateProfileRequestModel = UpdateProfileRequestModel();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  initState() {
    super.initState();
    var profile = GetStorage().read("profile");
    if (profile != null) {
      fullNameController = TextEditingController(text: profile["fullName"]);
      emailController = TextEditingController(text: profile["email"]);
      genderController = TextEditingController(text: profile["gender"]);
      dateController = TextEditingController(text: profile["dateOfBirth"]);
      updateProfileRequestModel.fullName = profile["fullName"];
      updateProfileRequestModel.email = profile["email"];
      updateProfileRequestModel.gender = profile["gender"];
      updateProfileRequestModel.dateOfBirth = profile["dateOfBirth"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var bloc = BlocProvider.of<ProfileCubit>(context);
        return ModalProgressHUD(
          inAsyncCall: bloc.isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).profile_view__title),
            ),
            drawer: const DrawerComponent(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: profileDataKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 35),
                          InputFieldComponent(
                            controller: fullNameController,
                            icon: FontAwesomeIcons.userTie,
                            hintText: S.of(context).register_view__username,
                            validator: (str) => requiredFieldValidator(str, context),
                            onChanged: (username) => updateProfileRequestModel.fullName = username,
                          ),
                          const SizedBox(height: 10),
                          DropdownMenuComponent(
                            height: 14,
                            value: genderController.text,
                            dropDownItems: genderDropdownItems,
                            prefixIcon: FontAwesomeIcons.venusMars,
                            onChanged: (option) {
                              genderController.text = option!;
                              updateProfileRequestModel.gender = option;
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
                            onChanged: (str) => updateProfileRequestModel.dateOfBirth = str,
                            onTap: () => _selectDate(context),
                          ),
                          const SizedBox(height: 10),
                          InputFieldComponent(
                            controller: emailController,
                            icon: FontAwesomeIcons.solidEnvelope,
                            hintText: S.of(context).register_view__email,
                            validator: (str) => requiredFieldValidator(str, context),
                            onChanged: (email) => updateProfileRequestModel.email = email,
                          ),
                          const SizedBox(height: 15),
                          PrimaryButtonComponent(
                            text: S.of(context).profile_view__edit,
                            onTap: () {
                              if (profileDataKey.currentState!.validate()) {
                                bloc.updateProfile(updateProfileRequestModel);
                              }
                            },
                          ),
                        ],
                      ),
                    ],
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
    fullNameController.dispose();
    emailController.dispose();
    genderController.dispose();
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
        updateProfileRequestModel.dateOfBirth = dateController.text;
      });
    }
  }
}
