import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:social/feature/register/module/formpage_1.dart';
import 'package:social/feature/register/module/formpage_2.dart';
import 'package:social/feature/register/provider/register_provider.dart';
import 'package:social/product/utility/routes.dart';

import '../../product/commons/appbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterProvider>(context);
    final mylist = [
      FormPage1(),
      FormPage2(),
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Appbar(),
            const Text(
              'Join LinkedIn',
              style: TextStyle(fontSize: 26),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(Routes.login),
                child: RichText(
                  text: const TextSpan(text: 'or', children: [
                    TextSpan(
                      text: ' sign in',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ]),
                ),
              ),
            ),
            Expanded(
                child: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                mylist[provider.page],
              ],
            )),
          ],
        ),
      ),
    );
  }
}
