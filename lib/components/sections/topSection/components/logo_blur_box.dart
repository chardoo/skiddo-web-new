import 'package:flutter/material.dart';
import 'package:skiddo_web/components/sections/topSection/components/glass_content.dart';
import 'package:skiddo_web/components/sections/topSection/components/top_menu.dart';



class LogoAndBlurBox extends StatelessWidget {
  const LogoAndBlurBox({
    required this.size,
  }) ;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
  
        
        

        GlassContent(size: size),
  
      ],
    );
  }
}
