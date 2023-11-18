import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DasboardCard extends StatelessWidget {
  String title;
  int value;
  DasboardCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return 
     Card(elevation: 5, child: 
     
    Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Theme.of(context).primaryColor,
        ),
        height: 80.h,
        width: 250.h,
        child: Expanded(
            child: Container(
          margin: EdgeInsets.all(5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
            fontWeight: FontWeight.w800,
              fontStyle: FontStyle.normal,
              fontSize: 25.h,
              color:Colors.black
                )),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Icon(Icons.graphic_eq, size: 30.h,),
                  Text(
                    value.toString(),
                    style: GoogleFonts.inter(
            fontWeight: FontWeight.w800,
              fontStyle: FontStyle.normal,
              fontSize: 20.h,
              color:Colors.black
              
          ),
                  )
                ],
              )
            ],
          ),
        ))));
  }
}
