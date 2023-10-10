import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:skiddo_web/components/auth/login/registeration_dialog.dart';
import 'package:skiddo_web/components/common/spinner.dart';
import 'package:skiddo_web/controllers/auth/login_controller.dart';
import 'package:skiddo_web/pages/home_page.dart';
import 'package:skiddo_web/pages/main_page.dart';

class FirstLoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  // final ValueSetter<String> onSignIn;
  TextStyle termsAndPolicy = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 14.sp,
  );

  bool secureTest = true;
  bool isError = false;
  FirstLoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(context) {
    return SizedBox(
        height: 350.h,
        width: 350.h,
        child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.formKey,
            child: Column(
              children: [
                Container(
                    height: 70.h,
                    child: TextFormField(
                      onTap: () {
                        // controller.isError.value = false;
                      },
                      controller: controller.loginemailController,
                      validator: (value) => controller.emailValidator(value),
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
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1)),
                        fillColor: Theme.of(context).colorScheme.onPrimary,
                        filled: true,
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 158, 158, 158),
                        ),
                        errorStyle: TextStyle(),
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
                  height: 8,
                ),
                Container(
                    height: 70.h,
                    child: TextFormField(
                      onTap: () {
                        // controller.isError.value = false;
                      },
                      controller: controller.loginpasswordController,
                      validator: (value) => controller.passwordValidator(value),
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
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1)),
                        fillColor: Theme.of(context).colorScheme.onPrimary,
                        filled: true,
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 158, 158, 158),
                        ),
                        errorStyle: TextStyle(),
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
                  height: 10.h,
                ),
                Obx(
                  () => SizedBox(
                      height: 50.h,
                      width: 200.h,
                      child: controller.isSpinning.value == false
                          ? TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary),
                              onPressed: () async {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.onFocus.value = false;
                                  // bool ifUserExit =
                                  var loginResults = await controller.login();
                                  print("login is  here");
                                  print(loginResults);
                                  if (loginResults == true) {
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => mainPage()));

                        //  Get.offUntil(GetPageRoute(page: () => Dashboard()), ModalRoute.withName('home') );
                        Timer(Duration(milliseconds: 300), ()=>Get.delete<LoginController>());
                                  }
                                } else {
                                  controller.onFocus.value = true;
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Log in",
                                      style: TextStyle(
                                        fontSize: 20.h,
                                        color: Colors.white,
                                      )),
                                ],
                              ))
                          : const SpinnerButton()),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text.rich(
                  TextSpan(
                    text: "Need an account ",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                       ,
                    children: <TextSpan>[
                      TextSpan(
                        text: " Create One",
                        // style: Theme.of(context)
                        //     .textTheme
                        //     .headline6!
                        //     .copyWith(color: Colors.white),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            // e.onTap();
                            Navigator.of(context).pop();
                            showDialog(
                                context: context,
                                builder: (ctx) => register(context));
                          },
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }

  Widget register(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Picco',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline5!
            ,
      ),
      content: Registeration(),
    );
  }
}
