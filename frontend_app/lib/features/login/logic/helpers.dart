import 'package:flutter/material.dart';
import 'package:frontend_app/application/navigation/feature.dart';
import 'package:frontend_app/dataModels/user.dart';
import 'package:frontend_app/infrastracture/services.dart';
import 'package:frontend_app/ui/dialogs.dart';

class LoginController {
  LoginController();

  final formKey = GlobalKey<FormState>();

  String id = '';
  String password = '';

  void loginWithCredentials() {
    ServicesGateway.instance()
        .authService
        .loginWithCredentials(id, password)
        .then(_onLoginResponse);
  }

  void _onLoginResponse(User? user) {
    if (user != null) {
      _navigateToUserRoleRoute(user.userType);
    } else {
      AppNavigator.displayDialog(
          const InformativeDialog(descripton: "Invalid Login"));
    }
  }

  void loginWithQr() {
    AppNavigator.pushNamedReplacement(userRoute);
  }

  void _navigateToUserRoleRoute(UserTypes userType) {
    switch (userType) {
      case UserTypes.agent:
        AppNavigator.pushNamedReplacement(agentRoute);
        break;
      case UserTypes.admin:
        AppNavigator.pushNamedReplacement(adminRoute);
        break;
      default:
        AppNavigator.pushNamedReplacement(userRoute);
    }
  }
}
