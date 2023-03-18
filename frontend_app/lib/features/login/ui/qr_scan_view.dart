import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/features/login/feature.dart';
import 'package:frontend_app/features/login/logic/controller.dart';
import 'package:frontend_app/features/login/logic/helpers.dart';

class AuthQrScanView extends StatelessWidget {
  const AuthQrScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return _QrScanWidget();
    });
  }
}

class _QrScanWidget extends StatelessWidget {
  final controller = QrWidgetController();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => startQrScanStream(controller),
        child: const Text('Start barcode scan stream'));
  }
}
