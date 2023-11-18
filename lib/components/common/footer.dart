import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skiddo_web/components/auth/login/login_dialog.dart';
import 'package:skiddo_web/components/auth/login/registeration_dialog.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.h,
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Terms",
                      style: Theme.of(context).textTheme.headline6!,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "carrears",
                      style: Theme.of(context).textTheme.headline6!,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "carrears",
                      style: Theme.of(context).textTheme.headline6!,
                    ),
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                children: [
                  TextButton(
                    onPressed: () {

                       showDialog(context: context, builder: (ctx) => signUpWidget(context));
                    },
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.headline6!,
                    ),
                  ),
                  TextButton(
                    onPressed: () {

            
              showDialog(context: context, builder: (ctx) => register(context));
              // setState(() {

              // });
            
                    },
                    child: Text(
                      "Rigsiter",
                      style: Theme.of(context).textTheme.headline6!,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "carrears",
                      style: Theme.of(context).textTheme.headline6!,
                    ),
                  ),
                ],
              )),
           
              Expanded(
                  child: Column(
                children: [
                  const Text("Newsletter ", style: TextStyle(color: Colors.white)),
                  const Text("let's get in touch with you Man! ",
                      style: TextStyle(color: Colors.white)),
                  Container(color: Colors.white, child: const TextField())
                ],
              )),
            ],
          ),
        Expanded(
                  child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40.h, child: 
              FloatingActionButton(
                     elevation: 5,
               // <-- Text
                backgroundColor: Colors.white,
                child: const Icon(
                  // <-- Icon
                  Icons.install_desktop,
                  size: 18.0,
                  color: Colors.black,
                ),
                onPressed: () {},
              )),
              SizedBox(width: 10.h,),
              SizedBox(height: 40.h, child: 
              FloatingActionButton(
                     elevation: 5,
               // <-- Text
                backgroundColor: Colors.white,
                child: const Icon(
                  // <-- Icon
                  Icons.install_desktop,
                  size: 18.0,
                  color: Colors.black,
                ),
                onPressed: () {},
              )),
                SizedBox(width: 10.h,),
             SizedBox(height: 40.h, child: 
              FloatingActionButton(
                     elevation: 5,
               // <-- Text
                backgroundColor: Colors.white,
                child: const Icon(
                  // <-- Icon
                  Icons.install_desktop,
                  size: 18.0,
                  color: Colors.black,
                ),
                onPressed: () {},
              )),
            ],
          )
        )]));
  }

    Widget signUpWidget(BuildContext context) {
    return AlertDialog(
      title: Text(
      'Picco',textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline5!
        
      ),
      content: FirstLoginScreen(),
    );
  }

  Widget register(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Picco',textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline5!
            
      ),
      content: Registeration(),
    );
  }
}
