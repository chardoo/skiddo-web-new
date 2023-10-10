
import 'package:get/get.dart';
import 'package:skiddo_web/pages/gallery_page.dart';
import 'package:skiddo_web/pages/home_page.dart';
import 'package:skiddo_web/pages/landing_page.dart';

abstract class Routes {
  static const SPLASH_ROUTE = "/";
}

abstract class AppPages {
  static final List<GetPage> appPages = [
  
    GetPage(
      name: "/home",
      page: () => const Dashboard(),
    ),
    GetPage(
      name: "/gallery",
      page: () => const GalleryPage(),
    ),
   
    GetPage(
      name: "/landing",
      page: () => const LandingScreen(),
    ),
  ];
}
