import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../ui/views/home/view_home.dart';
import '../../ui/views/login/view_login.dart';
import '../../ui/views/splash/view_splash.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: ViewSplash.page, path: '/splash', initial: true),
    CustomRoute(page: ViewLogin.page, path: '/login', transitionsBuilder: TransitionsBuilders.fadeIn, durationInMilliseconds: 300),
    CustomRoute(page: ViewHome.page, path: '/home', transitionsBuilder: TransitionsBuilders.fadeIn, durationInMilliseconds: 300),
    RedirectRoute(path: '*', redirectTo: '/splash'),
  ];
}

class RooterObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    // log('didPush: ${route.isActive.toString()}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    // log('didPop: ${route.isActive.toString()} ${previousRoute!.isActive.toString()}');
  }
}
