import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:social/product/utility/routes.dart';

import '../../../product/commons/custom_button.dart';
import '../../../product/utility/validation.dart';
import '../provider/register_provider.dart';

class FormPage2 extends StatefulWidget {
  const FormPage2({Key? key}) : super(key: key);

  @override
  State<FormPage2> createState() => _FormPage2State();
}

class _FormPage2State extends State<FormPage2> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
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
              onChanged: (value) => firstName = value,
              validator: (value) => Validations.validateName(value!),
              decoration: const InputDecoration(hintText: 'First name*'),
            ),
            TextFormField(
              onChanged: (value) => lastName = value,
              validator: (value) => Validations.validateName(value!),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'Last name*'),
            ),
            CustomButton(
                title: 'Agree & Join',
                bgColor: Colors.blue[900],
                function: () => nameContinue(provider)),
          ],
        ));
  }

  void nameContinue(RegisterProvider provider) {
    final form = _globalKey.currentState!;

    if (form.validate()) {
      Navigator.of(context).pushNamed(Routes.phoneAuth);
    }
  }
}
