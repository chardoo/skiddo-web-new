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
import 'package:riverpod_annotation/riverpod_annotation.dart';
part '.generated/gallery_controller.g.dart';

@Riverpod(keepAlive: true)
class GalleryProvider extends _$GalleryProvider {
  GalleryEndpoint galleryEndpoint = GalleryEndpoint();
  var myfiles = [];
  var myfile = [];
  var numberOffilePicked = 0.obs;

  @override
  GalleryState build() {
    return GalleryState(
        listOfFolders: [],
        listOfImages: [],
        isSpinning: false,
        toggler: false,
        numberOffilePicked: 0);
  }

  getListOfFolder() async {
    state = GalleryState(
        listOfFolders: [], isSpinning: true, listOfImages: [], toggler: false);
    String userId = await UserService.getUserKey();
    var payload = {"userId": userId};
    var folders = await galleryEndpoint.getFolder(payload);
    state = GalleryState(
        listOfFolders: folders,
        listOfImages: [],
        isSpinning: false,
        toggler: state.toggler,
        numberOffilePicked: state.numberOffilePicked);
  }

  deleteFolder(String eventName, String eventId) async {
    state = GalleryState(
        listOfFolders: state.listOfFolders,
        listOfImages: state.listOfImages,
        isSpinning: true,
        toggler: state.toggler);
    String userId = await UserService.getUserKey();
    var payload = {"userId": userId, "eventId": eventId};
    await galleryEndpoint.deleteFolder(payload);
    var newlist = state.listOfFolders;
    newlist.removeWhere((element) => element.eventName == eventName);
    state = GalleryState(
        listOfFolders: newlist,
        listOfImages: state.listOfImages,
        isSpinning: false,
        toggler: state.toggler);
  }

  Future<Map<String, dynamic>> getEventpicture(
      String eventId, String eventName) async {
    String userId = await UserService.getUserKey();
    var payload = {
      "eventId": eventId,
    };

    var listOfImage = await galleryEndpoint.getEventpicture(payload);
    print("blessing of healing");
    print(listOfImage);
    state = GalleryState(
        listOfFolders: state.listOfFolders,
        listOfImages: listOfImage,
        isSpinning: false,
        toggler: state.toggler);

    return {"eventId": eventId, "eventName": eventName};
    // await Get.to(EventGallery(eventId: eventId, eventName: eventName));
  }

  deleteAnImages(String imageId) async {
    String userId = await UserService.getUserKey();
    var payload = {"userId": userId, "id": imageId};
    await galleryEndpoint.deleteAnImage(payload);
    var newlist = state.listOfImages;
    newlist.removeWhere((element) => element.id == imageId);
    state = GalleryState(
        listOfFolders: state.listOfFolders,
        listOfImages: newlist,
        isSpinning: false,
        toggler: state.toggler);
  }

  dynamic createEvent(String eventName) async {
    // var userId =await UserService.getUserKey();

    final formData = FormData.fromMap({
      "eventName": eventName,
      "eventDate": "",
      "images": myfile,
      "userId": await UserService.getUserKey()
    });

    var resultsfolder = await galleryEndpoint.createEvent(formData);
    Folder folder = Folder(
        eventName: resultsfolder['eventName'],
        eventDate: resultsfolder['eventName'],
        url: resultsfolder['url'],
        id: resultsfolder['userId']);
    state = GalleryState(
        listOfFolders: [...state.listOfFolders, folder],
        listOfImages: state.listOfImages,
        isSpinning: false,
        toggler: state.toggler);
    return {};
  }

  updatingImage(String priceController, String imageId, bool ispublic) async {
    print("what iksisisis happening");
    print(priceController);
    print(ispublic);
    var payload = {
      "publicValue": ispublic,
      "imagesId": imageId,
      "price": priceController,
      "userId": await UserService.getUserKey()
    };

    await galleryEndpoint.updatingImage(payload);
  }

  dynamic uploadeventImages(TextEditingController price, String eventId) async {
    state = GalleryState(
        listOfFolders: state.listOfFolders,
        listOfImages: state.listOfImages,
        isSpinning: true,
        toggler: state.toggler);
    final formData = FormData.fromMap({
      "price": int.parse(price.text),
      "images": myfiles,
      "userId": await UserService.getUserKey(),
      "eventId": eventId
    });

    await galleryEndpoint.uploadImages(formData);
    var payload = {
      "eventId": eventId,
    };

    var listOfImage = await galleryEndpoint.getEventpicture(payload);
    state = GalleryState(
        listOfFolders: state.listOfFolders,
        listOfImages: listOfImage,
        isSpinning: false,
        toggler: state.toggler);

    return {};
  }

  // pick images for event uploads
  pickimages() async {
    myfiles.clear();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    if (result != null) {
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
    } else {
      // User canceled the picker
    }
  }

  // pick a image  for event profile
  pickFileforevent() async {
    myfile.clear();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    if (result != null) {
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
      state = GalleryState(
          listOfFolders: state.listOfFolders,
          isSpinning: state.isSpinning,
          listOfImages: state.listOfImages,
          toggler: state.toggler,
          numberOffilePicked: myfile.length);
    } else {
      // User canceled the picker
    }
  }

  logOut() async {
    await UserService.setToken('');
    Get.offUntil(GetPageRoute(page: () => LandingScreen()),
        ModalRoute.withName('landing'));
  }
}

class GalleryState {
  late final bool toggler;
  late int? numberOffilePicked;
  final bool isSpinning;
  final List<Folder> listOfFolders;
  final List<EventImages> listOfImages;

  GalleryState(
      {required this.listOfFolders,
      required this.isSpinning,
      required this.listOfImages,
      required this.toggler,
      this.numberOffilePicked});
}
