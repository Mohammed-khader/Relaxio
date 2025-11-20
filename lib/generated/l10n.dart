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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `All Offers`
  String get allOffers {
    return Intl.message('All Offers', name: 'allOffers', desc: '', args: []);
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Choose the application language that suits you`
  String get chooseTheApplicationLanguageThatSuitsYou {
    return Intl.message(
      'Choose the application language that suits you',
      name: 'chooseTheApplicationLanguageThatSuitsYou',
      desc: '',
      args: [],
    );
  }

  /// `language Changed Success`
  String get languageChangedSuccess {
    return Intl.message(
      'language Changed Success',
      name: 'languageChangedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Relaxio`
  String get relaxio {
    return Intl.message('Relaxio', name: 'relaxio', desc: '', args: []);
  }

  /// `Loge in`
  String get logeIn {
    return Intl.message('Loge in', name: 'logeIn', desc: '', args: []);
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Phone`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please Enter Your Phone',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Please Enter Your Password`
  String get PleaseEnterYourPassword {
    return Intl.message(
      'Please Enter Your Password',
      name: 'PleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message('Password', name: 'Password', desc: '', args: []);
  }

  /// `Do you have an account ? `
  String get doYouHaveAnAccount {
    return Intl.message(
      'Do you have an account ? ',
      name: 'doYouHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Please Enter Your Name`
  String get pleaseEnterYourName {
    return Intl.message(
      'Please Enter Your Name',
      name: 'pleaseEnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must be exactly 10 digits`
  String get PhoneNumberMustBeExactly10Digits {
    return Intl.message(
      'Phone number must be exactly 10 digits',
      name: 'PhoneNumberMustBeExactly10Digits',
      desc: '',
      args: [],
    );
  }

  /// `City ID`
  String get cityID {
    return Intl.message('City ID', name: 'cityID', desc: '', args: []);
  }

  /// `Please Enter A Ctry ID Number`
  String get pleaseEnterACtryIDNumber {
    return Intl.message(
      'Please Enter A Ctry ID Number',
      name: 'pleaseEnterACtryIDNumber',
      desc: '',
      args: [],
    );
  }

  /// `Only digits are allowed`
  String get onlyDigitsAreAllowed {
    return Intl.message(
      'Only digits are allowed',
      name: 'onlyDigitsAreAllowed',
      desc: '',
      args: [],
    );
  }

  /// `password must be at least 8 characters`
  String get passwordMustBeAtLeast8Characters {
    return Intl.message(
      'password must be at least 8 characters',
      name: 'passwordMustBeAtLeast8Characters',
      desc: '',
      args: [],
    );
  }

  /// `Conferm Password`
  String get confermPassword {
    return Intl.message(
      'Conferm Password',
      name: 'confermPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter your Confirm password`
  String get pleaseEnterYourConfirmpassword {
    return Intl.message(
      'Please Enter your Confirm password',
      name: 'pleaseEnterYourConfirmpassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password does not match`
  String get ConfirmPasswordDoesNotMatch {
    return Intl.message(
      'Confirm password does not match',
      name: 'ConfirmPasswordDoesNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Favourites`
  String get favourites {
    return Intl.message('Favourites', name: 'favourites', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Forget Passowrd ?`
  String get forgetPassowrd {
    return Intl.message(
      'Forget Passowrd ?',
      name: 'forgetPassowrd',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a phone`
  String get pleaseEnterAPhone {
    return Intl.message(
      'Please enter a phone',
      name: 'pleaseEnterAPhone',
      desc: '',
      args: [],
    );
  }

  /// `No Farm Available`
  String get noFarmAvailable {
    return Intl.message(
      'No Farm Available',
      name: 'noFarmAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Start your search`
  String get startYourSearch {
    return Intl.message(
      'Start your search',
      name: 'startYourSearch',
      desc: '',
      args: [],
    );
  }

  /// `Chat with owner`
  String get chatwithOwner {
    return Intl.message(
      'Chat with owner',
      name: 'chatwithOwner',
      desc: '',
      args: [],
    );
  }

  /// `Features`
  String get features {
    return Intl.message('Features', name: 'features', desc: '', args: []);
  }

  /// `Available Package`
  String get availablePackage {
    return Intl.message(
      'Available Package',
      name: 'availablePackage',
      desc: '',
      args: [],
    );
  }

  /// `Start from`
  String get startFrom {
    return Intl.message('Start from', name: 'startFrom', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Max Guestes`
  String get maxGuestes {
    return Intl.message('Max Guestes', name: 'maxGuestes', desc: '', args: []);
  }

  /// `Please check your phone message`
  String get pleaseCheckYourPhoneMessage {
    return Intl.message(
      'Please check your phone message',
      name: 'pleaseCheckYourPhoneMessage',
      desc: '',
      args: [],
    );
  }

  /// `We've sent a code to`
  String get weveSentACodeTo {
    return Intl.message(
      'We\'ve sent a code to',
      name: 'weveSentACodeTo',
      desc: '',
      args: [],
    );
  }

  /// `Verify OTP`
  String get verifyOTP {
    return Intl.message('Verify OTP', name: 'verifyOTP', desc: '', args: []);
  }

  /// `Send code again`
  String get sendCodeAgain {
    return Intl.message(
      'Send code again',
      name: 'sendCodeAgain',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
