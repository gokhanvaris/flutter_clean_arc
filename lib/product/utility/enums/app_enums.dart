import 'package:flutter/material.dart';

enum RouterEnums {
  initial('/'),
  login('/login'),
  register('/register');

  const RouterEnums(this.value);
  final String value;
}

enum Locales {
  tr(Locale('tr', 'TR')),
  en(Locale('en', 'US'));

  final Locale locale;
  const Locales(this.locale);
}

enum NetworkStatus { connected, disconnected }
