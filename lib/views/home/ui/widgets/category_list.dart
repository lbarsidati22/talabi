import 'package:flutter/material.dart';
import 'package:talabi/core/utils/theme/app_colors.dart';

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
          return Column(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  category.icon,
                  color: AppColors.white,
                ),
              ),
              Text(
                category.text,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
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
