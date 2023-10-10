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
import 'package:skiddo_web/services/user/user_preference.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';

class GalleryController extends getCont.GetxController {
  final GlobalKey<FormState> uploadkey = GlobalKey<FormState>();
   final GlobalKey<FormState> uploadEditValue = GlobalKey<FormState>();
   final GlobalKey<FormState> editKey = GlobalKey<FormState>();
  final priceController = TextEditingController();
  final eventNameController = TextEditingController();
   final priceExtraController = TextEditingController();
  final eventNameExtraController = TextEditingController();
  final eventDateController =  TextEditingController();
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
  GalleryEndpoint galleryEndpoint = GalleryEndpoint();
  List<Folder> listOfFolders = [].cast<Folder>().obs;
  List<EventImages> listOfImages = [].cast<EventImages>().obs;
  late List<Uint8List> files;
  var myfiles = [];
    var myfile = [];
  var numberOffilePicked = 0.obs;
  var toggler = false.obs;

  @override
  void onInit() async {
    bool isWeb = GetPlatform.isWeb;
    print("is web here to imformeorn rer");
    print(isWeb);
    getListOfFolder();
    super.onInit();
  }

  getListOfFolder() async {
    isSpinning.value =true;
    String userId = await UserService.getUserKey();
    var payload = {"userId": userId};
    listOfFolders = await galleryEndpoint.getFolder(payload);
     isSpinning.value =false;
    update();
  }
   deleteFolder(String eventName) async {
    String userId = await UserService.getUserKey();
    var payload = {"userId": userId,
     "eventName": eventName
    };
     await galleryEndpoint.deleteFolder(payload);
     listOfFolders.removeWhere((element) =>element.eventName == eventName );
    update();
  }


  getEventpicture(String eventId, String eventName) async {
    isSpinEventImages.value =true;
    String userId = await UserService.getUserKey();
    var payload = {"eventId": eventId,};
    
    listOfImages = await galleryEndpoint.getEventpicture(payload);
    isSpinEventImages.value =false;
    await Get.to(  EventGallery(eventId: eventId, eventName: eventName)); 

    update();
  }
   deleteAnImages(String imageId) async {
    String userId = await UserService.getUserKey();
    var payload = {"userId": userId, "id": imageId};
    await galleryEndpoint.deleteAnImage(payload);
    listOfImages.removeWhere((element) =>element.id == imageId );
    onInit();
    update();
  }

  createEvent() async {
   
    // var userId =await UserService.getUserKey();
    uploadimagesspinner.value =true;
    FormData formData = FormData.fromMap({
      "eventName":  eventNameController.text,
      "eventDate":  "",
      "images": myfile,
      "userId": await UserService.getUserKey()
    });

 await galleryEndpoint.createEvent(formData);
   onInit();
   Get.back();
   update();
  }

  updatingPhoto() async {
   
   var payload = {
    "userId": await UserService.getUserKey(),
    ""

   };
    // var userId =await UserService.getUserKey();
    uploadimagesspinner.value =true;
    FormData formData = FormData.fromMap({
      "eventName":  eventNameController.text,
      "eventDate":  "",
      "images": myfile,
      "userId": await UserService.getUserKey()
    });

 await galleryEndpoint.createEvent(formData);
   onInit();
   Get.back();
   update();
  }

  uploadeventImages(String  eventId) async {
   
    // var userId =await UserService.getUserKey();
    //  listOfImages.clear();
    isAddingImages.value =true;
    FormData formData = FormData.fromMap({
      "price":  int.parse( priceExtraController.text),
      "images": myfiles,
      "userId": await UserService.getUserKey(),
      "eventId": eventId
    });

   var results =  await galleryEndpoint.uploadImages(formData);
    isAddingImages.value =false;
   listOfImages =  results;
   update();
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
  pickFileforevent() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    if (result != null) {
      //   files = result.files.map((path) => path.bytes!).toList();
      for (var file in result.files) {
        myfile.add(MultipartFile.fromBytes(
          file.bytes!,
          filename: file.name,
          contentType: MediaType(
            "image",
            file.extension!,
            
          ),
        ));
      }
      numberOffilePicked.value = myfile.length;
      update();
    } else {
    // User canceled the picker
    }
  }

  logOut()async{
     await UserService.setToken('');
    Get.offUntil(GetPageRoute(page: () => LandingScreen()), ModalRoute.withName('landing') );
   Timer(Duration(milliseconds: 300), ()=>Get.delete<GalleryController>());
   print("hello how are you adiing sddsjkdsjdsjdsjdsjsd");
  }
}
