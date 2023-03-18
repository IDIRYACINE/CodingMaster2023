import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/features/user/state/bloc.dart';
import 'package:frontend_app/features/user/state/state.dart';

import '../../../ui/bottom_bar.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.user.userType.name),
          ),
          body: state.selectedScreen,
          bottomNavigationBar: UserBottomBar(userType: state.user.userType),
        );
      },
    );
  }
}
