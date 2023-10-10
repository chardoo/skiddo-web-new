
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
class SideNav extends StatelessWidget {
  const SideNav({super.key});

  @override
  Widget build(BuildContext context) {
   return Container(
      child: Expanded(
        child: Container(
          width: 20,
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: Color(0xff404040),
          child: Column(
            children: <Widget>[
              SizedBox(height: 70),
              Image.asset('assets/images/logo.png'),
              Text(
                'Build beautiful Apps',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}