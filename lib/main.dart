import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/feature/authentication/authentication.dart';
import 'package:social/feature/home/home_page.dart';
import 'package:social/product/constants/constants.dart';
import 'package:social/product/providers/providers.dart';
import 'package:social/product/utility/config.dart';
import 'package:social/product/utility/routes.dart';

import 'product/providers/theme_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.initFirebase();
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers,
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            title: Constants.appName,
            debugShowCheckedModeBanner: false,
            theme: notifier.dark ? Constants.darkTheme : Constants.lightTheme,
            initialRoute: Routes.authentication,
            onGenerateRoute: Routes.generateRoute,
          );
        },
      ),
    );
  }
}
