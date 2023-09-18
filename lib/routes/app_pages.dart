import 'package:get/get.dart';
import 'package:googlelogin/src/pages/dashboard_page.dart';
import 'package:googlelogin/src/pages/login_page.dart';
import 'package:googlelogin/src/pages/register_page.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => LoginPage(),
    ),
    GetPage(
      name: '/dashboard',
      page: () => DashboardPage(),
    ),
    GetPage(
      name: '/register',
      page: () => RegisterPage(),
    ),
  ];
}

