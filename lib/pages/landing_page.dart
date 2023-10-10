import 'package:flutter/material.dart';
import 'package:skiddo_web/components/sections/footerSection/footer_section.dart';
import 'package:skiddo_web/components/sections/topSection/top_section.dart';
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopSection(),
            FooterSection()
            // SizedBox(height: kDefaultPadding * 2),
            // AboutSection(),
            // ServiceSection(),
            // RecentWorkSection(),
            // FeedbackSection(),
            // SizedBox(height: kDefaultPadding),
            // ContactSection(),
            // This SizeBox just for demo
            // SizedBox(
            //   height: 500,
            // )
          ],
        ),
      ),
    );
  }
}
