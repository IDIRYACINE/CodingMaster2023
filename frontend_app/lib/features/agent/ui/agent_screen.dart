import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/features/agent/feature.dart';
import 'package:frontend_app/l10n/app_localizations.dart';

class AgentScreen extends StatelessWidget {
  const AgentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.agent),
      ),
      body: BlocBuilder<AgentBloc, AgentState>(builder: (context, state) {
        return Center(
          child: state.selectedScreen,
        );
      }),
    );
  }
}
