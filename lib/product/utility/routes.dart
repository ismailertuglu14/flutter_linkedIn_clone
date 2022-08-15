import 'package:flutter/material.dart';
import 'package:social/feature/register/module/phone_auth.dart';
import 'package:social/feature/register/module/sms_auth.dart';
import '../constants/screens.dart'; // screen imports

class Routes {
  static const String authentication = 'authentication';
  static const String login = 'login';
  static const String register = 'register';
  static const String feed = 'feed';
  static const String phoneAuth = 'phoneAuth';
  static const String smsAuth = 'smsAuth';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authentication:
        return MaterialPageRoute(builder: (context) => const Authentication());
      case login:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case register:
        return MaterialPageRoute(builder: (context) => const RegisterPage());
      case feed:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case phoneAuth:
        return MaterialPageRoute(builder: (context) => const PhoneAuth());
      case smsAuth:
        return MaterialPageRoute(builder: (context) => const SmsAuth());
      default:
        throw ('This route doesn\'t exist');
    }
  }
}
