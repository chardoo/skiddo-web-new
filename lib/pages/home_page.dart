import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:skiddo_web/components/Graph/graph.dart';
import 'package:skiddo_web/components/common/app_bar.dart';
import 'package:skiddo_web/components/common/permanentsideNav.dart';
import 'package:skiddo_web/components/common/sidebar.dart';
import 'package:skiddo_web/components/dasboard/card.dart';
import 'package:skiddo_web/controllers/home/home_controller.dart';
import 'package:skiddo_web/theme/DarkThemeProvider.dart';
import 'package:side_navigation/side_navigation.dart';

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<Dashboard> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  var checkIfLoggedIn = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    // openDrawer();
    // checkIfloggedIn();
  }

  openDrawer() async {
    await Future.delayed(Duration.zero);
    _scaffoldKey.currentState?.openDrawer();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController homeController) {
          return Scaffold(
              backgroundColor: Colors.black,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  appBarCustom(context),
                  SizedBox(
                    height: 50.h,
                  ),
                  Obx(() => Flex(
                        mainAxisAlignment: MainAxisAlignment.center,
                        direction: Axis.horizontal,
                        children: [
                          DasboardCard(
                            title: "Downloads",
                            value: homeController.downlaods.value,
                          ),
                          DasboardCard(
                            title: "Total Amount",
                            value: homeController.totalAmount.value,
                          ),
                          DasboardCard(
                            title: "Total Withdrawal",
                            value: homeController.totalWithDrawn.value,
                          ),
                          DasboardCard(
                            title: "Available Balance",
                            value: homeController.Balance.value,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 50.h,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            color: Theme.of(context).primaryColor,
                            height: 400,
                            width: 400,
                            child: Column(children: [
                              Text("Downloads"),
                              // Container(
                              //     height: 300.h,
                              //     width: 300.h,
                              //     child: DChartBarO(
                              //         areaColor: (group, ordinalData, index) {
                              //           return Theme.of(context).primaryColor;
                              //         },
                              //         fillColor: (group, ordinalData, index) {
                              //           return Colors.black;
                              //         },
                              //         groupList: [
                              //           OrdinalGroup(
                              //             color: Colors.red,
                              //             id: '1',
                              //             data: [
                              //               OrdinalData(domain: 'Mon', measure: 2),
                              //               OrdinalData(domain: 'Tue', measure: 6),
                              //               OrdinalData(domain: 'Wed', measure: 3),
                              //               OrdinalData(domain: 'Thu', measure: 7),
                              //             ],
                              //           )
                              //         ]))

                              CustomGraph(
                                points: [
                                  Point(0, 10),
                                  Point(2, 0),
                                  Point(3, 30),
                                  Point(4, 10),
                                  Point(5, 10),
                                  Point(6, 0),
                                  Point(7, 30),
                                  Point(8, 10)
                                ],
                              ),
                            ])),
                        SizedBox(
                          width: 50.h,
                        ),
                        Container(
                            color: Theme.of(context).primaryColor,
                            height: 400,
                            width: 400,
                            child: Column(children: [
                              Text("Downloads"),
                              Container(
                                  height: 300.h,
                                  width: 300.h,
                                  child: DChartBarO(
                                      areaColor: (group, ordinalData, index) {
                                        return Theme.of(context).primaryColor;
                                      },
                                      fillColor: (group, ordinalData, index) {
                                        return Colors.black;
                                      },
                                      groupList: [
                                        OrdinalGroup(
                                          color: Colors.red,
                                          id: '1',
                                          data: [
                                            OrdinalData(
                                                domain: 'Mon', measure: 2),
                                            OrdinalData(
                                                domain: 'Tue', measure: 6),
                                            OrdinalData(
                                                domain: 'Wed', measure: 3),
                                            OrdinalData(
                                                domain: 'Thu', measure: 7),
                                          ],
                                        )
                                      ]))
                            ]))
                      ],
                    ),
                  )
                ],
              ));
        });
  }
}
