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
  final ScrollPhysics? physics;
  const ProductList({
    this.shrinkWrap,
    this.physics,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<ProductModel> products = context.read<HomeCubit>().products;
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
                          product: products[index],
                        ));
                  });
        },
      ),
    );
  }
}
