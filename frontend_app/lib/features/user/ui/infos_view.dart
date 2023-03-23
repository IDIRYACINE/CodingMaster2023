import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/dataModels/user.dart';
import 'package:frontend_app/features/user/state/bloc.dart';
import 'package:frontend_app/features/user/state/state.dart';
import 'package:frontend_app/l10n/app_localizations.dart';

import '../logic/helpers.dart';

class UserInfosView extends StatelessWidget {
  const UserInfosView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Scaffold(
        body: Center(
          child: UserInfosWidget(user: state.user),
        ),
      );
    });
  }
}

class UserInfosWidget extends StatelessWidget {
  const UserInfosWidget({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              _InfoRowWidget(
                title: AppLocalizations.of(context)!.userName,
                value: user.name,
              ),
              _InfoRowWidget(
                title: AppLocalizations.of(context)!.userType,
                value: user.userType.name,
              ),
              _InfoRowWidget(
                title: AppLocalizations.of(context)!.validityStartDate,
                value: formatDateTimeForDisplay(user.startValidity),
              ),
              _InfoRowWidget(
                title: AppLocalizations.of(context)!.validityEndDate,
                value: formatDateTimeForDisplay(user.endValidity),
                valueColor: getColorByAcessValidity(user.endValidity),
              ),
              
            ],
          ),
        ),
      ),
    ));
  }
}

class _InfoRowWidget extends StatelessWidget {
  final String title;
  final String value;
  final Color? valueColor;

  const _InfoRowWidget(
      {required this.title, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final valueTextStyle =
        theme.textTheme.bodyMedium!.copyWith(color: valueColor);
    final titleTextStyle = theme.textTheme.bodyMedium;

    return Row(
      children: [
        Text(
          title,
          style: titleTextStyle,
        ),
        Text(
          value,
          style: valueTextStyle,
        ),
      ],
    );
  }
}
