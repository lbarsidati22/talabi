import 'package:flutter/material.dart';
import 'package:talabi/core/utils/theme/app_colors.dart';
import 'package:talabi/core/widgets/main_bottom.dart';

class PrudactItem extends StatelessWidget {
  const PrudactItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Card(
      color: AppColors.grey2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image(
                  height: size.height * 0.25,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
              Positioned(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '10% OFF',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                  ),
                ),
              ),
              // CachedNetworkImage(
              //   imageUrl: article.urlToImage ??
              //       'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
              //   fit: BoxFit.cover,
              //   width: 1000.0,
              //   height: 280,
              // ),
            ],
          ),
          SizedBox(
            height: size.height * 0.002,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Prudact tree',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: AppColors.primaryColor,
                        size: 32,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '150 MRU',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          '190 MRU',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    MainBottom(
                      height: size.height * 0.061,
                      width: 100,
                      text: 'Buy',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
