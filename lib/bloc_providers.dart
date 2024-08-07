import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arc/product/state/connectivity/network_checker.dart';
import 'package:flutter_clean_arc/product/state/container/app_state_items.dart';
import 'package:flutter_clean_arc/product/state/view_models/auth_view_model.dart';

class BlocProviders {
  static BlocProviders? _instance;
  static BlocProviders get instance =>
      _instance ??= BlocProviders._initialize();
  List<BlocProvider> get providers => _providers;
  final List<BlocProvider> _providers = [
    BlocProvider<AuthViewModel>(
      create: (context) => AppStateItems.authViewModel,
    ),
    BlocProvider<NetworkChecker>(
      create: (context) => AppStateItems.networkChecker,
    ),
  ];
  BlocProviders._initialize();
}
