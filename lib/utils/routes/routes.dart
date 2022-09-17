import 'package:flutter/material.dart';
import 'package:lend_books/utils/routes/routes_name.dart';
import 'package:lend_books/view/pages/home.dart';
import 'package:lend_books/view/pages/loginPage.dart';
import 'package:lend_books/view/pages/signUpPage.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginPage());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => SingUpPage());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }
}