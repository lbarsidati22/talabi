import 'package:flutter/material.dart';
import 'package:talabi/core/utils/theme/app_theme.dart';
import 'package:talabi/views/auth/ui/login_page.dart';

void main() {
  runApp(const Talabi());
}

class Talabi extends StatelessWidget {
  const Talabi({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Talabi',
      theme: AppTheme.mainTheme,
      home: const LoginPage(),
    );
  }
}
