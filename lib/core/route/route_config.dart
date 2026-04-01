part of 'route_import_part.dart';

class AppRouter {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteName.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.bottomNavRoute:
        return MaterialPageRoute(builder: (_) => const BottomNavBarScreen());
      // case RouteName.loginRoute:
      //   return MaterialPageRoute(builder: (_) => const SignInScreen());
      // case RouteName.registerRoute:
      //   return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text(AppString.noRoute)),
        body: Center(child: Text(AppString.noRoute)),
      ),
    );
  }
}
