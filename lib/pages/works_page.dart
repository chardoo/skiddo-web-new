import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skiddo_web/components/common/sidebar.dart';
import 'package:skiddo_web/components/dasboard/card.dart';
import 'package:skiddo_web/components/gallery/create_event_form.dart';
import 'package:skiddo_web/components/gallery/gallery_card.dart';
import 'package:skiddo_web/components/works/add_work_form.dart';
import 'package:skiddo_web/components/works/sampleCard.dart';
import 'package:skiddo_web/controllers/gallery/gallery_controller.dart';
import 'package:skiddo_web/components/gallery/event_card.dart';
import 'package:skiddo_web/controllers/works/work_controller.dart';
import 'package:skiddo_web/theme/DarkThemeProvider.dart';
import 'package:get/get.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GalleryPage createState() => _GalleryPage();
}

class _GalleryPage extends State<WorksPage> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  var checkIfLoggedIn = false;
  GlobalKey<ScaffoldState> _scaffoldKeyUpload = GlobalKey();
  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    // checkIfloggedIn();
    //openDrawer();
  }

  openDrawer() async {
    await Future.delayed(Duration.zero);
    _scaffoldKeyUpload.currentState?.openDrawer();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    // GalleryController galleryController = Get.put(GalleryController());
    return GetBuilder<WorkController>(
        init: WorkController(),
        builder: (WorkController workController) {
          
          return Scaffold(
            backgroundColor:  Colors.black,
            onDrawerChanged: (isOpened) async{
                      workController.toggler.value = !workController.toggler.value;
            },
              key: _scaffoldKeyUpload,
              appBar: AppBar(
              
                backgroundColor: Colors.black,
                actions: [
                  Container(
                      margin: EdgeInsets.only(
                          top: 10.h, bottom: 10.h, left: 15.h, right: 15.h),
                      height: 40.h,
                      width: 120.h,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary),
                          onPressed: () async {
                            showDialog(
                                context: context,
                                builder: (ctx) => uploadFolder());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.h,
                              ),
                              Text("Add Sample",
                                  style: TextStyle(
                                    fontSize: 10.h,
                                    color: Colors.white,
                                  )),
                            ],
                          )))
                ],
              ),
            
              body: Obx(() => Container(
                  margin: EdgeInsets.only(left: workController.toggler.value == true? 250.h: 50.h, right: 50.h, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(' My Works',  style: Theme.of(context).textTheme.headline5! ) ,
                                  SizedBox(height: 10.h,),
                      Obx(() => Expanded(
                          child: workController.isSpinning.value == true
                              ? Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 5.h,
                                  ),
                                )
                              : Container(
                                  child: workController.listOfwork.isEmpty
                                      ? const Center(
                                          child: Text(
                                          "No Sample Work ",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ))
                                      :
                                      // Text("fjdkfkf")

                                      Center(
                                          child: GridView.extent(
                                          primary: false,
                                          // padding: const EdgeInsets.all(16),
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                          maxCrossAxisExtent: 290.h,
                                          children: workController
                                              .listOfwork
                                              .map((folder) {
                                            return SampleCard(
                                              imageId: folder.imageId,
                                              url: folder.url,
                                              id: folder.id,
                                            );
                                          }).toList(),
                                        )))))
                    ],
          ))));
        });
  }

  Widget uploadFolder() {
    return AlertDialog(
      title: Text('Add Sample',
          textAlign: TextAlign.left,
          style:  GoogleFonts.imFellEnglish(
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              // letterSpacing: 1,
              fontSize: 35.h,
              color: Color.fromARGB(255, 5, 5, 5)
                  )),
      content: AddWorks(),
    );
  }
}
