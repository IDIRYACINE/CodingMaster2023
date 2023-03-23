import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:frontend_app/application/navigation/feature.dart';
import 'package:frontend_app/dataModels/user.dart';
import 'package:frontend_app/infrastracture/services.dart';
import 'package:frontend_app/ui/dialogs.dart';

import '../ui/qr_scan_view.dart';

class QrWidgetController {
  void onQrScan(String qr) {
    ServicesGateway.instance().authService.loginWithQr(qr).then((response) {});
  }
}

class LoginController {
  late ServicesGateway store;

  LoginController(this.store);

  final formKey = GlobalKey<FormState>();

  String id = '';
  String password = '';

  void loginWithCredentials() {
    if (formKey.currentState!.validate()) {
      ServicesGateway.instance()
          .authService
          .loginWithCredentials(id, password)
          .then(_onLoginResponse);
    }
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
    AppNavigator.pushReplacement(const AuthQrScanView());
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

Future<void> startQrScanStream(QrWidgetController controller) async {
  FlutterBarcodeScanner.getBarcodeStreamReceiver(
          '#ff6666', 'Cancel', true, ScanMode.QR)!
      .listen((barcode) => controller.onQrScan(barcode));
}
