import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../constants/ui_brightness_style.dart';
import 'router.dart';

class ServiceRoute extends ChangeNotifier {
  final UIBrightnessStyle uiBrightnessStyle = UIBrightnessStyle();

  late GlobalKey<NavigatorState> navigatorKey;
  static late AppRouter appRouter;

  ServiceRoute() {
    navigatorKey = GlobalKey<NavigatorState>();
    appRouter = AppRouter();
  }

  void onBackPressed<T extends Object?>([T? result, ChangeNotifier? viewModel]) {
    appRouter.maybePop(result);
  }

  static AppRouter get rootRouter => appRouter;
  static AutoRouterDelegate get routerDelegate => appRouter.delegate();

  Future<T?> startNewView<T>({required PageRouteInfo<dynamic> route, bool isReplace = false, bool clearStack = false}) async {
    if (clearStack) {
      return await appRouter.pushAndPopUntil<T>(route, predicate: (route) => false);
    } else if (isReplace) {
      return await appRouter.replace(route);
    } else {
      return await appRouter.push<T>(route);
    }
  }

  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}