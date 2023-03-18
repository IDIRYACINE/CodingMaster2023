import 'package:flutter/material.dart';
import 'package:frontend_app/features/splash/logic/helpers.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    setup();

    return const Center(
        child: Image(
      fit: BoxFit.fill,
      image: AssetImage("assets/background.png"),
    ));
  }
}
