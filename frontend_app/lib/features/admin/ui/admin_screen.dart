import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/dataModels/user.dart';
import 'package:frontend_app/features/admin/feature.dart';
import 'package:frontend_app/features/admin/logic/helpers.dart';
import 'package:frontend_app/l10n/app_localizations.dart';
import 'package:frontend_app/ui/bottom_bar.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    loadAllUsers(BlocProvider.of<AdminBloc>(context));

    return BlocBuilder<AdminBloc, AdminState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title:  Text(AppLocalizations.of(context)!.admin),
          ),
          body: Center(
            child: state.selectedScreen,
          ),
          bottomNavigationBar: const UserBottomBar(
            userType: UserTypes.admin,
          ),
        );
      },
    );
  }
}
