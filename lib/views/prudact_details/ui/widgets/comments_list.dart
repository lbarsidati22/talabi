import 'package:flutter/material.dart';
import 'package:talabi/views/prudact_details/ui/widgets/cusstom_comment.dart';

class CommentList extends StatelessWidget {
  const CommentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CusttomComments();
      },
      separatorBuilder: (context, index) {
        return Divider(
          thickness: 2,
        );
      },
      itemCount: 3,
    );
  }
}
