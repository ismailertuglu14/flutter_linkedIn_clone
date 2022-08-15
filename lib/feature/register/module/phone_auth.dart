import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:social/product/commons/custom_button.dart';
import 'package:social/product/utility/routes.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 36.0, horizontal: 14),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text('Just a quick security check'),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: RichText(
                    text: const TextSpan(
                        text:
                            'As an extra security step, we\'ll need to give you a verification code to register.',
                        children: [
                          TextSpan(
                            text: ' Learn more',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ]),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10),
                    child: Text('Select country'),
                  ),
                ),
                IntlPhoneField(
                  initialCountryCode: 'TR',
                  onChanged: (phone) {
                    if (kDebugMode) {
                      print(phone.completeNumber);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: CustomButton(
            title: 'Submit',
            bgColor: Colors.blue[900],
            function: submit,
          ),
        ),
      ),
    );
  }

  submit() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      Navigator.of(context).pushNamed(Routes.smsAuth);
    }
  }
}
