import 'package:flutter/material.dart';
import 'package:talabi/core/widgets/cusstom_appbar.dart';
import 'package:talabi/views/home/ui/widgets/product_list.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, category),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          ProductList(
            category: category,
          ),
        ],
      ),
    );
  }
}
