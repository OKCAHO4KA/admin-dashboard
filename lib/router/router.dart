import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';
  static String dashboardRoute = '/dashboard';

//AuthRoutes
  static void configureRoute() {
    router.define(loginRoute, handler: AdminHandlers.login);
    // router.define(registerRoute, handler: AdminHandler);
    router.define(rootRoute, handler: AdminHandlers.login);
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }

  //404
}
