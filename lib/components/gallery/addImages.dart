import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:skiddo_web/components/auth/login/login_dialog.dart';
import 'package:skiddo_web/components/common/spinner.dart';
import 'package:skiddo_web/controllers/auth/login_controller.dart';
import 'package:skiddo_web/controllers/gallery/gallery_controller.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:skiddo_web/helper/navigation.dart';

class AddExtraImages extends ConsumerStatefulWidget {
  String eventId;

  TextStyle termsAndPolicy = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 14.sp,
  );

  bool secureTest = true;
  bool isError = false;
  late DropzoneViewController controller1;

  AddExtraImages({super.key, required this.eventId});
  @override
  ConsumerState<AddExtraImages> createState() => _AddExtraImagesState();
}

class _AddExtraImagesState extends ConsumerState<AddExtraImages> {
  final GlobalKey<FormState> uploadkey = GlobalKey<FormState>();
  final GlobalKey<FormState> uploadEditValue = GlobalKey<FormState>();
  final GlobalKey<FormState> editKey = GlobalKey<FormState>();
  final priceController = TextEditingController();
  final eventNameController = TextEditingController();
  final priceExtraController = TextEditingController();
  final eventNameExtraController = TextEditingController();
  final eventDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(context) {
    return SizedBox(
        height: 250.h,
        width: 465.h,
        child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: uploadEditValue,
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                    height: 70.h,
                    child: TextFormField(
                      onTap: () {
                        // controller.isError.value = false;
                      },
                      controller: priceExtraController,
                      // validator: (value) => controller.emailValidator(value),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            top: 12, bottom: 12, left: 10),
                        helperText: ' ',
                        enabledBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 0.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        focusedBorder: InputBorder.none,
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1)),
                        fillColor: Theme.of(context).colorScheme.onPrimary,
                        filled: true,
                        hintText: 'Price of the each image',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 158, 158, 158),
                        ),
                        errorStyle: const TextStyle(),
                        // errorText: "This Email doesn't have an account",
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontFamily: "verdana_regular",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )),
                SizedBox(
                    height: 80.h,
                    width: 180.h,
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(20),
                      dashPattern: [10, 10],
                      color: Colors.grey,
                      strokeWidth: 2,
                      child: Card(
                          color: Color.fromARGB(255, 218, 216, 212),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Stack(
                            children: [
                              //buildZone2(context),
                              Center(
                                  child: Container(
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width: 100.h,
                                        height: 30.h,
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 218, 216, 212)),
                                            onPressed: () async {
                                              await ref
                                                  .read(
                                                      galleryProvider.notifier)
                                                  .pickimages();
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Drop File(s)",
                                                    style: TextStyle(
                                                      fontSize: 10.h,
                                                      color: Color.fromARGB(
                                                          255, 8, 8, 8),
                                                    )),
                                              ],
                                            ))),
                                    SizedBox(
                                      width: 10.h,
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ))),
                    )),
                Obx(() => SizedBox(
                      child: ref
                                  .read(galleryProvider.notifier)
                                  .numberOffilePicked
                                  .value <
                              1
                          ? Text("No file chosen")
                          : ref
                                      .read(galleryProvider.notifier)
                                      .numberOffilePicked
                                      .value ==
                                  1
                              ? Text(
                                  "${ref.read(galleryProvider.notifier).numberOffilePicked.value} file Chosen")
                              : Text(
                                  "${ref.read(galleryProvider.notifier).numberOffilePicked.value} files Chosen"),
                    )),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                    height: 50.h,
                    width: 200.h,
                    child: ref.watch(galleryProvider).isSpinning == false
                        ? TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary),
                            onPressed: () async {
                              // print("heere re r re er r re re");
                              // if (galleryController.formKey2.currentState!
                              //     .validate()) {
                              //   print("everythingis fine Boss");
                              // }
                              ref
                                  .read(galleryProvider.notifier)
                                  .uploadeventImages(
                                      priceExtraController, widget.eventId);
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.upload,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10.h,
                                ),
                                Text("Add Image",
                                    style: TextStyle(
                                      fontSize: 15.h,
                                      color: Colors.white,
                                    )),
                              ],
                            ))
                        : const SpinnerButton()),
              ],
            )));
  }

  //  Widget buildZone1(BuildContext context) => Builder(
  //       builder: (context) => DropzoneView(
  //         operation: DragOperation.copy,
  //         cursor: CursorType.grab,
  //         onCreated: (ctrl) => controller1 = ctrl,
  //         onLoaded: () => print('Zone 1 loaded'),
  //         onError: (ev) => print('Zone 1 error: $ev'),
  //         onHover: () {
  //           // setState(() => highlighted1 = true);
  //           // print('Zone 1 hovered');
  //         },
  //         onLeave: () {
  //           // setState(() => highlighted1 = false);
  //           // print('Zone 1 left');
  //         },
  //         onDrop: (ev) async {
  //           // print('Zone 1 drop: ${ev.name}');
  //           // setState(() {
  //           //   message1 = '${ev.name} dropped';
  //           //   highlighted1 = false;
  //           // });
  //           // final bytes = await controller1.getFileData(ev);
  //           // print(bytes.sublist(0, 20));
  //         },
  //         onDropInvalid: (ev) => print('Zone 1 invalid MIME: $ev'),
  //         onDropMultiple: (ev) async {
  //           print('Zone 1 drop multiple: $ev');
  //         },
  //       ),
  //     );
}
