import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:social/product/providers/auth_provider.dart';
import 'package:social/product/providers/theme_notifier.dart';
import 'package:social/service/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeNotifier>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => provider.toggleTheme(),
              child: Text('Theme change'),
            ),
            GestureDetector(
              onTap: () => AuthService().logOut(provider: authProvider),
              child: Text('Signout'),
            )
          ],
        ),
      ),
    );
  }
}
