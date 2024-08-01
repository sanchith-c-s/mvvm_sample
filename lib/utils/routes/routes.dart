import 'package:flutter/material.dart';
import 'package:mvvm_sample/utils/routes/routes_name.dart';
import 'package:mvvm_sample/view/home_screen.dart';
import 'package:mvvm_sample/view/login_view.dart';

class Routes {
  static Route<dynamic>  generateRoute(RouteSettings settings) {
    //final argument= settings.arguments;
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginView());
      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            body: Center(
              child: Text('No route found'),
            ),
          );
        });
    }
  }
}
