import 'package:flutter/material.dart';
import 'package:talabi/core/utils/theme/app_colors.dart';

class CusttomSicrolIndicator extends StatelessWidget {
  const CusttomSicrolIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
