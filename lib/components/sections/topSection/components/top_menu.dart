import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skiddo_web/components/auth/login/login_dialog.dart';
import 'package:skiddo_web/components/auth/login/registeration_dialog.dart';
import 'package:skiddo_web/constants.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2.5),
      constraints: const BoxConstraints(maxWidth: 1110),
      height: 10.sp,
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [kDefaultShadow],
      ),
      child: Row(
        mainAxisAlignment: MediaQuery.of(context).size.width < 400.h?MainAxisAlignment.start: MainAxisAlignment.end,
        children: [
          
        ],
      ),
    );
  }

  Widget signUpWidget() {
    return AlertDialog(
      title: Text(
      'Picco',textAlign: TextAlign.center,
        style: GoogleFonts.imFellEnglish(
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              // letterSpacing: 1,
              fontSize: 35.h,
              color:Colors.black)
      ),
      content: FirstLoginScreen(),
    );
  }

  Widget register() {
    return AlertDialog(
      title: Text(
        'Picco',textAlign: TextAlign.center,
        style:  GoogleFonts.imFellEnglish(
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              // letterSpacing: 1,
              fontSize: 35.h,
              color:Colors.black)
      ),
      content: Registeration(),
    );
  }
}
