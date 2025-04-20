import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabi/core/widgets/cusstom_appbar.dart';
import 'package:talabi/core/widgets/label_with_text_feild.dart';
import 'package:talabi/core/widgets/main_bottom.dart';
import 'package:talabi/views/auth/cubit/auth_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final forgetPaaswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is PasswordResetSuccess) {
          Navigator.pop(context);
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              message: 'Cheking youe email !!',
            ),
          );
        }
        if (state is PasswordResetError) {
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
          appBar: buildCustomAppBar(context, 'Forget Paasword'),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'Enter your email to rest your password !',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    LableWithTextFeild(
                      hintText: 'Enter your email',
                      icon: Icons.email,
                      controller: forgetPaaswordController,
                      lable: 'Email',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    state is PasswordResetLeading
                        ? MainBottom(
                            isLeading: true,
                            onTap: () {},
                          )
                        : MainBottom(
                            text: 'Send',
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                await BlocProvider.of<AuthCubit>(context)
                                    .resetPassword(
                                        email: forgetPaaswordController.text);
                              }
                            },
                          )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    forgetPaaswordController.dispose();
    super.dispose();
  }
}
