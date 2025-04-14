import 'package:flutter/material.dart';
import 'package:talabi/core/utils/theme/app_colors.dart';

class MainBottom extends StatelessWidget {
  final double height;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final String? text;
  final bool isLeading;
  MainBottom({
    super.key,
    this.isLeading = false,
    this.height = 55,
    this.onTap,
    this.backgroundColor = AppColors.primaryColor,
    this.text,
  }) {
    assert(text != null || isLeading == true);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: onTap,
        child: isLeading
            ? Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Text(
                text!,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
      ),
    );
  }
}
