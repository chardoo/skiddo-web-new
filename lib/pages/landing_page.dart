import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skiddo_web/components/auth/login/login_dialog.dart';
import 'package:skiddo_web/components/auth/login/registeration_dialog.dart';
import 'package:skiddo_web/components/common/footer.dart';
import 'package:skiddo_web/components/sections/footerSection/footer_section.dart';
import 'package:skiddo_web/components/sections/topSection/top_section.dart';
import 'package:skiddo_web/constants.dart';
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, 
        title: Container(
          margin: EdgeInsets.only(left:  20.h),
          child:  Image.asset("assets/images/Logo.png", scale: 2.2,)),
        actions: [
        InkWell(
            onTap: () {
              showDialog(context: context, builder: (ctx) => signUpWidget());
            },
            child: Container(
              constraints: const BoxConstraints(minWidth: 122),
              height: 100,
              child: const Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 25, color: kTextColor),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(context: context, builder: (ctx) => register());
              // setState(() {

              // });
            },
            child: Container(
              constraints: const BoxConstraints(minWidth: 122),
              height: 100,
              child: const Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    "SignUp",
                    style: TextStyle(fontSize: 25, color: kTextColor),
                  ),
                ],
              ),
            ),
          )
      ],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopSection(),
       
            Footer()
          ],
        ),
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
