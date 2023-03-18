import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/features/agent/feature.dart';

class AgentUserVerificationView extends StatelessWidget {
  const AgentUserVerificationView({super.key});

  void _onContinue(BuildContext context) {
    context
        .read<AgentBloc>()
        .add(NavigateToScreen(screenIndex: AgentScreens.scanner.index));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentBloc, AgentState>(builder: (context, state) {
      if (!state.isAwaitingResponse && state.isAcessGranted) {
        return Center(child: _UserVerifiedWidget(
          onPressed: () {
            _onContinue(context);
          },
        ));
      }

      if (!state.isAwaitingResponse && !state.isAcessGranted) {
        return Center(child: _UserNotVerifiedWidget(
          onPressed: () {
            _onContinue(context);
          },
        ));
      }

      return const Center(child: CircularProgressIndicator());
    });
  }
}

class _UserVerifiedWidget extends StatelessWidget {
  const _UserVerifiedWidget({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
          ),
          MaterialButton(
            onPressed: onPressed,
            child: const Text("continue"),
          ),
          MaterialButton(
            onPressed: onPressed,
            child: const Text("register vehicule"),
          )
        ],
      ),
    );
  }
}

class _UserNotVerifiedWidget extends StatelessWidget {
  const _UserNotVerifiedWidget({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Colors.red,
          ),
          MaterialButton(
            onPressed: onPressed,
            child: const Text("continue"),
          )
        ],
      ),
    );
  }
}
