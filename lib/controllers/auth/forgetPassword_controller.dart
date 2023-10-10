// // ForgetPasswordController class

// import 'dart:async';
// import 'package:aegis_rider/controllers/auth/login_controller.dart';
// import 'package:aegis_rider/controllers/registration/registration_controller.dart';
// import 'package:aegis_rider/endpoints/auth/Auth.dart';
// import 'package:aegis_rider/services/userService.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';

// class ForgetPasswordController extends GetxController {
//   final GlobalKey<FormState> forgetPasswordformKey = GlobalKey<FormState>();
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   late String storeEmail;
//   String? userKey = '';
//   var emailController = TextEditingController();
//   final codeController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//   var isError = false.obs;
//   var isEmailaccount = false.obs;
//   var isSpinning = false.obs;
//   var ispasswordHidden = true.obs;
//   var ispasswordHidden2 = true.obs;
//   var onFocus = false.obs;
//   var time = 60.obs;
//   final LoginController loginController = Get.put(LoginController());
//   final RegistrationController registrationController =
//       Get.put(RegistrationController());
//   AuthorizationEndpoint authorizationEndpoint = AuthorizationEndpoint();

//   @override
//   void onInit() async {
//     loginController.isError.value = false;
//     emailController.text = loginController.storeEmail;
//     super.onInit();
//   }

//   void counter() {
//     time.value = 59;
//     Timer.periodic(const Duration(seconds: 1), (timer) {
//       time.value--;
//       if (time.value == 0) {
//         timer.cancel();
//       }
//     });
//   }

//   String? emailValidator(String? value) {
//     final emailRegExp = RegExp(
//         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//     if (value == null || value.isEmpty) {
//       return '*Invalid email';
//     }
//     if (!emailRegExp.hasMatch(value.trim())) {
//       return "*Invalid email";
//     }

//     return null;
//   }

//   String? codeValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return '*Invalid code';
//     }
//     if (value.trim().length < 6 || value.trim().length > 6) {
//       return '*Invalid code';
//     }
//     return null;
//   }

//   String? passwordValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return '*Minimum 6 characters';
//     }
//     if (value.trim().length < 6) {
//       return '*Minimum 6 characters';
//     }
//     return null;
//   }

//   String? passwordMatchValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return '*Password mismatch';
//     }
//     if (value.trim().length < 6) {
//       return '*Password mismatch';
//     }
//     if (passwordController.text != value.trim()) {
//       return '*Password mismatch';
//     }
//     return null;
//   }

//   Future<void> sendForgetPasswordCode() async {
//     isSpinning.value = true;
//     storeEmail = emailController.text.trim();
//     loginController.emailController.text = emailController.text.trim();
//     Map<String, dynamic> payload = {"email": emailController.text.trim()};
//     dynamic sentCode =
//         await authorizationEndpoint.sendForgetPasswordCode(payload);
//     if (sentCode == true) {
//       isSpinning.value = false;
//       isError.value = false;
//       onFocus.value = false;
//       counter();
//       Get.offNamed('/forgetPasswordconfirmCode');
//     } else if (sentCode == false) {
//       onFocus.value = true;
//       isSpinning.value = false;
//       isError.value = true;
//     } else if (sentCode == null) {
//       onFocus.value = false;
//       isSpinning.value = false;
//     } else if (sentCode.code == '320') {
//       onFocus.value = false;
//       registrationController.codeType.value = sentCode.code;
//       isSpinning.value = false;
//       registrationController.storeEmail = emailController.text;
//       Get.offNamed('/UnverifiedEmail');
//     } else if (sentCode.code == '326' ||
//         sentCode.code == '327' ||
//         sentCode.code == '328') {
//       onFocus.value = false;
//       isError.value = false;
//       registrationController.codeType.value = sentCode.code;
//       isSpinning.value = false;
//       registrationController.storeEmail = emailController.text;
//       registrationController.codeType.value = sentCode.code;
//       Get.offNamed('/accountAlreadyExits');
//     }

//     // else {

//     // }
//   }

//   Future<void> resendForgetPasswordCode() async {
//     storeEmail = emailController.text.trim();
//     Map<String, dynamic> payload = {"email": emailController.text.trim()};
//     dynamic sentCode =
//         await authorizationEndpoint.sendForgetPasswordCode(payload);
//     if (sentCode == true) {
//       isSpinning.value = false;
//       isError.value = false;
//       counter();
//     } else if (sentCode == null) {
//       isSpinning.value = false;
//     } else {
//       isSpinning.value = false;
//       isError.value = true;
//     }
//   }

//   Future<dynamic> confirmCode() async {
//     storeEmail = emailController.text;
//     isSpinning.value = true;
//     Map<String, dynamic> payload = {"reset_code": codeController.text.trim()};
//     print("confirm codes");
//     print(payload);
//     dynamic confirmCode = await authorizationEndpoint.confirmCode(payload);

//     print(confirmCode);
//     if (confirmCode == null) {
//       isSpinning.value = false;
//     } else if (confirmCode.code == '200') {
//       isSpinning.value = false;
//       isEmailaccount.value = true;
//       isError.value = false;
//       await UserService.setUserkey(confirmCode.data);
//       Get.offNamed('/resetPassword');
//     } else {
//       isSpinning.value = false;
//       isError.value = true;
//     }
//   }

//   Future<dynamic> resetPassword() async {
//     isSpinning.value = true;
//     Map<String, dynamic> payload = {
//       "user_key": await UserService.getUserKey(),
//       "password": passwordController.text.trim()
//     };
//     dynamic confirmCode = await authorizationEndpoint.resetPassword(payload);
//     if (confirmCode == true) {
//       isSpinning.value = false;
//       isError.value = false;

//       loginController.signIn(
//           emailController.text.trim(), passwordController.text.trim());
//     } else if (confirmCode == null) {
//       isSpinning.value = false;
//     } else {
//       isSpinning.value = false;
//       isError.value = true;
//     }
//   }
// }
