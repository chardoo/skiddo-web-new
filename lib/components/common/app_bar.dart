import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skiddo_web/theme/DarkThemeProvider.dart';

Widget appBarCustom(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(fontSize: 30, color: Colors.red),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (kIsWeb)
          SizedBox(
            width: 20,
          ),
        TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary),
            onPressed: () async {},
            child: Text("Cash Out",
                style: TextStyle(
                  fontSize: 10.h,
                  color: Colors.white,
                ))),
        SizedBox(
          width: 20,
        ),
        SizedBox(
          height: 30,
          width: 30,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.network(
                "https://images.unsplash.com/photo-1523285367489-d38aec03b6bd"),
          ),
        )
      ],
    ),
  );
}
