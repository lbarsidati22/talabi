import 'package:flutter/material.dart';
import 'package:talabi/core/utils/theme/app_colors.dart';
import 'package:talabi/core/widgets/navigate_to.dart';
import 'package:talabi/views/home/ui/screens/category_page.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.1,
      child: ListView.separated(
        itemCount: categories.length,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: size.width * 0.07,
          );
        },
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          return InkWell(
            onTap: () {
              navigateTo(
                context,
                CategoryPage(
                  category: category.text,
                ),
              );
            },
            child: Column(
              children: [
                CircleAvatar(
                  radius: size.height * 0.030,
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    category.icon,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  category.text,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

List<Category> categories = [
  Category(icon: Icons.sports, text: 'Sports'),
  Category(icon: Icons.shop, text: 'shop'),
  Category(icon: Icons.precision_manufacturing, text: 'precision'),
  Category(icon: Icons.business, text: 'business'),
  Category(icon: Icons.sports_gymnastics, text: 'Gym'),
  Category(icon: Icons.apple, text: 'Apple'),
];

class Category {
  final IconData icon;
  final String text;

  Category({required this.icon, required this.text});
}
