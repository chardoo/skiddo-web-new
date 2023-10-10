import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skiddo_web/constants.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  _Footer createState() => _Footer();
}

class _Footer extends State<FooterSection> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2.5),
      //constraints: const BoxConstraints(maxWidth: 1110),
      height: 100.h,
       width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
         color: Colors.white,
        // borderRadius: const BorderRadius.only(
        //   bottomRight: Radius.circular(10),
        //   topRight: Radius.circular(10),
        // ),
        boxShadow: [kDefaultShadow],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children:[
          
      
      
      ],
      ),
    );
  }

  
}
