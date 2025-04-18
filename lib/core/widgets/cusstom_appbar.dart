import 'package:flutter/material.dart';
import 'package:talabi/core/utils/theme/app_colors.dart';

AppBar buildCustomAppBar(BuildContext context, String title,
    {Color? backGroundColor}) {
  return AppBar(
    backgroundColor: backGroundColor,
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(color: AppColors.black),
    ),
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: AppColors.black,
      ),
    ),
  );
}
