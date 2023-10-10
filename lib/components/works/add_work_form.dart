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
import 'package:skiddo_web/controllers/works/work_controller.dart';

class AddWorks extends StatelessWidget {
  final WorkController workController = Get.put(WorkController(), tag: "fkkddfkfsndsdknds");
  // final ValueSetter<String> onSignIn;
  TextStyle termsAndPolicy = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 14.sp,
  );

  bool secureTest = true;
  bool isError = false;
  AddWorks({super.key,});
  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(context) {
    return SizedBox(
        height: 200.h,
        width: 400.h,
        child: Form(
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            key: workController.uploadEditValue,
            child: Column(
              children: [
                
                const SizedBox(
                  height: 30,
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
                                await workController.pickimages();
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
                              SizedBox(width: 10.h,),
                    Obx(() =>  SizedBox(
                        child: workController.numberOffilePicked.value < 1
                            ? Text("No file chosen"):
                            workController.numberOffilePicked.value == 1?
                            Text(
                                "${workController.numberOffilePicked.value} file Chosen")
                            : Text(
                                "${workController.numberOffilePicked.value} files Chosen"),
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
                      child: workController.isAddingImages.value == false
                          ? TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary),
                              onPressed: () async {
                                Get.back();
                                // print("heere re r re er r re re");
                                // if (galleryController.formKey2.currentState!
                                //     .validate()) {
                                //   print("everythingis fine Boss");
                                // }
                               await   workController.uploadSample();
                               workController.update();
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
                                  Text("Add",
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
