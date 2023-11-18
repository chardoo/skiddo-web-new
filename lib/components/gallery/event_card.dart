import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skiddo_web/components/common/confirmDialog.dart';
import 'package:skiddo_web/controllers/gallery/gallery_controller.dart';
import 'package:skiddo_web/pages/event_photo_pzge.dart';
import 'package:skiddo_web/services/Api/gallery/gellery.dart';

class EventCard extends ConsumerStatefulWidget {
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
  ConsumerState<EventCard> createState() => _GalleryCardState();
}

class _GalleryCardState extends ConsumerState<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color.fromARGB(66, 56, 54, 54),
        elevation: 10,
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Color.fromARGB(66, 65, 62, 62),
            ),
            height: 200.h,
            child: Column(
              children: [
                GestureDetector(
                    onTap: () async {
                      // GalleryController galleryController =  Get.put(GalleryController());
                      var result = await ref
                          .read(galleryProvider.notifier)
                          .getEventpicture(widget.id, widget.eventName);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return EventGallery(
                                eventId: result["eventId"],
                                eventName: result["eventName"]);
                          },
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 270.h,
                      height: 190.h,
                      child: CachedNetworkImage(
                        width: 270.h,
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
                                      child: const Text("Delete"),
                                      onTap: () async {},
                                    ),
                                  ];
                                },
                                onSelected: (value) {
                                  if (value == 0) {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) => confirmDeletion(ref
                                            .read(galleryProvider.notifier)));
                                  } else if (value == 1) {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) => confirmDeletion(ref
                                            .read(galleryProvider.notifier)));
                                  } else if (value == 2) {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) => confirmDeletion(ref
                                            .read(galleryProvider.notifier)));
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
  }

  Widget confirmDeletion(GalleryProvider galleryController) {
    return ConfirmDialog(
      header: 'Confirm!!',
      content: 'All event images will be deleted permanently',
      cancelText: 'Cancel',
      confirmText: 'Delete Event',
      confirmFunction: () async {
        galleryController.deleteFolder(widget.eventName, widget.id);
      },
    );
  }

 
}
