import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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

class UploadImageForm extends StatelessWidget {
  final GalleryController galleryController =
      Get.put(GalleryController(), tag: "fkkddfkfsndsdknds");
  // final ValueSetter<String> onSignIn;
  TextStyle termsAndPolicy = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 14.sp,
  );

  bool secureTest = true;
  bool isError = false;
  UploadImageForm({super.key});
  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(context) {
    return SizedBox(
        height: 300.h,
        width: 400.h,
        child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: galleryController.uploadkey,
            child: Column(
              children: [
                Container(
                    height: 70.h,
                    child: TextFormField(
                      onTap: () {
                        // controller.isError.value = false;
                      },
                      controller: galleryController.eventNameController,
                      // validator: (value) => controller.contactValidator(value),
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
                        hintText: 'Event name',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 158, 158, 158),
                        ),
                        errorStyle: const TextStyle(),
                        // errorText: "Sorry you can't use this name",
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontFamily: "verdana_regular",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    height: 70.h,
                    child: TextFormField(
                      onTap: () async {
                        // controller.isError.value = false;
                        DateTime date = DateTime(1900);
                        FocusScope.of(context).requestFocus(new FocusNode());

                        date = (await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100)))!;
                        print("hello ho are you doing");
                        print(date);
                        print(date.toIso8601String());

                      galleryController.eventDateController.text =   date.toString();
                     
                      },
                      // controller: galleryController.eventNameController,
                      //validator: (value) => controller.contactValidator(value),
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
                        hintText: 'Date of Event',
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
                const SizedBox(
                  height: 4,
                ),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                          width: 100.h,
                          height: 30.h,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.grey),
                              onPressed: () async {
                                await galleryController.pickFileforevent();
                              },
                              child: Row(
                                children: [
                                  Text("Choose File(s)",
                                      style: TextStyle(
                                        fontSize: 10.h,
                                        color: Colors.white,
                                      )),
                                ],
                              ))),
                      SizedBox(
                        width: 10.h,
                      ),
                      Obx(() => SizedBox(
                            child: galleryController.numberOffilePicked.value <
                                    1
                                ? Text("No file chosen")
                                : galleryController.numberOffilePicked.value ==
                                        1
                                    ? Text(
                                        "${galleryController.numberOffilePicked.value} file Chosen")
                                    : Text(
                                        "${galleryController.numberOffilePicked.value} files Chosen"),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 55.h,
                ),
                Obx(
                  () => SizedBox(
                      height: 50.h,
                      width: 200.h,
                      child: galleryController.uploadimagesspinner.value ==
                              false
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
                                galleryController.createEvent();
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
                                  Text("Upload",
                                      style: TextStyle(
                                        fontSize: 15.h,
                                        color: Colors.white,
                                      )),
                                ],
                              ))
                          : const SpinnerButton()),
                ),
              ],
            )));
  }
}
