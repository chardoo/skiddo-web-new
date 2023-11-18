import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skiddo_web/components/common/spinner.dart';
import 'package:skiddo_web/controllers/gallery/gallery_controller.dart';

class UploadImageForm extends ConsumerStatefulWidget {

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
  ConsumerState<UploadImageForm> createState() => _UploadImageFormState();
}

class _UploadImageFormState extends ConsumerState<UploadImageForm> {
 
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
        height: 300.h,
        width: 400.h,
         child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: uploadkey,
            child: Column(
              children: [
                Container(
                    height: 70.h,
                    child: TextFormField(
                      onTap: () {
                        // controller.isError.value = false;
                      },
                      controller: eventNameController,
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
                      eventDateController.text =   date.toString();
                     
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
                Row(
                  children: [
                    SizedBox(
                        width: 100.h,
                        height: 30.h,
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.grey),
                            onPressed: () async {
                              await ref.read(galleryProvider.notifier).pickFileforevent();
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
                  // SizedBox(
                  //         child: ref.watch(galleryProvider).numberOffilePicked! <
                  //                 1
                  //             ? Text("No file chosen")
                  //             : ref.watch(galleryProvider).numberOffilePicked ==
                  //                     1
                  //                 ? Text(
                  //                     "${ref.watch(galleryProvider).numberOffilePicked} file Chosen")
                  //                 : Text(
                  //                     "${ref.watch(galleryProvider).numberOffilePicked} files Chosen"),
                  //       )
                  ],
                ),
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
                  height: 35.h,
                ),
              SizedBox(
                      height: 50.h,
                      width: 200.h,
                      child: ref.watch(galleryProvider).isSpinning ==
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
                               ref.read(galleryProvider.notifier).createEvent(eventNameController.text);
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
                                  Text("Upload",
                                      style: TextStyle(
                                        fontSize: 15.h,
                                        color: Colors.white,
                                      )),
                                ],
                              ))
                          : const SpinnerButton()),
                
             ],
            ))
        );
 
 
  }
}
