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

class Registeration extends StatelessWidget {
  final LoginController controller = Get.put(LoginController(), tag: "login");
  // final ValueSetter<String> onSignIn;
  TextStyle termsAndPolicy = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 14.sp,
  );

  bool secureTest = true;
  bool isError = false;
  Registeration({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  body(context);
  }

  Widget body(context) {
    return 
    
    SizedBox(
      height: 550.h,
      width: 400.h,
      child: 
      Form(
        autovalidateMode:  AutovalidateMode.onUserInteraction,
        key: controller.formKey2,
        child:
    Column(
      children: [
      
        Container(
            height: 70.h,
            child: TextFormField(
              onTap: () {
                // controller.isError.value = false;
              },
              controller: controller.companyNameController,
              validator: (value) => controller.contactValidator(value),
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(top: 12, bottom: 12, left: 10),
                helperText: ' ',
                enabledBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 0.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: InputBorder.none,
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1)),
                fillColor: Theme.of(context).colorScheme.onPrimary,
                filled: true,
                hintText: 'Company name',
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 158, 158, 158),
                ),
                errorStyle: TextStyle(),
                // errorText: "Sorry you can't use this name",
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
              controller: controller.emailController,
              validator: (value) => controller.emailValidator(value),
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(top: 12, bottom: 12, left: 10),
                helperText: ' ',
                enabledBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 0.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: InputBorder.none,
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
              controller: controller.contactController,
              validator: (value) => controller.contactValidator(value),
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(top: 12, bottom: 12, left: 10),
                helperText: ' ',
                enabledBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 0.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: InputBorder.none,
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1)),
                fillColor: Theme.of(context).colorScheme.onPrimary,
                filled: true,
                hintText: 'Contact',
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
              controller: controller.passwordController,
              validator: (value) => controller.passwordValidator(value),
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(top: 12, bottom: 12, left: 10),
                helperText: ' ',
                enabledBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 0.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: InputBorder.none,
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
                // errorText: "sorry this does not meet requirement",
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
              controller: controller.passwordConfirmController,
              validator: (value) => controller.passwordValidator(value),
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(top: 12, bottom: 12, left: 10),
                helperText: ' ',
                enabledBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 0.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: InputBorder.none,
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1)),
                fillColor: Theme.of(context).colorScheme.onPrimary,
                filled: true,
                hintText: 'Confirm Password',
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 158, 158, 158),
                ),
                errorStyle: TextStyle(),
                
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                  fontFamily: "verdana_regular",
                  fontWeight: FontWeight.w400,
                ),
              ),
            )),

             SizedBox(
                    height: 8.h,
                  ),
                  Obx(
                    () => SizedBox(
                        height: 50.h,
                        width: 200.h,
                        child: controller.isRegistering.value == false
                            ? TextButton(
                                style: TextButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.secondary
                                ),
                                onPressed: () async {
                                  print("heere re r re er r re re");
                                  if (controller.formKey2.currentState!
                                      .validate()) {
                                         print("is hallaid manenenen");
                                    controller.onFocus.value = false;
                                    // bool ifUserExit =
                                 var results =    await controller.register();
                                 if(results ==true){
                                    Navigator.of(context).pop();
                                  showDialog(context: context, builder: (ctx) => signUpWidget(context));
                                 }

                                  } else {
                                    print("nothing happen");
                                    controller.onFocus.value = true;
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Sign Up",
                                        style: TextStyle(
                                           fontSize: 20.h,
                                          color: Colors.white,
                                        )),
                                  ],
                                ))
                            : const SpinnerButton()),
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                  Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: "by signing up, you are agreeing to our \n",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        ,
                    children: <TextSpan>[
                      TextSpan(
                        text: "Term of Service",
                        // style: Theme.of(context)
                        //     .textTheme
                        //     .headline6!
                        //     .copyWith(color: Colors.white),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            // e.onTap();
                          },
                      ),
                    ],
                  ),
                ),

               SizedBox(height: 20.h,),
                Text.rich(
                   textAlign: TextAlign.center,
                  TextSpan(
                    text: "Already have an account?",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        ,
                    children: <TextSpan>[
                      TextSpan(
                        text: " Login",
                        // style: Theme.of(context)
                        //     .textTheme
                        //     .headline6!
                        //     .copyWith(color: Colors.white),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            // e.onTap();
                                Navigator.of(context).pop();
                              showDialog(context: context, builder: (ctx) => signUpWidget(context));
                          },
                      ),
                    ],
                  ),
                ),
      ],
    )));
  }


  Widget signUpWidget(BuildContext context) {
    return AlertDialog(
      title: Text(
     'Picco',textAlign: TextAlign.center,
        style: GoogleFonts.imFellEnglish(
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              // letterSpacing: 1,
              fontSize: 35.h,
              color:Colors.black)
      ),
      content: FirstLoginScreen(),
    );
  }




}
