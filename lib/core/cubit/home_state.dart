part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetDataLeading extends HomeState {}

final class GetDataSuccess extends HomeState {}

final class GetDataError extends HomeState {}

final class AddToFavoriteLeading extends HomeState {}

final class AddToFavoriteSuccess extends HomeState {}

final class AddToFavoriteError extends HomeState {}

final class RemoveFavoriteLeading extends HomeState {}

final class RemoveFavoriteSuccess extends HomeState {}

final class RemoveFavoriteError extends HomeState {}
