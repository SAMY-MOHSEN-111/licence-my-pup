import 'package:dog_license_application/configuration/dio_client.dart';
import 'package:dog_license_application/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:dog_license_application/cubits/change_locale_cubit/change_locale_cubit.dart';
import 'package:dog_license_application/cubits/exams_cubit/exams_cubit.dart';
import 'package:dog_license_application/cubits/lessons_cubit/lessons_cubit.dart';
import 'package:dog_license_application/cubits/posts_cubit/posts_cubit.dart';
import 'package:dog_license_application/cubits/profile_cubit/profile_cubit.dart';
import 'package:dog_license_application/cubits/scores_cubit/scores_cubit.dart';
import 'package:dog_license_application/cubits/units_cubit/units_cubit.dart';
import 'package:dog_license_application/generated/l10n.dart';
import 'package:dog_license_application/themes/light_theme.dart';
import 'package:dog_license_application/views/change_password_view.dart';
import 'package:dog_license_application/views/community_view.dart';
import 'package:dog_license_application/views/forget_password_view.dart';
import 'package:dog_license_application/views/home_view.dart';
import 'package:dog_license_application/views/lesson_view.dart';
import 'package:dog_license_application/views/lessons_view.dart';
import 'package:dog_license_application/views/login_view.dart';
import 'package:dog_license_application/views/profile_view.dart';
import 'package:dog_license_application/views/question_details_view.dart';
import 'package:dog_license_application/views/register_view.dart';
import 'package:dog_license_application/views/scores_view.dart';
import 'package:dog_license_application/views/web_view_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'views/exam_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await Get.putAsync(() async => DioClient().init());

  var locale = await GetStorage().read('locale') ?? 'en';
  await GetStorage().writeIfNull('locale', locale);

  var loggedIn = await GetStorage().read('logged-in') ?? false;
  await GetStorage().writeIfNull('logged-in', loggedIn);

  runApp(DogLicenseApplication(locale: locale, loggedIn: loggedIn));
}

class DogLicenseApplication extends StatelessWidget {
  final String locale;
  final bool loggedIn;

  const DogLicenseApplication({
    super.key,
    required this.locale,
    required this.loggedIn,
  });

  @override
  Widget build(BuildContext context) {
    return bloc.MultiBlocProvider(
      providers: [
        bloc.BlocProvider(create: (context) => UnitsCubit()),
        bloc.BlocProvider(create: (context) => PostsCubit()),
        bloc.BlocProvider(create: (context) => ExamsCubit()),
        bloc.BlocProvider(create: (context) => ScoresCubit()),
        bloc.BlocProvider(create: (context) => ProfileCubit()),
        bloc.BlocProvider(create: (context) => LessonsCubit()),
        bloc.BlocProvider(create: (context) => AuthenticationCubit()),
        bloc.BlocProvider(create: (context) => ChangeLocaleCubit(locale)),
      ],
      child: Builder(builder: (context) {
        var currentLocale = Locale(bloc.BlocProvider.of<ChangeLocaleCubit>(context).locale!);
        return bloc.BlocBuilder<ChangeLocaleCubit, ChangeLocaleState>(
          builder: (context, state) {
            return GetMaterialApp(
              defaultTransition: Transition.noTransition,
              theme: appLightTheme,
              debugShowCheckedModeBanner: false,
              locale: currentLocale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              routingCallback: (route) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              getPages: [
                GetPage(name: ExamView.id, page: () => const ExamView()),
                GetPage(name: HomeView.id, page: () => const HomeView()),
                GetPage(name: LoginView.id, page: () => const LoginView()),
                GetPage(name: ScoresView.id, page: () => const ScoresView()),
                GetPage(name: SignupView.id, page: () => const SignupView()),
                GetPage(name: ProfileView.id, page: () => const ProfileView()),
                GetPage(name: CommunityView.id, page: () => const CommunityView()),
                GetPage(name: ChangePasswordView.id, page: () => const ChangePasswordView()),
                GetPage(name: LessonView.id, page: () => const LessonView(), transition: Transition.rightToLeft),
                GetPage(name: LessonsView.id, page: () => const LessonsView(), transition: Transition.rightToLeft),
                GetPage(name: WebViewView.id, page: () => const WebViewView(), transition: Transition.rightToLeft),
                GetPage(name: ForgetPasswordView.id, page: () => const ForgetPasswordView(), transition: Transition.rightToLeft),
                GetPage(name: QuestionDetailsView.id, page: () => const QuestionDetailsView(), transition: Transition.rightToLeft),
              ],
              initialRoute: loggedIn ? HomeView.id : LoginView.id,
            );
          },
        );
      }),
    );
  }
}
