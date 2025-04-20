import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talabi/core/utils/app_constants.dart';
import 'package:talabi/views/profile/logic/model/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  SupabaseClient client = Supabase.instance.client;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLeading());
    try {
      await client.auth.signInWithPassword(password: password, email: email);
      emit(LoginSuccess());
      await getUserData();
    } on AuthException catch (e) {
      emit(LoginError(e.message));
      debugPrint(e.message);
    } catch (e) {
      emit(LoginError(e.toString()));
      debugPrint(e.toString());
    }
  }

  Future<void> register(
      {required String name,
      required String email,
      required String password}) async {
    emit(SignUpLeading());
    try {
      await client.auth.signUp(password: password, email: email);
      emit(SignUpSuccess());
      await addUserData(name: name, email: email);
      await getUserData();
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

  Future<void> logOut() async {
    emit(LogOutLeading());
    try {
      await client.auth.signOut();
      emit(LogOutSuccess());
    } on AuthException catch (e) {
      emit(LogOutError(e.message));
      debugPrint(e.message);
    } catch (e) {
      emit(LogOutError(e.toString()));
      debugPrint(e.toString());
    }
  }

  Future<void> resetPassword({required String email}) async {
    emit(PasswordResetLeading());
    try {
      await client.auth.resetPasswordForEmail(email);
      emit(PasswordResetSuccess());
    } on AuthException catch (e) {
      emit(PasswordResetError(e.message));
    } catch (e) {
      emit(PasswordResetError(e.toString()));
      debugPrint(e.toString());
    }
  }

  Future<void> addUserData(
      {required String name, required String email}) async {
    emit(AddUserDataLeading());
    try {
      await client.from(AppConstants.usersTableName).insert({
        'user_id': client.auth.currentUser!.id,
        'name': name,
        'email': email,
      });
    } catch (e) {
      emit(AddUserDataError());
    }
  }

  UserModel? userModel;
  Future<void> getUserData() async {
    emit(GetUserDataLeading());
    try {
      final data = await client.from(AppConstants.usersTableName).select().eq(
            'user_id',
            client.auth.currentUser!.id,
          );
      userModel = UserModel(
        userId: data[0]['user_id'],
        name: data[0]['name'],
        email: data[0]['email'],
      );

      log(data.toString());
      emit(GetUserDataSuccess());
    } catch (e) {
      emit(GetUserDataError());
      debugPrint(e.toString());
    }
  }
}
