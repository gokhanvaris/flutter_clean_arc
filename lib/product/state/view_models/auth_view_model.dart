import 'package:flutter_clean_arc/product/data/repository/auth_repository.dart';
import 'package:flutter_clean_arc/product/state/base/app_state.dart';
import 'package:flutter_clean_arc/product/state/base/base_state.dart';
import 'package:flutter_clean_arc/product/utility/models/req/user_request_model.dart';

final class AuthViewModel extends BaseCubit<AppState> {
  AuthViewModel() : super(const UserListInitial());

  final AuthRepository _authRepository = AuthRepository();

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<void> connect(UserRequestModel model) async {
    try {
      emit(state.copyWith(isLoading: true));
      final login = await _authRepository.connect(model);
      emit(LoginState(userResponseModel: login));
    } catch (e) {
      emit(LoginErrorState(error: e.toString()));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
