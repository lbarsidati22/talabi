import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabi/core/cubit/home_cubit.dart';
import 'package:talabi/core/model/product_model/product_model.dart';
import 'package:talabi/core/widgets/custtom_curcilar_indicator.dart';
import 'package:talabi/core/widgets/navigate_to.dart';
import 'package:talabi/core/widgets/prudact_item.dart';
import 'package:talabi/views/prudact_details/ui/prudact_details_page.dart';

class ProductList extends StatelessWidget {
  final bool? shrinkWrap;
  final String? quirySearch;
  final String? category;
  final ScrollPhysics? physics;
  final bool isFavoritePage;
  const ProductList({
    this.shrinkWrap,
    this.isFavoritePage = false,
    this.physics,
    this.quirySearch,
    this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit()..getProducts(quiry: quirySearch, category: category),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<ProductModel> products = quirySearch != null
              ? context.read<HomeCubit>().searchProducts
              : category != null
                  ? context.read<HomeCubit>().categoryProucts
                  : isFavoritePage
                      ? context.read<HomeCubit>().favoriteProductList
                      : context.read<HomeCubit>().products;
          return state is GetDataLeading
              ? CusttomSicrolIndicator()
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  physics: physics ?? NeverScrollableScrollPhysics(),
                  shrinkWrap: shrinkWrap ?? true,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          navigateTo(
                            context,
                            PrudactDetailsPage(
                              product: products[index],
                            ),
                          );
                        },
                        child: PrudactItem(
                          isFavorite: context
                              .read<HomeCubit>()
                              .checkIsFavorite(products[index].productId!),
                          onTap: () {
                            bool isFavorite = context
                                .read<HomeCubit>()
                                .checkIsFavorite(products[index].productId!);
                            isFavorite
                                ? context
                                    .read<HomeCubit>()
                                    .removeFavorite(products[index].productId!)
                                : context
                                    .read<HomeCubit>()
                                    .addToFavorite(products[index].productId!);
                          },
                          product: products[index],
                        ));
                  });
        },
      ),
    );
  }
}
