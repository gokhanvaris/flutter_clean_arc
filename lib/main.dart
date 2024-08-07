import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arc/bloc_providers.dart';
import 'package:flutter_clean_arc/product/state/connectivity/connectivity_widget.dart';
import 'package:flutter_clean_arc/product/theme/app_theme.dart';
import 'package:flutter_clean_arc/product/utility/constants/app_constants.dart';
import 'package:flutter_clean_arc/product/utility/init/application_init.dart';
import 'package:flutter_clean_arc/product/utility/router/app_router.dart';

Future<void> main() async {
  await ApplicationInitialize().start();
  runApp(
    MultiBlocProvider(
      providers: BlocProviders.instance.providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Clean Flutter',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppConstats.instance.localeDelegations,
      supportedLocales: AppConstats.instance.localeKeys,
      routerDelegate: AppRouter.routerDelegate,
      routeInformationParser: AppRouter.routeInformationParser,
      routeInformationProvider: AppRouter.routeInformationProvider,
      theme: AppTheme().lightTheme,
      builder: (context, child) {
        return ConnectivityAdaptiveWidget(
          child: Scaffold(
            body: child,
          ),
        );
      },
    );
  }
}
