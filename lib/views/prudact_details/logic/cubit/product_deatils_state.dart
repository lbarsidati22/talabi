part of 'product_deatils_cubit.dart';

sealed class ProductDeatilsState {}

final class ProductDeatilsInitial extends ProductDeatilsState {}

final class GetRateLeading extends ProductDeatilsState {}

final class GetRateSuccess extends ProductDeatilsState {}

final class GetRateError extends ProductDeatilsState {}

final class AddCommentLeading extends ProductDeatilsState {}

final class AddCommentSuccess extends ProductDeatilsState {}

final class AddCommentErroe extends ProductDeatilsState {}
