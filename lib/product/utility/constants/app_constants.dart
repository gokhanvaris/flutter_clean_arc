import 'package:flutter/material.dart';
import 'package:flutter_clean_arc/product/utility/enums/app_enums.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final class AppConstats {
  AppConstats._init();
  static AppConstats? _instance;
  static AppConstats get instance => _instance ??= AppConstats._init();

  static const String _baseUrl = "localhost";
  String get baseUrl => _baseUrl;
  static const String supportMail = "";
  static const String googlePlayLink = "";
  static const String appStoreLink = "";
  static const String publicAPIKey = "";
  static String? appVersion;
  static String? buildNumber;
  static String? packageName;
  static String? platform;

  // static String? MOBILE_SHOW_ADVERTISE;
  // static String? MOBILE_ANDRIOD_MARKET_ID;
  // static String? MOBILE_IOS_MARKET_ID;
  // static String? MOBILE_IOS_MARKET_URL;
  // static String? MOBILE_ANDROID_MARKET_URL;
  final List<Locale> _localeKeys = [Locales.en.locale, Locales.tr.locale];
  final List<LocalizationsDelegate> _localeDelegations = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  List<LocalizationsDelegate> get localeDelegations => _localeDelegations;
  List<Locale> get localeKeys => _localeKeys;
}
