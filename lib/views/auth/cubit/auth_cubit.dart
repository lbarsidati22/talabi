import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  SupabaseClient client = Supabase.instance.client;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLeading());
    try {
      await client.auth.signInWithPassword(password: password, email: email);
      emit(LoginSuccess());
    } on AuthException catch (e) {
      emit(LoginError(e.message));
      debugPrint(e.message);
    } catch (e) {
      emit(LoginError(e.toString()));
      debugPrint(e.toString());
    }
  }

  Future<void> register(
      {required String userName,
      required String email,
      required String password}) async {
    emit(SignUpLeading());
    try {
      await client.auth.signUp(password: password, email: email);
      emit(SignUpSuccess());
    } on AuthException catch (e) {
      emit(SignUpError(e.message));
      debugPrint("AuthException: ${e.message}");
      debugPrint(e.message);
    } catch (e) {
      emit(SignUpError(e.toString()));
      debugPrint("AuthException: ${e.toString()}");
      debugPrint(e.toString());
    }
  }
}
