import 'package:flutter/material.dart';
import 'package:talabi/core/widgets/cusstom_appbar.dart';
import 'package:talabi/views/home/ui/widgets/product_list.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key, required this.quirySearch});
  final String quirySearch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, 'Search'),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          ProductList(
            quirySearch: quirySearch,
          ),
        ],
      ),
    );
  }
}
