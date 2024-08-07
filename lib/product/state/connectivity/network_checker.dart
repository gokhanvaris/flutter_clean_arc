import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_clean_arc/product/utility/enums/app_enums.dart';

class NetworkChecker extends Cubit<NetworkStatus> {
  final Connectivity _connectivity;
  StreamSubscription<ConnectivityResult>? _subscription;

  NetworkChecker(this._connectivity) : super(NetworkStatus.disconnected) {
    _initialize();
  }

  void _initialize() {
    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        emit(NetworkStatus.disconnected);
      } else {
        emit(NetworkStatus.connected);
      }
    });
  }

  Future<bool> isConnected() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
