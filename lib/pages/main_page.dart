import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:skiddo_web/pages/gallery_page.dart';
import 'package:skiddo_web/pages/home_page.dart';
import 'package:skiddo_web/pages/works_page.dart';
import 'package:sidebarx/sidebarx.dart';
class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<mainPage> {
  /// Views to display
  List<Widget> views = const [Dashboard(), GalleryPage(), WorksPage()];

  /// The currently selected index of the bar
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
         
          SidebarX(
            
            theme: SidebarXTheme(
              width: 120,
        margin: const EdgeInsets.only(right: 1),
        decoration: BoxDecoration(
          color: Colors.black,
          // borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: Colors.red,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 10),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            // color: actionColor.withOpacity(0.37),
          ),
          // gradient: const LinearGradient(
          //   colors: [accentCanvasColor, canvasColor],
          // ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
         iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
        ),
            controller: SidebarXController(selectedIndex: selectedIndex),
            items:  [
              SidebarXItem(icon: Icons.home, label: 'Home',
              onTap: () {
                 setState(() {
                selectedIndex = 0;
              });
              },
              ),
              SidebarXItem(icon: Icons.browse_gallery, label: 'Gallery', onTap: () {
                 setState(() {
                selectedIndex = 1;
              });
              },),
              SidebarXItem(icon: Icons.work_history, label: 'Works', onTap: () {
                 setState(() {
                selectedIndex = 2;
              });
              },),
            ],
          ),
           Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),
    );
  }
}
