import 'dart:io';

import 'package:flutter_clean_arc/product/data/service/auth_service.dart';
import 'package:flutter_clean_arc/product/data/service/dio/config/http_manager.dart';
import 'package:flutter_clean_arc/product/utility/constants/app_constants.dart';
import 'package:flutter_clean_arc/product/utility/models/req/user_request_model.dart';
import 'package:flutter_clean_arc/product/utility/models/res/user_model.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AuthRepository {
  AuthRepository() {
    setUserRequirements();
  }

  final AuthService _authService = AuthService(path: '', tag: '');

  Future<User> connect(UserRequestModel model) async {
    try {
      final response = await _authService.connect(model);

      final user = User.fromJson(response.data as Map<String, dynamic>);

      setUser(user: user);
      return user;
    } catch (e) {
      rethrow;
    }
  }
}

Future<void> setUserRequirements() async {
  final packageInfo = await PackageInfo.fromPlatform();
  AppConstats.appVersion = packageInfo.version;
  AppConstats.buildNumber = packageInfo.buildNumber;
  AppConstats.packageName = packageInfo.packageName;
  AppConstats.platform = Platform.operatingSystem;
}

void setUser({required User user}) {
  HttpManager.user = user;
}
