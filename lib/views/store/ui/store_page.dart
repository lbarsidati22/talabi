import 'package:flutter/material.dart';
import 'package:talabi/views/home/ui/widgets/product_list.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ListView(
      children: [
        SizedBox(
          height: size.height * 0.02,
        ),

        //prudact Item
        Center(
          child: Text(
            'All Talabi Prudact',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        SizedBox(
          height: size.height * 0.012,
        ),
        ProductList(),
      ],
    );
  }
}
