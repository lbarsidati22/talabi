part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetDataLeading extends HomeState {}

final class GetDataSuccess extends HomeState {}

final class GetDataError extends HomeState {}
