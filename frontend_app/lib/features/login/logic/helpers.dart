import 'package:flutter/material.dart';
import 'package:frontend_app/application/navigation/feature.dart';

class LoginController {
  LoginController();

  final formKey = GlobalKey<FormState>();

  String id = '';
  String password = '';

  void loginWithCredentials() {
    AppNavigator.pushNamedReplacement(userRoute);
  }

  void loginWithQr() {
    AppNavigator.pushNamedReplacement(userRoute);
  }
}
