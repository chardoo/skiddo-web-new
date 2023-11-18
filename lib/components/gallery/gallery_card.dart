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
import 'package:skiddo_web/components/gallery/edit_image_price_form.dart';
import 'package:skiddo_web/controllers/gallery/gallery_controller.dart';
import 'package:skiddo_web/services/Api/gallery/gellery.dart';

class GalleryCard extends ConsumerStatefulWidget {
  String eventName;
  String date;
  String id;
  String eventImage;
  String price;
  GalleryCard(
      {super.key,
      required this.eventImage,
      required this.eventName,
      required this.date,
      required this.price,
      required this.id});

  @override
  ConsumerState<GalleryCard> createState() => _PhotoCardState();
}

class _PhotoCardState extends ConsumerState<GalleryCard> {
  @override
  Widget build(BuildContext context) {
   
          return Card(
                 elevation: 10,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
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
                          imageUrl: widget.eventImage,
                          placeholder: (context, url) {
                            return Image.asset("assets/images/background.png", );
                          },
                        ),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: PopupMenuButton(
                                    icon: Icon(Icons.more_horiz,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem<int>(
                                          value: 0,
                                          child: Text("Edit"),
                                          onTap: () async {
                                            // print("edit price please");
                                            // AlertDialog(
                                            //   title: Text('Edit Photos',
                                            //       textAlign: TextAlign.center,
                                            //       style: Theme.of(context)
                                            //           .textTheme
                                            //           .headline5!),
                                            //   content: EditPrice(),
                                            // );
                                          },
                                        ),
                                        PopupMenuItem<int>(
                                          value: 1,
                                          child: Text("Move"),
                                        ),
                                        PopupMenuItem<int>(
                                          value: 2,
                                          child: Text("Delete"),
                                          onTap: () async {
                                            // galleryController
                                            //     .deleteAnImages(widget.id);
                                          },
                                        ),
                                      ];
                                    },
                                    onSelected: (value) {
                                      if (value == 0) {
                                        showDialog(
                                            context: context,
                                            builder: (ctx) => editPrice(widget.id, widget.price));
                                        print("My edit menu is selected.");
                                      } else if (value == 1) {
                                        // showDialog(
                                        //     context: context,
                                        //     builder: (ctx) => editPrice());
                                        print("Settings menu is selected.");
                                      } else if (value == 2) {
                                        print("My delete menu is selected.");
                                        showDialog(
                                            context: context,
                                            builder: (ctx) => confirmDeletion(
                                                ref.read(galleryProvider.notifier)));
                                      }
                                    })
                          
                          
                          ),

                              Align(
                                   alignment: Alignment.bottomRight,
                                child: 
                             Container(
                              padding: EdgeInsets.all(5),
                                color: Colors.black,
                                height: 40.h,
                                width: 40.h,
                                child: Text('GhC ${widget.price}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 10.h,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary)),
                              ))
                          
                          
                    ],
                  )));
    
  }

  Widget editPrice(String productId, String price) {
    return AlertDialog(
      title: Text('Edit Photos',
          textAlign: TextAlign.center,
          style:  GoogleFonts.imFellEnglish(
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              // letterSpacing: 1,
              fontSize: 35.h,
              color: Color.fromARGB(255, 5, 5, 5)
                  )),
      content: EditPrice(productId: productId, price:price),
    );
  }

  Widget confirmDeletion(GalleryProvider galleryController) {
    return ConfirmDialog(
      header: 'Confirm',
      content: 'This image will be deleted permanently..',
      cancelText: 'Cancel',
      confirmText: 'Ok',
      confirmFunction: () async {
        galleryController.deleteAnImages(widget.id);
      },
    );
  }
}
