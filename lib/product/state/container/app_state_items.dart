import 'package:flutter_clean_arc/product/core/cache/app_database.dart';
import 'package:flutter_clean_arc/product/core/cache/cache_manager.dart';
import 'package:flutter_clean_arc/product/state/connectivity/network_checker.dart';
import 'package:flutter_clean_arc/product/state/container/app_container.dart';
import 'package:flutter_clean_arc/product/state/view_models/auth_view_model.dart';

final class AppStateItems {
  const AppStateItems._();

  static AuthViewModel get authViewModel => AppContainer.read<AuthViewModel>();
  static AppDatabase get appDatabase => AppContainer.read<AppDatabase>();
  static CacheManager get cacheManager => AppContainer.read<CacheManager>();
  static NetworkChecker get networkChecker =>
      AppContainer.read<NetworkChecker>();
}
