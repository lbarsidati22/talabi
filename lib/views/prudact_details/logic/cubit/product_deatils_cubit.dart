import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabi/core/services/api_services.dart';
import 'package:talabi/views/prudact_details/logic/models/rate_model.dart';

part 'product_deatils_state.dart';

class ProductDeatilsCubit extends Cubit<ProductDeatilsState> {
  ProductDeatilsCubit() : super(ProductDeatilsInitial());
  final ApiServices _apiServices = ApiServices();
  List<RateModel> rates = [];
  Future<void> getRate({required String productId}) async {
    emit(GetRateLeading());
    try {
      Response response = await _apiServices
          .getData('rates_table?select=*&for_product=eq.$productId');
      for (var rate in response.data) {
        rates.add(RateModel.fromJson(rate));
      }
      emit(GetRateSuccess());
    } catch (e) {
      emit(GetRateError());
      debugPrint(e.toString());
    }
  }
}
