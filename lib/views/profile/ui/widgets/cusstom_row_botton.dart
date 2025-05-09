import 'package:flutter/material.dart';
import 'package:talabi/core/utils/theme/app_colors.dart';

// ignore: must_be_immutable
class CustomRowBtn extends StatelessWidget {
  CustomRowBtn({
    super.key,
    this.onTap,
    required this.icon,
    this.text,
    this.isLeading = false,
  });

  final void Function()? onTap;
  final IconData icon;
  final String? text;
  bool isLeading;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: AppColors.white,
              ),
              isLeading
                  ? Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : Text(
                      text!,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
