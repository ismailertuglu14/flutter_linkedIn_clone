import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:social/feature/register/provider/register_provider.dart';
import 'package:social/product/providers/auth_provider.dart';
import 'package:social/product/providers/theme_notifier.dart';

class Providers {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ThemeNotifier()),
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => RegisterProvider()),
  ];
}
