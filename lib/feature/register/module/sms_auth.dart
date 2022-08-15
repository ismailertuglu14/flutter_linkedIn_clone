import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social/product/commons/custom_button.dart';

class SmsAuth extends StatefulWidget {
  const SmsAuth({Key? key}) : super(key: key);

  @override
  State<SmsAuth> createState() => _SmsAuthState();
}

class _SmsAuthState extends State<SmsAuth> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
          child: Form(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Enter the code that was sent to your mobile phone.'),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'To finish registering, please enter the verification code we gave you.'),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                      Text('It might take a few minutes to receive your code'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                  ),
                ),
                const Text('Didn\'t receive the code ?'),
                GestureDetector(
                  onTap: () {
                    print('Resend Code');
                  },
                  child: const Text(
                    'Resend code by SMS',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                CustomButton(
                  title: 'Submit',
                  bgColor: Colors.blue[900],
                  function: () => print('asd'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
