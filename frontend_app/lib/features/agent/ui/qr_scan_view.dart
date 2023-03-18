import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/features/agent/feature.dart';
import 'package:frontend_app/features/agent/logic/controller.dart';
import 'package:frontend_app/features/agent/logic/helpers.dart';

class AgentQrScanView extends StatelessWidget {
  const AgentQrScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentBloc, AgentState>(builder: (context, state) {
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
