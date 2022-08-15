import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/product/commons/custom_button.dart';
import 'package:social/product/providers/auth_provider.dart';
import 'package:social/product/providers/theme_notifier.dart';
import 'package:social/product/utility/routes.dart';
import 'package:social/product/utility/validation.dart';
import 'package:social/service/auth_service.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _rememberMe = true;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeNotifier>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return Form(
      key: _globalKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () => print(authProvider.isLogged),
              child: Text('ASDASD')),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Sign in',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            onChanged: (value) => email = value,
            validator: (value) => Validations.validateEmail(value!),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'Email or Phone'),
          ),
          TextFormField(
            onChanged: (value) => password = value,
            validator: (value) => Validations.validatePassword(value!),
            obscureText: _isObscure,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: _isObscure == true
                  ? GestureDetector(
                      onTap: changeObscure,
                      child: const Icon(Icons.remove_red_eye))
                  : GestureDetector(
                      onTap: changeObscure,
                      child: const Icon(Icons.remove_red_eye_outlined)),
            ),
          ),
          Row(
            children: [
              Checkbox(
                  value: _rememberMe,
                  onChanged: (_) {
                    _rememberMe = !_rememberMe;
                    setState(() {});
                  }),
              Text('Remember me.'),
              Text(' Learn More'),
            ],
          ),
          const Text(
            'Forgot password?',
          ),
          CustomButton(
            title: 'Continue',
            bgColor: Colors.blue[900],
            textColor: Colors.white,
            function: () => submit(authProvider),
          ),
          GestureDetector(
            onTap: () => provider.toggleTheme(),
            child: const Text('Theme Change (demo)'),
          )
        ],
      ),
    );
  }

  changeObscure() {
    _isObscure = !_isObscure;
    setState(() {});
  }

  void submit(AuthProvider provider) {
    final form = _globalKey.currentState!;
    if (form.validate()) {
      /* Login Method */
      AuthService()
          .login(email: email, password: password)
          .then((_) => provider.login());
      if (kDebugMode) {
        print('Form valid email = $email , password = $password');
      }
    }
  }
}
