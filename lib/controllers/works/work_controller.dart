// // ForgetPasswordController class

import 'dart:async';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getCont;
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:skiddo_web/models/images/folder_image.dart';
import 'package:skiddo_web/pages/event_photo_pzge.dart';
import 'package:skiddo_web/pages/landing_page.dart';
import 'package:skiddo_web/services/Api/gallery/gellery.dart';
import 'package:skiddo_web/services/Api/works/works.dart';
import 'package:skiddo_web/services/user/user_preference.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';

class WorkController extends getCont.GetxController {
  final GlobalKey<FormState> uploadkey = GlobalKey<FormState>();
   final GlobalKey<FormState> uploadEditValue = GlobalKey<FormState>();
   final GlobalKey<FormState> editKey = GlobalKey<FormState>();

  late String storeEmail;
  var ispasswordHidden = true.obs;
  var isSpinning = false.obs;
  var isAddingImages =  false.obs;
   var isSpinEventImages = false.obs;
    var uploadimagesspinner = false.obs;
  var isError = false.obs;
  var onFocus = false.obs;
  var isAccountAlreadyExistWith = false.obs;
  var codeType = ''.obs;
  WorkEndpoint workEndpoint = WorkEndpoint();
  List<Sample> listOfwork = [].cast<Sample>().obs;
  List<EventImages> listOfImages = [].cast<EventImages>().obs;
  late List<Uint8List> files;
  var myfiles = [];
    var myfile = [];
  var numberOffilePicked = 0.obs;
  var toggler = false.obs;

  @override
  void onInit() async {
    getWorks();
    super.onInit();
  }

  getWorks() async {
    isSpinning.value =true;
    String userId = await UserService.getUserKey();
    var payload = {"userId": userId};
    listOfwork = await workEndpoint.getSample(payload);
     isSpinning.value =false;
    update();
  }
 

   deleteSampleImage(String imageId) async {
    String userId = await UserService.getUserKey();
    Map<String, dynamic> payload = {"userId": userId, "sampleId": imageId};
    await workEndpoint.deleteAnImage(payload);
    listOfwork.removeWhere((element) =>element.id == imageId );
    update();
  }



  dynamic uploadSample() async {
    isAddingImages.value =true;
    FormData formData = FormData.fromMap({
      "images": myfiles,
      "userId": await UserService.getUserKey(),
    });

   var results =  await workEndpoint.uploadSample(formData);
   onInit();
    isAddingImages.value =false;
  //  listOfwork = results;

   listOfImages.removeRange(0, 6);





   //listOfwork.assignAll(results);

   update();

   return true;
  }
  
  // pick images for event uploads
   pickimages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    if (result != null) {
      //   files = result.files.map((path) => path.bytes!).toList();
      for (var file in result.files) {
        myfiles.add(MultipartFile.fromBytes(
          file.bytes!,
          filename: file.name,
          contentType: MediaType(
            "image",
            file.extension!,
            
          ),
        ));
      }

      numberOffilePicked.value = myfiles.length;
      update();
    } else {
    // User canceled the picker
    }
  }
  // pick a image  for event profile

}
