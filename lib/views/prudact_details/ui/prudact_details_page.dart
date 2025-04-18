import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:talabi/core/utils/theme/app_colors.dart';
import 'package:talabi/core/widgets/cusstom_appbar.dart';
import 'package:talabi/core/widgets/label_with_text_feild.dart';
import 'package:talabi/views/prudact_details/ui/widgets/comments_list.dart';

class PrudactDetailsPage extends StatelessWidget {
  const PrudactDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildCustomAppBar(
          backGroundColor: Colors.transparent,
          context,
          'Prudact Name',
        ),
        body: ListView(
          children: [
            Image(
              height: size.height * 0.35,
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/logo.png',
              ),
            ),
            SizedBox(
              height: size.height * 0.021,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Books',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        '300 MRU',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.021,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '3 ',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Icon(
                            Icons.star,
                            size: 28,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.favorite,
                        size: 28,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.021,
                  ),
                  Text(
                    'Prudact Description',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: size.height * 0.021,
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      debugPrint(rating.toString());
                    },
                  ),
                  LableWithTextFeild(
                    hintText: 'type your feadback',
                    icon: Icons.send,
                  ),
                  SizedBox(
                    height: size.height * 0.021,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Comments',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.012,
                  ),
                  CommentList()
                ],
              ),
            ),
          ],
        ));
  }
}
