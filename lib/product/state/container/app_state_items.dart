import 'package:flutter_clean_arc/product/state/container/app_container.dart';
import 'package:flutter_clean_arc/product/state/view_models/auth_view_model.dart';

final class AppStateItems {
  const AppStateItems._();

  static AuthViewModel get authViewModel => AppContainer.read<AuthViewModel>();
}
