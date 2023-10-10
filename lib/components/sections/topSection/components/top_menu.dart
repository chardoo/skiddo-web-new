import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              showDialog(context: context, builder: (ctx) => signUpWidget());
            },
            child: Container(
              constraints: const BoxConstraints(minWidth: 122),
              height: 100,
              child: Stack(
                alignment: Alignment.center,
                children: const [
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
              child: Stack(
                alignment: Alignment.center,
                children: const [
                  Text(
                    "SignUp",
                    style: TextStyle(fontSize: 25, color: kTextColor),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget signUpWidget() {
    return AlertDialog(
      title: Text(
      'Picco',textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline5!
        
      ),
      content: FirstLoginScreen(),
    );
  }

  Widget register() {
    return AlertDialog(
      title: Text(
        'Picco',textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline5!
            
      ),
      content: Registeration(),
    );
  }
}
