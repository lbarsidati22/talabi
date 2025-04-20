import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabi/core/utils/theme/app_colors.dart';
import 'package:talabi/core/widgets/custtom_curcilar_indicator.dart';
import 'package:talabi/core/widgets/label_with_text_feild.dart';
import 'package:talabi/core/widgets/main_bottom.dart';
import 'package:talabi/core/widgets/social_login.dart';
import 'package:talabi/views/auth/cubit/auth_cubit.dart';
import 'package:talabi/views/auth/ui/forget_Password_page.dart';
import 'package:talabi/views/auth/ui/register_page.dart';
import 'package:talabi/views/nav_bar/ui/nav_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isSecure = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NavBar(),
            ),
          );
        }
        if (state is LoginError) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              message: state.message,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 30),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          Text(
                            'Welcome Back !',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          Column(
                            children: [
                              LableWithTextFeild(
                                  hintText: 'Enter youe email',
                                  icon: Icons.email,
                                  controller: emailController,
                                  lable: 'Email'),
                              LableWithTextFeild(
                                hintText: 'Enter youe password',
                                icon: Icons.lock,
                                isSecured: isSecure,
                                controller: passwordController,
                                lable: 'Password',
                                // keyType: TextInputType.number,
                                sufIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isSecure = !isSecure;
                                    });
                                  },
                                  icon: Icon(
                                    isSecure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              state is LoginLeading
                                  ? MainBottom(
                                      isLeading: true,
                                      onTap: () {},
                                    )
                                  : MainBottom(
                                      text: 'Login',
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          authCubit.login(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);
                                        }
                                      },
                                    ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ForgetPasswordPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Forget Password',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primaryColor,
                                        ),
                                  ),
                                ),
                              ),
                              Text(
                                '----------------------- OR ----------------------',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(
                                height: size.height * 0.021,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SocialLogin(
                                    onTap: () {},
                                    logo: 'assets/images/facebooklogo.png',
                                    text: 'Facebook',
                                    backColor: AppColors.faceBook,
                                  ),
                                  // SizedBox(
                                  //   width: size.width * 0.03,
                                  // ),
                                  SocialLogin(
                                    onTap: () {},
                                    logo: 'assets/images/googlelogo.png',
                                    text: 'Google',
                                    backColor: AppColors.google,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.021,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t have an Account ?',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RegisterPage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Register',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primaryColor,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
