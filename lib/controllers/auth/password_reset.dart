// import 'dart:convert';

// import 'package:aegis_rider/services/userService.dart';
// import 'package:aegis_rider/utils/api_url.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// class PasswordResetController extends GetxController {
//   String token = '';
//   var isLoading = false.obs;
//   TextEditingController oldPasswordController = TextEditingController();
//   TextEditingController newPasswordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   bool isNewObscure = true;
//   bool isConfirmObscure = true;

//   bool isNewPasswordObscure = true;
//   bool isConfirmPasswordObscure = true;
//   bool isOldPasswordObscure = true;

//   var isDeviceOffline = false.obs;
//   var passwordIncorrect = ''.obs;

//   @override
//   void onInit() {
//     connectivityIsueHandler();
//     super.onInit();
//   }

//   connectivityIsueHandler() {
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       if (result == ConnectivityResult.none) {
//         isDeviceOffline.value = true;
//       } else {
//         isDeviceOffline.value = false;
//       }
//       update();
//     });
//   }

//   showNewObscureTextHandler() {
//     isNewObscure = !isNewObscure;
//     update();
//   }

//   showConfirmObscureTextHandler() {
//     isConfirmObscure = !isConfirmObscure;
//     update();
//   }

//   showOldObscureTextHandler() {
//     isOldPasswordObscure = !isOldPasswordObscure;
//     update();
//   }

//   void passwordResetHandler(
//       {required String password, required String newPassword}) async {
//     token = await UserService.getToken();
//     isLoading(true);

//     try {
//       var headers = {
//         'Authorization': 'Bearer $token',
//         'Content-Type': 'application/json'
//       };
//       var request = http.Request(
//           'PUT', Uri.parse('${AEGISURL.apiUrl}auth/change-password'));
//       request.body =
//           json.encode({"password": password, "new_password": newPassword});
//       request.headers.addAll(headers);

//       http.StreamedResponse response = await request.send();

//       if (response.statusCode == 200) {
//         final result = await response.stream.bytesToString().then((value) {
//           return json.decode(value);
//         });

//         if (result['status'] == "success") {
//           Get.back();
//         }
//         passwordIncorrect.value =
//             result['status'] == "failure" ? result['detail'] : "";
//         isLoading(false);
//         update();
//       } else {
//         final error = await response.stream.bytesToString().then((value) {
//           return json.decode(value);
//         });

//         Get.snackbar(
//           'Fail',
//           error['detail'],
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//         isLoading(false);
//         update();
//       }
//     } catch (e) {
//       Get.snackbar(
//         'Fail',
//         e.toString(),
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//       isLoading(false);
//     }
//   }
// }
