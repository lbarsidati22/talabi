import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabi/core/model/product_model/product_model.dart';
import 'package:talabi/core/services/api_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<ProductModel> products = [];
  final ApiServices _apiServices = ApiServices();
  Future<void> getProducts() async {
    emit(GetDataLeading());
    try {
      Response response = await _apiServices.getData(
          'product_table?select=*,favorite_products(*),purchase_table(*)');
      for (var product in response.data) {
        products.add(ProductModel.fromJson(product));
      }
      debugPrint(response.data.toString());
      emit(GetDataSuccess());
    } catch (e) {
      emit(GetDataError());
      debugPrint(e.toString());
    }
  }
}
