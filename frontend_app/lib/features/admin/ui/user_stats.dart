import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/dataModels/user_stats.dart';
import 'package:frontend_app/features/admin/feature.dart';
import 'package:frontend_app/l10n/app_localizations.dart';

class UserStatsView extends StatelessWidget {
  const UserStatsView({super.key});

  Widget itemBuilder(AdminState state, int index) {
    return _UserStatWidget(stat: state.userStats[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminBloc, AdminState>(builder: (context, state) {
      return ListView.builder(
        itemBuilder: (context, index) => itemBuilder(state, index),
        itemCount: state.userStats.length,
      );
    });
  }
}

class _UserStatWidget extends StatelessWidget {
  final UserStats stat;

  const _UserStatWidget({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(stat.name ?? AppLocalizations.of(context)!.unkown),
        ),
        Expanded(
          child: Text(stat.authorised
              ? AppLocalizations.of(context)!.acessGranted
              : AppLocalizations.of(context)!.acessDenied),
        )
      ],
    );
  }
}
