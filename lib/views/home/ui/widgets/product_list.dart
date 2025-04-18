import 'package:flutter/material.dart';
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
    return ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
        physics: physics ?? NeverScrollableScrollPhysics(),
        shrinkWrap: shrinkWrap ?? true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                navigateTo(
                  context,
                  PrudactDetailsPage(),
                );
              },
              child: PrudactItem());
        });
  }
}
