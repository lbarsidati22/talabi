import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talabi/core/services/api_services.dart';
import 'package:talabi/views/prudact_details/logic/models/rate_model.dart';

part 'product_deatils_state.dart';

class ProductDeatilsCubit extends Cubit<ProductDeatilsState> {
  ProductDeatilsCubit() : super(ProductDeatilsInitial());
  final ApiServices _apiServices = ApiServices();
  List<RateModel> rates = [];
  final userId = Supabase.instance.client.auth.currentUser!.id;
  int avrageRate = 0;
  Future<void> getRate({required String productId}) async {
    emit(GetRateLeading());
    try {
      Response response = await _apiServices
          .getData('rates_table?select=*&for_product=eq.$productId');
      for (var rate in response.data) {
        rates.add(RateModel.fromJson(rate));
      }
      for (var userRate in rates) {
        if (userRate.rate != null) {
          avrageRate += userRate.rate!;
        }
      }
      avrageRate = avrageRate ~/ rates.length;
      emit(GetRateSuccess());
      debugPrint(avrageRate.toString());
    } catch (e) {
      emit(GetRateError());
      debugPrint(e.toString());
    }
  }

  Future<void> addComment({required Map<String, dynamic> data}) async {
    emit(AddCommentLeading());
    try {
      await _apiServices.postData('comments_table', data);
      emit(AddCommentSuccess());
    } catch (e) {
      emit(AddCommentErroe());
      debugPrint(e.toString());
    }
  }
}
