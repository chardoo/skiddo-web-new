import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmDialog extends StatelessWidget {
  String header;
  String content;
  String cancelText;
  String confirmText;

  Function? confirmFunction;

  ConfirmDialog({
    Key? key,
    required this.header,
    required this.content,
    required this.cancelText,
    required this.confirmText,
    required this.confirmFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            // color: Colors.red,
            // width: 250.w,
            // height: 650.h,
            child: AlertDialog(
              insetPadding: EdgeInsets.all(100),
              backgroundColor: const Color.fromARGB(255, 224, 223, 223),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14.0)),
              ),
              title: Column(
                children: [
                  Text(header,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold))
                ],
              ),
              content: Wrap(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        content,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(cancelText,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 17,
                          ))),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                confirmFunction!();
                              },
                              child: Text(confirmText,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)))

                         
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
