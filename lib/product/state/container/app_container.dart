import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_clean_arc/product/core/cache/app_database.dart';
import 'package:flutter_clean_arc/product/core/cache/cache_manager.dart';
import 'package:flutter_clean_arc/product/state/connectivity/network_checker.dart';
import 'package:flutter_clean_arc/product/state/view_models/auth_view_model.dart';
import 'package:flutter_clean_arc/product/utility/models/res/user_model.dart';
import 'package:get_it/get_it.dart';

final class AppContainer {
  const AppContainer._();
  static final _getIt = GetIt.I;

  static void setup() {
    _getIt.registerLazySingleton<AuthViewModel>(
      AuthViewModel.new,
    );
    _getIt.registerLazySingleton<AppDatabase>(
      AppDatabase.new,
    );
    _getIt.registerLazySingleton<CacheManager<User>>(
      () => CacheManager<User>(_getIt<AppDatabase>()),
    );

    _getIt.registerLazySingleton<NetworkChecker>(
      () => NetworkChecker(Connectivity()),
    );
  }

  static T read<T extends Object>() => _getIt<T>();
}
