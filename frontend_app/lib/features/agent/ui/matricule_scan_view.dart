
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/features/agent/feature.dart';

class MatriculeScanView extends StatelessWidget {
  const MatriculeScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentBloc,AgentState>(
      builder: (context,state) {
        return Container();
      }
    );
  }
}