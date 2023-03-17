import 'package:flutter/material.dart';
import 'package:frontend_app/features/login/state/ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // constructor
  // build²

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}
