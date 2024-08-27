import 'package:dog_license_application/constants/theme_constants.dart';
import 'package:dog_license_application/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:dog_license_application/cubits/profile_cubit/profile_cubit.dart';
import 'package:dog_license_application/extensions/string_extensions.dart';
import 'package:dog_license_application/generated/l10n.dart';
import 'package:dog_license_application/views/change_password_view.dart';
import 'package:dog_license_application/views/community_view.dart';
import 'package:dog_license_application/views/home_view.dart';
import 'package:dog_license_application/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: <Widget>[
            _renderListViewHeader(context),
            _renderListViewBody(context),
          ],
        ),
      ),
    );
  }

  Widget _renderListViewHeader(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var bloc = BlocProvider.of<ProfileCubit>(context);
        var firstName = GetStorage()
            .read("profile")?["fullName"]
            .split(" ")[0]
            .toString()
            .capitalizeFirstLetter();
        var avatarUrl = GetStorage().read("avatar") ?? GetStorage().read("profile")?["avatarUrl"];
        return SizedBox(
          height: 250,
          child: DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [kPrimaryColor, kSecondaryColor]),
            ),
            child: Column(
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  "${S.of(context).drawer__hello_message}, $firstName",
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () => bloc.uploadProfileAvatar(),
                  child: CircleAvatar(
                    backgroundImage: avatarUrl == null ? null : NetworkImage(avatarUrl),
                    radius: 65,
                    child: bloc.isLoading
                        ? const CircularProgressIndicator()
                        : avatarUrl == null
                            ? const Icon(Icons.add, size: 36, color: kPrimaryColor)
                            : null,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _renderListViewBody(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        var bloc = BlocProvider.of<AuthenticationCubit>(context);
        return SizedBox(
          height: MediaQuery.of(context).size.height - 250,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
                title: Text(S.of(context).drawer__home),
                onTap: () async {
                  Get.back();
                  Get.offAllNamed(HomeView.id);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(S.of(context).drawer__profile),
                onTap: () async {
                  Get.back();
                  Get.offAllNamed(ProfileView.id);
                },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: Text(S.of(context).drawer__community),
                onTap: () async {
                  Get.back();
                  Get.offAllNamed(CommunityView.id);
                },
              ),
              ListTile(
                leading: const Icon(Icons.password),
                title: Text(S.of(context).drawer__change_password),
                onTap: () async {
                  Get.back();
                  Get.offAllNamed(ChangePasswordView.id);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: Text(
                  S.of(context).drawer__logout,
                  style: const TextStyle(color: Colors.red),
                ),
                onTap: () => bloc.logout(),
              ),
              const Spacer(),
              Text(
                S.of(context).drawer__version,
                textAlign: TextAlign.center,
                style: const TextStyle(color: kPrimaryColor),
              ), // push this text to the end
              const SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }
}
