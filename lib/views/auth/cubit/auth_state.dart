part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginLeading extends AuthState {}

final class LoginError extends AuthState {
  final String message;

  LoginError(this.message);
}

final class SignUpSuccess extends AuthState {}

final class SignUpLeading extends AuthState {}

final class SignUpError extends AuthState {
  final String message;

  SignUpError(this.message);
}

final class LogOutLeading extends AuthState {}

final class LogOutSuccess extends AuthState {}

final class LogOutError extends AuthState {
  final String message;

  LogOutError(this.message);
}

final class PasswordResetSuccess extends AuthState {}

final class PasswordResetLeading extends AuthState {}

final class PasswordResetError extends AuthState {
  final String message;

  PasswordResetError(this.message);
}

final class AddUserDataLeading extends AuthState {}

final class AddUserDataSuccess extends AuthState {}

final class AddUserDataError extends AuthState {}

final class GetUserDataLeading extends AuthState {}

final class GetUserDataSuccess extends AuthState {}

final class GetUserDataError extends AuthState {}
