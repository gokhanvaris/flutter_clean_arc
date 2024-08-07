import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_arc/product/state/container/app_container.dart';
import 'package:logger/logger.dart';

@immutable
final class ApplicationInitialize {
  Future<void> start() async {
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        Logger().e(error);
      },
    );
  }

  Future<void> _initialize() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    FlutterError.onError = (details) {
      Logger().e(details.exceptionAsString());
    };
    _installApplicationContainer();
  }

  void _installApplicationContainer() {
    AppContainer.setup();
  }
}
