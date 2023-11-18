import 'dart:async';



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart' as mypro;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:async';
// import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skiddo_web/components/common/sidebar.dart';
import 'package:skiddo_web/helper/navigation.dart';
import 'package:skiddo_web/pages/home_page.dart';
import 'package:skiddo_web/pages/landing_page.dart';
import 'package:skiddo_web/pages/main_page.dart';
import 'package:skiddo_web/routes/routes.dart';
import 'package:skiddo_web/services/user/user_preference.dart';
import 'package:skiddo_web/theme/DarkThemeProvider.dart';
import 'package:skiddo_web/theme/customThemeData.dart';



main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  // await Firebase.initializeApp();

  Get.put(prefs);
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  var checkIfLoggedIn = false;

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    checkIfloggedIn();
  }

  void getCurrentAppTheme() async {
    await themeChangeProvider.darkThemePreference.setDarkTheme(false);
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  void checkIfloggedIn() async {
    String token = await UserService.getToken();
    if (token.isEmpty) {
      checkIfLoggedIn = false;
    } else {
      checkIfLoggedIn = true;
    }
  }

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return mypro.ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: mypro.Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, child) {
          return
           
           ScreenUtilInit(
        designSize: size,
        builder: (context, _) {
          return ProviderScope(
              child: MaterialApp.router(
            title: 'Picco web',
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            routerConfig: MyNavigator.router,
          ));
        });
             
          //     ScreenUtilInit(
          //   builder: (context, child) => GetMaterialApp(
          //     initialRoute: "/",
          //     navigatorKey: GlobalKey(),
          //     debugShowCheckedModeBanner: false,
          //     theme: Styles.themeData(themeChangeProvider.darkTheme, context),
          //     home: checkIfLoggedIn ==true ? const mainPage(): const LandingScreen(),
          //     getPages: AppPages.appPages
          //   ),


          //   designSize: const Size(390, 844),
          // );
        },
      ),
    );
  }
}
