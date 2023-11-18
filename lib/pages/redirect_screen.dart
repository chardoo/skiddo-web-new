import 'package:flutter/material.dart';
class RedirectScreen extends StatelessWidget {
  const RedirectScreen({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        text,
      )),
    );
  }
}
