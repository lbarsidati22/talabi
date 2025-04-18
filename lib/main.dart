import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talabi/config.dart';
import 'package:talabi/core/utils/app_constants.dart';
import 'package:talabi/core/utils/theme/app_theme.dart';
import 'package:talabi/views/auth/cubit/auth_cubit.dart';
import 'package:talabi/views/auth/ui/login_page.dart';
import 'package:talabi/views/nav_bar/ui/nav_bar.dart';

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
    SupabaseClient client = Supabase.instance.client;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme: AppTheme.mainTheme,
        home: LoginPage(),
        //  client.auth.currentUser != null ? NavBar() :
      ),
    );
  }
}
