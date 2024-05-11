import 'package:flutter/material.dart';
import 'package:shein_app/login.dart';
import 'package:shein_app/welcome.dart';

class LoginRoutes {
  static const String welcome = 'welcomeScreen';
  static const String signInView = 'signIn';
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class LoginNavigator extends StatelessWidget {
  const LoginNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: LoginRoutes.welcome,
      onGenerateRoute: (RouteSettings settings) {
        late WidgetBuilder builder;
        switch (settings.name) {
          case LoginRoutes.welcome:
            builder = (BuildContext _) =>const WelcomeScreen();
            break;
          case LoginRoutes.signInView:
            builder = (BuildContext _) =>const Login();
            break;
  
          default:
            throw Exception('Invalid route: ${settings.name}');
        }

        return MaterialPageRoute(
          builder: builder,
          settings: settings,
        );
      },
      onPopPage: (Route<dynamic> route, dynamic result) {
        return route.didPop(result);
      },
    );
  }
}
