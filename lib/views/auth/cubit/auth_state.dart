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
