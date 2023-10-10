//LoginController for all auth processes

import 'dart:async';
//
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skiddo_web/controllers/gallery/gallery_controller.dart';
import 'package:skiddo_web/services/Api/auth/auth.dart';
import 'package:skiddo_web/services/user/user_preference.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final loginpasswordController = TextEditingController();
  final loginemailController = TextEditingController();
  final emailController = TextEditingController();
  final companyNameController = TextEditingController();
  final contactController = TextEditingController();
  late String storeEmail;
  var ispasswordHidden = true.obs;
  var isSpinning = false.obs;
  var isRegistering = false.obs;
  var isError = false.obs;
  var onFocus = false.obs;
  var isAccountAlreadyExistWith = false.obs;
  var codeType = ''.obs;
  // final RegistrationController registrationController =
  //     Get.put(RegistrationController());
  // AuthorizationEndpoint authorizationEndpoint = AuthorizationEndpoint();
  AuthEndpoint authEndpoint = AuthEndpoint();
  @override
  void onInit() async {
    isAccountAlreadyExistWith.value = false;
    super.onInit();
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '*Minimum 6 characters';
    }
    if (value.trim().length < 6) {
      return '*Minimum 6 characters';
    }
    return null;
  }

  String? comapmnyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '*this field is required';
    }
    if (value.trim().length < 2) {
      return 'minimuim name should be two';
    }
    return null;
  }

  // ignore: non_constant_identifier_names
  String? ontapvalidatio(String? value) {
    return null;
  }

  String? emailValidator(String? value) {
    final _emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value == null || value.isEmpty) {
      return '* email is required';
    }
    if (!_emailRegExp.hasMatch(value.trim())) {
      return "*Invalid email";
    }
    return null;
  }

  String? contactValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '*Minimum 10 characters';
    }
    if (value.trim().length < 10) {
      return '*Minimum 10 characters';
    }
    return null;
  }

  Future<dynamic> register() async {
    print("register is abput to happens");
    isRegistering.value = true;
    Map<String, dynamic> payload = {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "contact": contactController.text.trim(),
      "name": companyNameController.text.trim()
    };
    print(payload);
    dynamic isregistered = await authEndpoint.register(payload);
    isRegistering.value = false;
    print(isregistered);
    if (isregistered == false) {
      return false;
    } else if (isregistered == null) {
      onFocus.value = false;
      isSpinning.value = false;
      return false;
    } else {
      return true;
    }
  }

  //this method is called to authenticate the user with their email and password
  Future<dynamic> login() async {
    isSpinning.value = true;
    Map<String, dynamic> payload = {
      "email": loginemailController.text.trim(),
      "password": loginpasswordController.text.trim(),
    };

    dynamic ifUserexit = await authEndpoint.login(payload);
    print(ifUserexit);
    if (ifUserexit == false) {
      isError.value = true;
      isSpinning.value = false;
      onFocus.value = true;
      return false;
    } else if (ifUserexit == null) {
      onFocus.value = false;
      isSpinning.value = false;
      return false;
    } else {
      onFocus.value = false;
      isSpinning.value = false;
      await UserService.setEmail(ifUserexit.email);
      await UserService.setToken(ifUserexit.token);
      
      await UserService.setUserkey(ifUserexit.id);
      GalleryController galleryController = Get.put(GalleryController());
      return true;
    }

    // @override
    // void onClose() {
    //   // TODO: implement onClose
    //   emailController.clear();
    //   passwordController.clear();
    //   super.onClose();
    // }

    // Future<void> login() async {
    //   try {
    //     GoogleSignIn _googleSignIn = GoogleSignIn();
    //     var account = await _googleSignIn.signIn();
    //     if (account != null) {
    //       var auth = await account.authentication;
    //       await authorizationEndpoint.googlesignIn(auth.idToken!);
    //     }
    //   } catch (error) {
    //     print(error);
    //   }
    // }

    // Future<dynamic> login() async {
    //   GoogleSignIn _googleSignIn = GoogleSignIn(
    //     clientId:
    //         '318081438477-6mifibhcsqk4b4jrb5vnknkk7os29s0m.apps.googleusercontent.com',
    //     scopes: [
    //       'email',
    //       'https://www.googleapis.com/auth/contacts.readonly',
    //     ],
    //   );

    //   GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    //   GoogleSignInAuthentication? googleSignInAuthentication =
    //       await googleSignInAccount?.authentication;

    //   AuthCredential credential = GoogleAuthProvider.credential(
    //     accessToken: googleSignInAuthentication!.accessToken,
    //     idToken: googleSignInAuthentication!.idToken,
    //   );

    //   dynamic authResult = await _auth.signInWithCredential(credential);

    //   print(authResult);
    //   dynamic currentUser = _auth.currentUser;
    // }
  }
}
