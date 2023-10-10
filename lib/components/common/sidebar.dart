import 'dart:ui';

import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:get/get.dart';
import 'package:skiddo_web/controllers/gallery/gallery_controller.dart';
import 'package:skiddo_web/pages/gallery_page.dart';
import 'package:skiddo_web/pages/home_page.dart';
import 'package:skiddo_web/pages/landing_page.dart';
import 'package:skiddo_web/pages/works_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GalleryController>(
        init: GalleryController(),
        builder: (GalleryController galleryController) {
          return Drawer(
            backgroundColor: Color.fromARGB(255, 18, 17, 27),
            // shadowColor: Theme.of(context).primaryColor,
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 44, left: 24, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          IconButton(
                              onPressed: () async {
                                galleryController.toggler.value =
                                    !galleryController.toggler.value;
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_circle_left,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ListTile(
                      contentPadding:
                          const EdgeInsets.only(left: 36, right: 33),
                      title: Text("Dashboard",
                          style: Theme.of(context).textTheme.headline1!),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Dashboard()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.only(
                        left: 36,
                        right: 33,
                      ),
                      title: Text("Gallery",
                          style: Theme.of(context).textTheme.headline1!),
                      onTap: () {
                        // Get.to("/gallery");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GalleryPage()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ListTile(
                      contentPadding:
                          const EdgeInsets.only(left: 36, right: 33),
                      title: Text("Works",
                          style: Theme.of(context).textTheme.headline1!),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WorksPage()),
                        );
                        
                        print("object");
                      },
                    ),
                     SizedBox(
                      height: 20.h,
                    ),
                    ListTile(
                      contentPadding:
                          const EdgeInsets.only(left: 36, right: 33),
                      title: Text("withDrawals",
                          style: Theme.of(context).textTheme.headline1!),
                      onTap: () {
                        print("object");
                      },
                    ),
                  ],
                ),
                const Expanded(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("logOut"),
                )),
                TextButton(
                  onPressed: () async {
                    galleryController.logOut();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => LandingScreen()));
                  },
                  child: Text("LogOut",
                      style: Theme.of(context).textTheme.headline1!),
                )
              ],
            ),
          );
        });
  }
}

class DrawerItem {
  final String title;
  final Function onTap;

  DrawerItem({required this.title, required this.onTap});
}
