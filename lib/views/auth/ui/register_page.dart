import 'package:flutter/material.dart';
import 'package:talabi/core/utils/theme/app_colors.dart';
import 'package:talabi/core/widgets/label_with_text_feild.dart';
import 'package:talabi/core/widgets/main_bottom.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
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
                        'Welcome to Talabi',
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      Column(
                        children: [
                          LableWithTextFeild(
                              hintText: 'Enter youe Name',
                              icon: Icons.person,
                              controller: userNameController,
                              lable: 'User'),
                          LableWithTextFeild(
                              hintText: 'Enter youe email',
                              icon: Icons.email,
                              controller: emailController,
                              lable: 'Email'),
                          LableWithTextFeild(
                            hintText: 'Enter youe password',
                            icon: Icons.lock,
                            controller: passwordController,
                            lable: 'Password',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MainBottom(
                            text: 'Register',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                              } else {}
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an Account ?',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Login',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Countine with google',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {},
                                child: Icon(
                                  Icons.chevron_right_sharp,
                                  color: AppColors.white,
                                  size: 28,
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
  }
}
