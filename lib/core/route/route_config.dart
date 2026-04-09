part of 'route_import_part.dart';

class AppRouter {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteName.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.bottomNavRoute:
        return MaterialPageRoute(builder: (_) => const BottomNavBarScreen());
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteName.breathingPractiveScreen:
        return MaterialPageRoute(
          builder: (_) => const BreathingPractiveScreen(),
        );
      case RouteName.inhaleHoldExhaleScreen:
        return MaterialPageRoute(
          builder: (_) => const InhaleHoldExhaleScreen(),
        );
      case RouteName.progressScreen:
        return MaterialPageRoute(builder: (_) => const ProgressScreen());
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
