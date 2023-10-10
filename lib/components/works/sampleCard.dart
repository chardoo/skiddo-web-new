import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:skiddo_web/components/common/confirmDialog.dart';
import 'package:skiddo_web/controllers/gallery/gallery_controller.dart';
import 'package:skiddo_web/controllers/works/work_controller.dart';
import 'package:skiddo_web/services/Api/gallery/gellery.dart';

class SampleCard extends StatefulWidget {
  String imageId;
  String url;
  String id;
  SampleCard(
      {super.key, required this.imageId, required this.url, required this.id});

  @override
  State<SampleCard> createState() => _GalleryCardState();
}

class _GalleryCardState extends State<SampleCard> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkController>(
        // init: GalleryController(),
        builder: (WorkController workController) {
      return Card(
           elevation: 10,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                color: Theme.of(context).primaryColor,
              ),
              child: Stack(
                children: [
                  SizedBox(
                    width: 300.h,
                    height: 280.h,
                    child: CachedNetworkImage(
                           width: 300.h,
                           height: 280.h,
                           fit: BoxFit.fill,
                      fadeInCurve: Curves.bounceInOut,
                  
                      imageUrl: widget.url,
                      placeholder: (context, url) {
                        return Image.asset("assets/images/background.png");
                      },
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: 
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
                                            onTap: () async {
                                              // print("printitnghienrierier");

                                              //  AlertDialog(
                                              //       title: Text('Confirm Deletion!!!',
                                              //           textAlign: TextAlign.center,
                                              //           style: Theme.of(context)
                                              //               .textTheme
                                              //               .headline5!),
                                              //       content: confirmDeletion(galleryController),
                                              //     );
                                              // // showDialog(
                                              // //     context: context,
                                              // //     builder: (ctx) => confirmDeletion(
                                              // //         galleryController));
                                            },
                                          ),
                                        ];
                                      },
                                      onSelected: (value) {
                                        if (value == 0) {
                                          showDialog(
                                              context: context,
                                              builder: (ctx) => confirmDeletion(
                                                  workController));
                                          print("My account menu is selected.");
                                        } else if (value == 1) {
                                          // showDialog(
                                          //     context: context,
                                          //     builder: (ctx) => confirmDeletion(
                                          //         workController));
                                          // print("Settings menu is selected.");
                                        } else if (value == 2) {
                                          // showDialog(
                                          //     context: context,
                                          //     builder: (ctx) => confirmDeletion(
                                          //         workController));
                                          // print("Logout menu is selected.");
                                        }
                                      }),
                                
                  )
                          
                ],
              )));
    });
  }

  Widget confirmDeletion(WorkController workController) {
    return ConfirmDialog(
      header: 'Confirm!!',
      content: 'You are about to delete this sample image',
      cancelText: 'Cancel',
      confirmText: 'Delete Event',
      confirmFunction: () async {
        workController.deleteSampleImage(widget.id);
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
