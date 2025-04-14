import 'package:flutter/material.dart';
import 'package:talabi/core/widgets/label_with_text_feild.dart';
import 'package:talabi/core/widgets/main_bottom.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final forgetPaaswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
              MainBottom(
                text: 'Send',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
