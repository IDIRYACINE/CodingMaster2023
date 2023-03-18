import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/dataModels/user.dart';
import 'package:frontend_app/features/user/state/bloc.dart';
import 'package:frontend_app/features/user/state/state.dart';

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
    return  Center(
      child: Column(
        children: [
          Text(user.name),
          Text(user.startValidity.toString()),
          Text(user.endValidity.toString()),
          Text(user.userType.name),

        ],
      )
    );
  }
}
