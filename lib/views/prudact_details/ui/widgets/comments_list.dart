import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talabi/core/model/product_model/product_model.dart';
import 'package:talabi/core/widgets/custtom_curcilar_indicator.dart';
import 'package:talabi/views/prudact_details/ui/widgets/cusstom_comment.dart';

class CommentList extends StatelessWidget {
  const CommentList({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client
          .from('comments_table')
          .stream(primaryKey: ['id'])
          .eq('for_product', productModel.productId!)
          .order('created_at'),
      builder: (_, snapshot) {
        List<Map<String, dynamic>>? data = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CusttomSicrolIndicator(),
          );
        } else if (snapshot.hasData) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CusttomComments(
                commentData: data[index],
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 2,
              );
            },
            itemCount: data!.length ?? 0,
          );
        } else if (!snapshot.hasData) {
          return Center(
            child: Text('no Comments yet'),
          );
        } else {
          return Center(
            child: Text('somthing is rong'),
          );
        }
      },
    );
  }
}
