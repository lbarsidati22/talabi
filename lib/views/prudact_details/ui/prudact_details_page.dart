import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:talabi/core/model/product_model/product_model.dart';
import 'package:talabi/core/utils/app_constants.dart';
import 'package:talabi/core/utils/theme/app_colors.dart';
import 'package:talabi/core/widgets/cusstom_appbar.dart';
import 'package:talabi/core/widgets/custtom_curcilar_indicator.dart';
import 'package:talabi/core/widgets/label_with_text_feild.dart';
import 'package:talabi/views/auth/cubit/auth_cubit.dart';
import 'package:talabi/views/prudact_details/logic/cubit/product_deatils_cubit.dart';
import 'package:talabi/views/prudact_details/ui/widgets/comments_list.dart';

class PrudactDetailsPage extends StatefulWidget {
  final ProductModel product;
  const PrudactDetailsPage({super.key, required this.product});

  @override
  State<PrudactDetailsPage> createState() => _PrudactDetailsPageState();
}

class _PrudactDetailsPageState extends State<PrudactDetailsPage> {
  final commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => ProductDeatilsCubit()
        ..getRate(
          productId: widget.product.productId!,
        ),
      child: BlocConsumer<ProductDeatilsCubit, ProductDeatilsState>(
        listener: (context, state) {},
        builder: (context, state) {
          ProductDeatilsCubit deatilsCubit =
              context.read<ProductDeatilsCubit>();
          return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: buildCustomAppBar(
                backGroundColor: Colors.transparent,
                context,
                widget.product.productName ?? 'prodact name',
              ),
              body: state is AddCommentLeading
                  ? CusttomSicrolIndicator()
                  : ListView(
                      children: [
                        CachedNetworkImage(
                          height: size.height * 0.35,
                          fit: BoxFit.cover,
                          imageUrl:
                              widget.product.imageUrl ?? AppConstants.imgNull,
                        ),
                        SizedBox(
                          height: size.height * 0.021,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          child: Form(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.product.category ?? 'category',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: widget.product.price,
                                        children: [
                                          TextSpan(
                                            text: '  MRU',
                                            style: TextStyle(
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.021,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${deatilsCubit.avrageRate}',
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
                                  widget.product.description ?? 'description',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
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
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    debugPrint(rating.toString());
                                  },
                                ),
                                LableWithTextFeild(
                                  controller: commentController,
                                  hintText: 'type your feadback',
                                  sufIcon: IconButton(
                                    onPressed: () async {
                                      if (commentController.text.isNotEmpty) {
                                        await context
                                            .read<AuthCubit>()
                                            .getUserData();
                                        await deatilsCubit.addComment(
                                          data: {
                                            "comment": commentController.text,
                                            "for_user": deatilsCubit.userId,
                                            "for_product":
                                                widget.product.productId,
                                            "user_name": context
                                                .read<AuthCubit>()
                                                .userModel!
                                                .name,
                                          },
                                        );
                                        commentController.clear();
                                      }
                                    },
                                    icon: state is AddCommentLeading
                                        ? CusttomSicrolIndicator()
                                        : Icon(Icons.send),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.021,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Comments',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.012,
                                ),
                                CommentList(
                                  productModel: widget.product,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ));
        },
      ),
    );
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }
}
