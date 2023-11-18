import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skiddo_web/components/common/sidebar.dart';
import 'package:skiddo_web/components/dasboard/card.dart';
import 'package:skiddo_web/components/gallery/create_event_form.dart';
import 'package:skiddo_web/components/gallery/gallery_card.dart';
import 'package:skiddo_web/controllers/gallery/gallery_controller.dart';
import 'package:skiddo_web/components/gallery/event_card.dart';
import 'package:skiddo_web/theme/DarkThemeProvider.dart';
import 'package:get/get.dart';

class GalleryPage extends ConsumerStatefulWidget {
  const GalleryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  ConsumerState<GalleryPage> createState() => _GalleryPage();
}

class _GalleryPage extends ConsumerState<GalleryPage> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  var checkIfLoggedIn = false;
  GlobalKey<ScaffoldState> _scaffoldKeyUpload = GlobalKey();
  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    // checkIfloggedIn();
    //openDrawer();
    Future.microtask(() {
      ref.read(galleryProvider.notifier).getListOfFolder();
    });
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
    return Scaffold(
        backgroundColor: Colors.black,
        onDrawerChanged: (isOpened) async {
          ref.watch(galleryProvider).toggler =
              !ref.watch(galleryProvider).toggler;
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
                          context: context, builder: (ctx) => uploadFolder());
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
                        Text("New Event",
                            style: TextStyle(
                              fontSize: 10.h,
                              color: Colors.white,
                            )),
                      ],
                    )))
          ],
        ),
        // drawer: const CustomDrawer(),
        body: Container(
            margin: EdgeInsets.only(
                left: ref.watch(galleryProvider).toggler == true ? 250.h : 50.h,
                right: 50.h,
                top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Events', style: Theme.of(context).textTheme.headline5!),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                    child: ref.watch(galleryProvider).isSpinning == true
                        ? Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 5.h,
                            ),
                          )
                        : Container(
                            child:
                                ref.watch(galleryProvider).listOfFolders.isEmpty
                                    ? const Center(
                                        child: Text(
                                        "No Event Added",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ))
                                    :
                                    Center(
                                        child: GridView.extent(
                                        primary: false,
                                        // padding: const EdgeInsets.all(16),
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        maxCrossAxisExtent: 310.h,
                                        children: ref
                                            .watch(galleryProvider)
                                            .listOfFolders
                                            .map((folder) {
                                          return EventCard(
                                            eventName: folder.eventName,
                                            eventImage: folder.url,
                                            id: folder.id,
                                            date: folder.eventDate,
                                          );
                                        }).toList(),
                                      ))))
              ],
            )));
  }

  Widget uploadFolder() {
    return AlertDialog(
      title: Text('Create Event',
          textAlign: TextAlign.center,
          style: GoogleFonts.imFellEnglish(
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              // letterSpacing: 1,
              fontSize: 35.h,
              color: Color.fromARGB(255, 5, 5, 5))),
      content: UploadImageForm(),
    );
  }
}
