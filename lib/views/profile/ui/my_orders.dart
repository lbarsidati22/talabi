import 'package:flutter/material.dart';
import 'package:talabi/core/widgets/cusstom_appbar.dart';
import 'package:talabi/views/home/ui/widgets/product_list.dart';

class MyOrdersViwe extends StatelessWidget {
  const MyOrdersViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "My Orders"),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: ProductList(
          shrinkWrap: false,
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
