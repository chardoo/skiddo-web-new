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

class EditPrice extends StatelessWidget {
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
  int price;
  String productId;
  EditPrice({super.key, required this.price, required this.productId});
  @override
  Widget build(BuildContext context) {
    galleryController.priceController.text = price.toString();
    return body(context);
  }

  Widget body(context) {
    return SizedBox(
        height: 250.h,
        width: 400.h,
        child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: galleryController.editKey,
            child: Column(
              children: [
                Container(
                    height: 70.h,
                    child: TextFormField(
                      onTap: () {
                        // controller.isError.value = false;
                      },

                      controller: galleryController.priceController,
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
                        hintText: 'Edit price',
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
                Row(
                  children: [
                    Text("Public"),
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Obx(
                  () => SizedBox(
                      height: 50.h,
                      width: 200.h,
                      child: galleryController.isSpinning.value == false
                          ? TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary),
                              onPressed: () async {
                                galleryController.updatingPhoto();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Save Changes",
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
