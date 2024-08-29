// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `License My Pup`
  String get app_name {
    return Intl.message(
      'License My Pup',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get login_view__welcome {
    return Intl.message(
      'Welcome',
      name: 'login_view__welcome',
      desc: '',
      args: [],
    );
  }

  /// `Please login with your information.`
  String get login_view__login_your_info {
    return Intl.message(
      'Please login with your information.',
      name: 'login_view__login_your_info',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get login_view__email {
    return Intl.message(
      'Email',
      name: 'login_view__email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_view__password {
    return Intl.message(
      'Password',
      name: 'login_view__password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_view__login {
    return Intl.message(
      'Login',
      name: 'login_view__login',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get login_view__signup {
    return Intl.message(
      'Sign Up',
      name: 'login_view__signup',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?  `
  String get login_view__no_account {
    return Intl.message(
      'Don\'t have an account?  ',
      name: 'login_view__no_account',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get login_view__reset_password {
    return Intl.message(
      'Forget password',
      name: 'login_view__reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get login_view__keep_logged_in {
    return Intl.message(
      'Remember me',
      name: 'login_view__keep_logged_in',
      desc: '',
      args: [],
    );
  }

  /// `Arts`
  String get register_view__arts {
    return Intl.message(
      'Arts',
      name: 'register_view__arts',
      desc: '',
      args: [],
    );
  }

  /// `Union`
  String get register_view__union {
    return Intl.message(
      'Union',
      name: 'register_view__union',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get register_view__username {
    return Intl.message(
      'Full Name',
      name: 'register_view__username',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get register_view__phone {
    return Intl.message(
      'Phone',
      name: 'register_view__phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get register_view__email {
    return Intl.message(
      'Email',
      name: 'register_view__email',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get register_view__gender {
    return Intl.message(
      'Gender',
      name: 'register_view__gender',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get register_view__date_of_birth {
    return Intl.message(
      'Date of Birth',
      name: 'register_view__date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get register_view__password {
    return Intl.message(
      'Password',
      name: 'register_view__password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get register_view__confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'register_view__confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get register_view__signup {
    return Intl.message(
      'Sign Up',
      name: 'register_view__signup',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get register_view__have_account {
    return Intl.message(
      'Already have an account? ',
      name: 'register_view__have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get register_view__sign_in {
    return Intl.message(
      'Sign In',
      name: 'register_view__sign_in',
      desc: '',
      args: [],
    );
  }

  /// `YOUR FUTURE PUP BEGINS HERE`
  String get register_view__your_future {
    return Intl.message(
      'YOUR FUTURE PUP BEGINS HERE',
      name: 'register_view__your_future',
      desc: '',
      args: [],
    );
  }

  /// `Password doesn't match`
  String get register_view__password_mismatch {
    return Intl.message(
      'Password doesn\'t match',
      name: 'register_view__password_mismatch',
      desc: '',
      args: [],
    );
  }

  /// `Verification email has been sent to your email`
  String get register_view__verification_email_send {
    return Intl.message(
      'Verification email has been sent to your email',
      name: 'register_view__verification_email_send',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get field_validation__required {
    return Intl.message(
      'This field is required',
      name: 'field_validation__required',
      desc: '',
      args: [],
    );
  }

  /// `Please contact customer service for assistance`
  String get forgot_password_dialog__title {
    return Intl.message(
      'Please contact customer service for assistance',
      name: 'forgot_password_dialog__title',
      desc: '',
      args: [],
    );
  }

  /// `Alright`
  String get forgot_password_dialog__button {
    return Intl.message(
      'Alright',
      name: 'forgot_password_dialog__button',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get snackbar__internet_error {
    return Intl.message(
      'No internet connection',
      name: 'snackbar__internet_error',
      desc: '',
      args: [],
    );
  }

  /// `Attention Please`
  String get snackbar__default_title {
    return Intl.message(
      'Attention Please',
      name: 'snackbar__default_title',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get drawer__hello_message {
    return Intl.message(
      'Hello',
      name: 'drawer__hello_message',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get drawer__home {
    return Intl.message(
      'Home',
      name: 'drawer__home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get drawer__profile {
    return Intl.message(
      'Profile',
      name: 'drawer__profile',
      desc: '',
      args: [],
    );
  }

  /// `Community`
  String get drawer__community {
    return Intl.message(
      'Community',
      name: 'drawer__community',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get drawer__change_password {
    return Intl.message(
      'Change Password',
      name: 'drawer__change_password',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get drawer__logout {
    return Intl.message(
      'Logout',
      name: 'drawer__logout',
      desc: '',
      args: [],
    );
  }

  /// `Version 1.0.0`
  String get drawer__version {
    return Intl.message(
      'Version 1.0.0',
      name: 'drawer__version',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home_view__title {
    return Intl.message(
      'Home',
      name: 'home_view__title',
      desc: '',
      args: [],
    );
  }

  /// `completed`
  String get home_view__completed {
    return Intl.message(
      'completed',
      name: 'home_view__completed',
      desc: '',
      args: [],
    );
  }

  /// `out of`
  String get home_view__out_of {
    return Intl.message(
      'out of',
      name: 'home_view__out_of',
      desc: '',
      args: [],
    );
  }

  /// `lessons`
  String get home_view__lessons {
    return Intl.message(
      'lessons',
      name: 'home_view__lessons',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile_view__title {
    return Intl.message(
      'Profile',
      name: 'profile_view__title',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get profile_view__edit {
    return Intl.message(
      'Edit Profile',
      name: 'profile_view__edit',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated successfully`
  String get profile_view__success_message {
    return Intl.message(
      'Profile updated successfully',
      name: 'profile_view__success_message',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password_view__title {
    return Intl.message(
      'Change Password',
      name: 'change_password_view__title',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get change_password_view__old_password {
    return Intl.message(
      'Old Password',
      name: 'change_password_view__old_password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get change_password_view__new_password {
    return Intl.message(
      'New Password',
      name: 'change_password_view__new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get change_password_view__confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'change_password_view__confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get change_password_view__submit {
    return Intl.message(
      'Submit',
      name: 'change_password_view__submit',
      desc: '',
      args: [],
    );
  }

  /// `Community`
  String get community_view__title {
    return Intl.message(
      'Community',
      name: 'community_view__title',
      desc: '',
      args: [],
    );
  }

  /// `Lessons`
  String get lessons_view__lessons {
    return Intl.message(
      'Lessons',
      name: 'lessons_view__lessons',
      desc: '',
      args: [],
    );
  }

  /// `Unit Exam`
  String get lessons_view__take_exam {
    return Intl.message(
      'Unit Exam',
      name: 'lessons_view__take_exam',
      desc: '',
      args: [],
    );
  }

  /// `Lesson`
  String get lesson_view__title {
    return Intl.message(
      'Lesson',
      name: 'lesson_view__title',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
