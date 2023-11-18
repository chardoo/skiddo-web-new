import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skiddo_web/components/common/spinner.dart';
import 'package:skiddo_web/controllers/gallery/gallery_controller.dart';

class EditPrice extends ConsumerStatefulWidget {
  TextStyle termsAndPolicy = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 14.sp,
  );

  bool secureTest = true;
  bool isError = false;
  String price;
  String productId;
  EditPrice({super.key, required this.price, required this.productId});
  @override
  ConsumerState<EditPrice> createState() => _EditPriceState();
}

class _EditPriceState extends ConsumerState<EditPrice> {
  final priceController = TextEditingController();
  final GlobalKey<FormState> editKey = GlobalKey<FormState>();
  bool value = false;
  @override
  Widget build(BuildContext context) {
    priceController.text = widget.price.toString();
    return body(context);
  }

  Widget body(context) {
    return SizedBox(
        height: 250.h,
        width: 400.h,
        child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: editKey,
            child: Column(
              children: [
                Container(
                    height: 70.h,
                    child: TextFormField(
                      onTap: () {
                        // controller.isError.value = false;
                      },
                      controller: priceController,
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
                      value: this.value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ),
                  ],
                ),
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
                              ref
                                  .read(galleryProvider.notifier)
                                  .updatingImage(priceController.text,widget.productId, value);
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
              ],
            )));
  }
}
