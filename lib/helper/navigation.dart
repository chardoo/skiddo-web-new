import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skiddo_web/pages/event_photo_pzge.dart';
import 'package:skiddo_web/pages/gallery_page.dart';
import 'package:skiddo_web/pages/home_page.dart';
import 'package:skiddo_web/pages/landing_page.dart';
import 'package:skiddo_web/pages/main_page.dart';
import 'package:skiddo_web/pages/redirect_screen.dart';
import 'package:skiddo_web/pages/sample.dart';
import 'package:skiddo_web/pages/works_page.dart';
import 'package:skiddo_web/services/user/user_preference.dart';

class MyNavigator {
  static const home = "/";
  static const logIn = "/logged-in";
  static const event = "/events";
  static const myworks = "/my-works";
  static const gallery = "/gallery";
  static const redirect = "/redirect";
  static const inventory = "/inventory";
  static const brands = "/brands";
  static const suppliers = "/suppliers";
  static const purchases = "/purchases";
  static const addPurchase = "/addPurchase";

  static GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      route(
        home,
        const MainPage(),
      ),
      // route(
      //   event,
      //   const EventGallery(),
      // ),
      route(
        myworks,
        const WorksPage(),
      ),
      route(
        gallery,
        const GalleryPage(),
      ),
      route(
        logIn,
         LandingScreen(),
      ),
      // GoRoute(
      //   path: 'event/:eventName/:eventId',
      //   builder: (BuildContext context, GoRouterState state) {
      //     final eventName = state.pathParameters['eventName']!;
      //     final eventId = state.pathParameters['eventId'];
      //     return EventGallery(
      //       eventName: eventName,
      //       eventId: eventId!,
      //     );
      //   },
      // ),
    ],
    redirect: (context, state) async {
      final user = await UserService.getLogin();
      if (user) {
        return null;
      }
      return logIn;
    },
    errorBuilder: (context, state) {
      return RedirectScreen(text: "Page not found ${state.error}");
    },
  );

  static GoRoute route(String path, Widget screen) {
    return GoRoute(
      path: path,
      pageBuilder: (context, state) => CustomTransitionPage(
          child: screen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          }),
    );
  }

  static goto<T>(
    String path,
  ) {
    return router.push(
      path,
    );
  }

  static goToScreen(BuildContext context, Widget screen) {
    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
  }

  static GoToGallery(BuildContext context, String eventName, String eventId) {
    context.go('/event/$eventName/$eventId');
  }

  static back(BuildContext context) {
    return context.pop();
  }

  static pushAndReplace(String path) {
    router.pushReplacement(path);
  }

  static logOut(String path) {
    router.go(path);
  }

  static popAndPush(BuildContext context, String path) {
    return Navigator.popAndPushNamed(context, path);
  }

  static backTo(String path, BuildContext context) {
    while (router
            .routerDelegate.currentConfiguration.matches.last.matchedLocation !=
        path) {
      if (!context.canPop()) {
        return;
      }
      context.pop();
    }
  }
}
