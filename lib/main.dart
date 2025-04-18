import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talabi/config.dart';
import 'package:talabi/core/utils/theme/app_theme.dart';
import 'package:talabi/views/auth/ui/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: Config.supabaseUrl,
    anonKey: Config.supabaseAnonKey,
  );
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
