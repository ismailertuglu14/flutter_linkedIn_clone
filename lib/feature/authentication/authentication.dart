import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:social/feature/home/home_page.dart';
import 'package:social/product/providers/auth_provider.dart';

import '../login/login_page.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Builder(builder: (context) {
        if (provider.isLogged == true) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      }),
    );
  }
}
