import 'package:flutter/material.dart';
import 'package:talabi/core/utils/theme/app_colors.dart';

class SocialLogin extends StatelessWidget {
  final String text;
  final String logo;
  final Color? backColor;
  final VoidCallback? onTap;
  const SocialLogin({
    super.key,
    this.onTap,
    this.backColor,
    required this.text,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: Row(
            children: [
              Image(
                height: size.height * 0.05,
                width: size.width * 0.09,
                image: AssetImage(
                  logo,
                ),
              ),
              SizedBox(
                width: size.width * 0.015,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
