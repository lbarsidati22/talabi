import 'package:flutter/material.dart';

class CusttomComments extends StatelessWidget {
  const CusttomComments({
    super.key,
    required this.commentData,
  });
  final Map<String, dynamic> commentData;
  //   {
  //     "id": "8adbcb65-cb5b-4438-a53b-3d2364257d9d",
  //     "created_at": "2025-04-21T01:27:01.351816+00:00",
  //     "comment": "thats is good",
  //     "for_user": "bd135a62-dade-47b7-a74b-e8daf2e5447e",
  //     "for_product": "baf0dafb-cc17-44da-84bb-dc93075786c9",
  //     "user_name": "ahmed",
  //     "repley": "okey"
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              commentData['user_name'] ?? 'user',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              commentData['comment'],
            ),
          ],
        ),
        commentData['repley'] != null
            ? InkWell(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Repley...',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              )
            : Container(),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(
        //       'repley....',
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
