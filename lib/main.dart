import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arc/bloc_providers.dart';
import 'package:flutter_clean_arc/product/theme/app_theme.dart';
import 'package:flutter_clean_arc/product/utility/constants/app_constants.dart';
import 'package:flutter_clean_arc/product/utility/init/application_init.dart';
import 'package:flutter_clean_arc/product/utility/router/app_router.dart';

Future<void> main() async {
  await ApplicationInitialize().start();
  runApp(MultiBlocProvider(providers: [
    ...BlocProviders.instance.providers,
  ], child: const _MyApp()));
}

class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Clean Flutter',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppConstats.instance.localeDelegations,
      supportedLocales: AppConstats.instance.localeKeys,
      routerConfig: AppRouter.routers,
      theme: AppTheme().lightTheme,
    );
  }
}
