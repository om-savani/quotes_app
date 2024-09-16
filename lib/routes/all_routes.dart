import 'package:flutter/material.dart';
import 'package:quotes_app/views/detail_page/detail_page.dart';
import 'package:quotes_app/views/home_page/home_page.dart';

import '../views/splashscreen/splash_screen.dart';

class AppRoutes {
  static String splashscreen = "/";
  static String homepage = "homepage";
  static String detailpage = "detailpage";

  static Map<String, Widget Function(BuildContext)> routes = {
    splashscreen: (context) => const SplashScreen(),
    homepage: (context) => const HomePage(),
    detailpage: (context) => const DetailPage(),
  };
}
