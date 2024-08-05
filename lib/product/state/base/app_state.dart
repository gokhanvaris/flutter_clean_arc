import 'package:equatable/equatable.dart';
import 'package:flutter_clean_arc/product/utility/models/res/user_model.dart';

abstract class AppState extends Equatable {
  const AppState({this.isLoading = false});

  final bool isLoading;

  @override
  List<Object> get props => [isLoading];

  AppState copyWith({
    bool? isLoading,
  });
}

class LoginState extends AppState {
  const LoginState({required this.userResponseModel, super.isLoading});

  final User userResponseModel;

  @override
  List<Object> get props => [userResponseModel, isLoading];

  @override
  LoginState copyWith({
    User? userResponseModel,
    bool? isLoading,
  }) {
    return LoginState(
      userResponseModel: userResponseModel ?? this.userResponseModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() => 'LoginState';
}

class LoginErrorState extends AppState {
  final String error;

  const LoginErrorState({required this.error, super.isLoading});

  @override
  List<Object> get props => [error, isLoading];

  @override
  LoginErrorState copyWith({
    String? error,
    bool? isLoading,
  }) {
    return LoginErrorState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() => 'LoginErrorState';
}

// Yeni durumlar
class UserListInitial extends AppState {
  const UserListInitial({super.isLoading});

  @override
  UserListInitial copyWith({
    bool? isLoading,
  }) {
    return UserListInitial(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
