import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skiddo_web/components/common/confirmDialog.dart';
import 'package:skiddo_web/controllers/gallery/gallery_controller.dart';
import 'package:skiddo_web/services/Api/gallery/gellery.dart';

class EventCard extends StatefulWidget {
  String eventName;
  String date;
  String id;
  String eventImage;
  EventCard(
      {super.key,
      required this.eventImage,
      required this.eventName,
      required this.date,
      required this.id});

  @override
  State<EventCard> createState() => _GalleryCardState();
}

class _GalleryCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GalleryController>(
        // init: GalleryController(),
        builder: (GalleryController galleryController) {
      return Card(
          color: Color.fromARGB(66, 56, 54, 54),
          elevation: 10,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                color: Color.fromARGB(66, 65, 62, 62),
              ),
              height: 200.h,
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () async {
                        // GalleryController galleryController =  Get.put(GalleryController());
                        galleryController.getEventpicture(
                            widget.id, widget.eventName);
                      },
                      child: SizedBox(
                        width: 280.h,
                        height: 190.h,
                        child: CachedNetworkImage(
                          width: 280.h,
                          height: 190.h,
                          fit: BoxFit.fill,
                          imageUrl: widget.eventImage,
                          placeholder: (context, url) {
                            return Image.asset("assets/images/background.png");
                          },
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 5.h, right: 5.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.eventName,
                                  style: GoogleFonts.imFellEnglish(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.grey,
                                      fontSize: 17.h)),
                              PopupMenuButton(
                                  icon: Icon(Icons.more_horiz,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem<int>(
                                        value: 0,
                                        child: Text("Delete"),
                                        onTap: () async {},
                                      ),
                                    ];
                                  },
                                  onSelected: (value) {
                                    if (value == 0) {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) => confirmDeletion(
                                              galleryController));
                                      print("My account menu is selected.");
                                    } else if (value == 1) {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) => confirmDeletion(
                                              galleryController));
                                      print("Settings menu is selected.");
                                    } else if (value == 2) {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) => confirmDeletion(
                                              galleryController));
                                      print("Logout menu is selected.");
                                    }
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(widget.date.substring(0, 10),
                                  style: GoogleFonts.inter(
                                      // fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white,
                                      fontSize: 12.h)),
                            ],
                          )
                        ],
                      ))
                ],
              )));
    });
  }

  Widget confirmDeletion(GalleryController galleryController) {
    return ConfirmDialog(
      header: 'Confirm!!',
      content: 'All event images will be deleted permanently',
      cancelText: 'Cancel',
      confirmText: 'Delete Event',
      confirmFunction: () async {
        galleryController.deleteFolder(widget.id);
      },
    );
  }

  //   AlertDialog(
  //     title: Text('Confirm!!',
  //         textAlign: TextAlign.center,
  //         style: Theme.of(context).textTheme.headline5!),
  //     content: Text("You are about to Delete this event with alll it images.",
  //         style:  Theme.of(context).textTheme.headline6!),
  //     actions: [
  //       TextButton(
  //           onPressed: () {
  //             Get.back();
  //           },
  //           child: Text("Cancel")),
  //       TextButton(
  //           onPressed: () {
  //             Get.back();
  //             galleryController.deleteFolder(widget.eventName);
  //           },
  //           child: Text("Confirm",
  //               style:
  //                   TextStyle(color: Theme.of(context).colorScheme.secondary)))
  //     ],
  //   );
  // }
}
