import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabi/core/services/api_services.dart';
import 'package:talabi/views/prudact_details/logic/models/rate_model.dart';

part 'product_deatils_state.dart';

class ProductDeatilsCubit extends Cubit<ProductDeatilsState> {
  ProductDeatilsCubit() : super(ProductDeatilsInitial());
  final ApiServices _apiServices = ApiServices();
  List<RateModel> rates = [];
  Future<void> getRate() async {
    emit(GetRateLeading());
    try {
      Response response = await _apiServices.getData('');
    } catch (e) {}
  }
}
