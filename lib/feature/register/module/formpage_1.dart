import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:social/feature/register/provider/register_provider.dart';
import 'package:social/product/commons/custom_button.dart';

import '../../../product/utility/validation.dart';

class FormPage1 extends StatefulWidget {
  const FormPage1({Key? key}) : super(key: key);

  @override
  State<FormPage1> createState() => _FormPage1State();
}

class _FormPage1State extends State<FormPage1> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool showPasswordState = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterProvider>(context);

    return Form(
        key: _globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onChanged: (value) => email = value,
              validator: (value) => Validations.validateEmail(value!),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'Email or Phone*'),
            ),
            showPasswordState == true
                ? TextFormField(
                    onChanged: (value) => password = value,
                    validator: (value) => Validations.validatePassword(value!),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: 'Password*'),
                  )
                : const SizedBox(),
            CustomButton(
                title: 'Continue',
                bgColor: Colors.blue[900],
                function: () => emailContinue(provider)),
          ],
        ));
  }

  void emailContinue(RegisterProvider provider) {
    final form = _globalKey.currentState!;

    if (Validations.validateEmail(email) == null) {
      showPasswordState = true;
      setState(() {});
      print('asd');
    }
    if (Validations.validatePassword(password) == null && form.validate()) {
      print('validated');
      provider.page = 1;
    }
    /* if (form.validate()) {
    
    } */
  }
}
