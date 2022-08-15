import 'package:flutter/material.dart';
import 'package:social/product/commons/custom_divider.dart';
import 'package:social/feature/login/module/form_state.dart';

import '../../product/commons/appbar.dart';
import '../../product/commons/custom_button.dart';
import '../../product/commons/custom_divider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* Leading && trailing */
                const Appbar(
                  title: 'Join now',
                ),
                FormPage(key: _formKey),
                const CustomDivider(),
                CustomButton(
                  icon: 'assets/icons/google.webp',
                  title: 'Sign in with Google',
                  function: () => print('google'),
                ),
                CustomButton(
                  icon: 'assets/icons/apple.png',
                  title: 'Sign in with Apple',
                  function: () => print('apple'),
                ),
                /* Center(
                  child: GestureDetector(
                    onTap: () => provider.login(),
                    child: const Text('login'),
                  ),
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
