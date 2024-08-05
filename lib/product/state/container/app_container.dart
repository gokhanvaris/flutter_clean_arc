import 'package:flutter_clean_arc/product/state/view_models/auth_view_model.dart';
import 'package:get_it/get_it.dart';

final class AppContainer {
  const AppContainer._();
  static final _getIt = GetIt.I;

  static void setup() {
    _getIt.registerLazySingleton<AuthViewModel>(
      AuthViewModel.new,
    );
  }

  static T read<T extends Object>() => _getIt<T>();
}
