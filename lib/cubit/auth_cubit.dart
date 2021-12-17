import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluuter_airplane/models/user_model.dart';
import 'package:fluuter_airplane/services/auth_service.dart';
import 'package:fluuter_airplane/services/user_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp({required String email, required String password, required String name, required String hobby}) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().signUp(
        email,
        password,
        name,
        hobby,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().signIn(
        email,
        password,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUserById(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
