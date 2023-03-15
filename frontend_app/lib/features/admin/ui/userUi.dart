import 'package:flutter/material.dart';
import 'package:frontend_app/features/login/state/composents/defaultButton.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
Row(
  mainAxisSize: MainAxisSize.max,
  children: [
    defaultButton(function: (){}, text: "Upload .xls"),
    SizedBox(
      width: 5,
    ),
    defaultButton(function: (){}, text: "Download .xls"),
],), 
SizedBox(
          height: 5,
        ),
defaultButton(function: () {}, text: "View Stat"),
      ],
    );
  }
}