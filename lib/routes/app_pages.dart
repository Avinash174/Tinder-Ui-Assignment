import 'package:get/get.dart';
import 'package:tinder_ui_demo/view/home_view.dart';
import 'package:tinder_ui_demo/view/login_view.dart';
import 'package:tinder_ui_demo/view/welcome_view.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.WELCOME,
      page: () => const WelcomeView(),
    
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () =>  LoginView(),
      
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
    
    ),
  ];
}
