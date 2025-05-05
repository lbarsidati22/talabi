import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talabi/core/model/product_model/favorite_product.dart';
import 'package:talabi/core/model/product_model/product_model.dart';
import 'package:talabi/core/services/api_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<ProductModel> products = [];
  List<ProductModel> searchProducts = [];
  List<ProductModel> categoryProucts = [];
  final ApiServices _apiServices = ApiServices();
  final String userId = Supabase.instance.client.auth.currentUser!.id;
  Future<void> getProducts({String? quiry, String? category}) async {
    products = [];
    searchProducts = [];
    categoryProucts = [];
    favoriteProductList = [];
    emit(GetDataLeading());
    try {
      Response response = await _apiServices.getData(
          'product_table?select=*,favorite_products(*),purchase_table(*)');
      for (var product in response.data) {
        products.add(ProductModel.fromJson(product));
      }
      debugPrint(response.data.toString());
      getFavoriteProducts();
      search(quiry);
      getCategory(category);
      emit(GetDataSuccess());
    } catch (e) {
      emit(GetDataError());
      debugPrint(e.toString());
    }
  }

  void search(String? quiry) {
    if (quiry != null) {
      for (var product in products) {
        if (product.productName!.toLowerCase().contains(quiry.toLowerCase())) {
          searchProducts.add(product);
        }
      }
    }
  }

  void getCategory(String? category) {
    if (category != null) {
      for (var product in products) {
        if (product.category!.trim().toLowerCase() ==
            category.trim().toLowerCase()) {
          categoryProucts.add(product);
        }
      }
    }
  }

  //add to favorite
  Map<String, bool> favoriteProducts = {};

  Future<void> addToFavorite(String productId) async {
    emit(AddToFavoriteLeading());
    try {
      await _apiServices.postData(
        'favorite_products',
        {
          'is_favorite': true,
          'for_user': userId,
          'for_product': productId,
        },
      );
      await getProducts();
      favoriteProducts.addAll({
        productId: true,
      });
      emit(AddToFavoriteSuccess());
    } catch (e) {
      debugPrint(e.toString());
      emit(AddToFavoriteError());
    }
  }

  bool checkIsFavorite(String productId) {
    return favoriteProducts.containsKey(productId);
  }

  Future<void> removeFavorite(String productId) async {
    emit(RemoveFavoriteLeading());
    try {
      await _apiServices.deleteData(
          'favorite_products?for_user=eq.$userId&for_product=eq.$productId');
      favoriteProducts.removeWhere((key, value) => key == productId);
      await getProducts();
      emit(RemoveFavoriteSuccess());
    } catch (e) {
      debugPrint(e.toString());
      emit(RemoveFavoriteError());
    }
  }

  //get favorite products
  List<ProductModel> favoriteProductList = [];
  void getFavoriteProducts() {
    for (ProductModel product in products) {
      if (product.favoriteProducts != null &&
          product.favoriteProducts!.isNotEmpty) {
        for (FavoriteProduct favoriteProduct in product.favoriteProducts!) {
          if (favoriteProduct.forUser == userId) {
            favoriteProductList.add(product);
            favoriteProducts.addAll({
              product.productId!: true,
            });
          }
        }
      }
    }
    // debugPrint(favoriteProductList[0].productName.toString());
  }
}
