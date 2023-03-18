import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:frontend_app/features/agent/ui/qr_scan_view.dart';
import 'package:frontend_app/features/agent/ui/user_verification_view.dart';
import 'package:frontend_app/features/agent/ui/vehicule_verification_view.dart';

import 'controller.dart';

List<Widget> generateAgentSubScreens() {
  return const [
    AgentQrScanView(),
    AgentUserVerificationView(),
    AgentVehiculeVerificationView()
  ];
}

Future<void> startQrScanStream(QrWidgetController controller) async {
  FlutterBarcodeScanner.getBarcodeStreamReceiver(
          '#ff6666', 'Cancel', true, ScanMode.QR)!
      .listen((barcode) => controller.onQrScan(barcode));
}
