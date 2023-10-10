import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  static MaterialColor white = const MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      primarySwatch: white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: isDarkTheme ? const Color(0xFF1C1C1E) : Colors.white,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      primaryColor: isDarkTheme ? const Color(0xFF121212) : Colors.white,
      backgroundColor:
          isDarkTheme ? Colors.black : const Color.fromARGB(255, 210, 215, 223),
      indicatorColor: isDarkTheme
          ? const Color(0xff0E1D36)
          : const Color.fromARGB(255, 195, 197, 201),
      hintColor: isDarkTheme
          ? const Color(0xff280C0B)
          : const Color.fromARGB(255, 255, 255, 255),
      colorScheme: ColorScheme(
          brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          primary: isDarkTheme
              ? const Color.fromARGB(255, 255, 255, 255)
              : const Color.fromARGB(255, 0, 0, 0),
          secondaryContainer:
              isDarkTheme ? const Color(0xFF2B2929) : Colors.white,

          //opposite of  primary
          onPrimary: isDarkTheme
              ? const Color.fromARGB(255, 0, 0, 0)
              : const Color.fromARGB(255, 255, 255, 255),
          onSecondary: isDarkTheme
              ? const Color.fromARGB(255, 255, 255, 255)
              : const Color.fromARGB(255, 0, 0, 0),
          secondary: Color.fromARGB(255, 232, 76, 14),
          error: isDarkTheme
              ? const Color.fromARGB(255, 255, 255, 255)
              : const Color.fromARGB(255, 0, 0, 0),
          onError: isDarkTheme
              ? const Color.fromARGB(255, 255, 255, 255)
              : const Color.fromARGB(255, 0, 0, 0),
          surface: isDarkTheme
              ? const Color.fromARGB(255, 255, 255, 255)
              : const Color.fromARGB(255, 0, 0, 0),
          background: isDarkTheme
              ? const Color.fromARGB(255, 255, 255, 255)
              : const Color.fromARGB(255, 0, 0, 0),
          onBackground: isDarkTheme
              ? const Color.fromARGB(255, 255, 255, 255)
              : const Color.fromARGB(255, 0, 0, 0),
          onSurface: isDarkTheme
              ? const Color.fromARGB(255, 255, 255, 255)
              : const Color.fromARGB(255, 0, 0, 0),
          // filter container style
          onTertiaryContainer: isDarkTheme
              ? const Color.fromARGB(221, 43, 42, 42)
              : Colors.white),
      dialogTheme: DialogTheme(
        backgroundColor: isDarkTheme ? Color.fromARGB(255, 55, 55, 205) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textTheme: TextTheme(
          headline6:  GoogleFonts.imFellEnglish(
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              color: isDarkTheme
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : const Color.fromARGB(255, 255, 255, 255),
              fontSize: 17.h),
          // googel loginButton

          headline4: TextStyle(
              color: isDarkTheme
                  ? const Color.fromARGB(255, 0, 0, 0)
                  : const  Color.fromARGB(255, 255, 255, 255),
              fontSize: 16.sp),
          headline5: GoogleFonts.imFellEnglish(
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              // letterSpacing: 1,
              fontSize: 35.h,
              color: isDarkTheme
                  ? const Color.fromARGB(255, 255, 255, 255)
                  :  Colors.white),
          //card details theme
          headline3: GoogleFonts.inter(
            fontWeight: FontWeight.w800,
              fontStyle: FontStyle.normal,
              fontSize: 27.h,
              color: isDarkTheme
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : const Color.fromARGB(255, 255, 255, 255),
          ),
          
          headline2: GoogleFonts.imFellEnglish(
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 15.h,
              color: isDarkTheme
                 ? const Color.fromARGB(255, 255, 255, 255)
                  : const Color.fromARGB(255, 255, 255, 255)),
          headline1: GoogleFonts.imFellEnglish(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 24.h,
              color: isDarkTheme
                  ? const Color.fromARGB(255, 0, 0, 0)
                  : const Color.fromARGB(255, 255, 255, 255))),
      focusColor:
          isDarkTheme ? const Color(0xff0B2512) : const Color(0xFF09EB45),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor:
            isDarkTheme ? const Color(0xE5E5E7) : Colors.grey[50],
      ),
      scaffoldBackgroundColor:
          isDarkTheme ? Colors.black : Color(0xFFBFBFC3),
    );
  }
}
