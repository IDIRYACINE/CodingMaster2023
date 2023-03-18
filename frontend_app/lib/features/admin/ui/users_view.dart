import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/dataModels/user.dart';
import 'package:frontend_app/features/admin/feature.dart';
import 'package:frontend_app/features/admin/logic/helpers.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  Widget itemBuilder(AdminState state, int index) {
    return _UserWidget(user: state.users[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminBloc, AdminState>(builder: (context, state) {
      return Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) => itemBuilder(state, index),
          itemCount: state.users.length,
        ),
        floatingActionButton: IconButton(
            onPressed: () {
              importUsersFromExcel(context);
            },
            icon: const Icon(Icons.add)),
      );
    });
  }
}

class _UserWidget extends StatelessWidget {
  final User user;

  const _UserWidget({required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(user.id),
        ),
        Expanded(
          child: Text(user.name),
        ),
        Expanded(
          child: Text(user.userType.name),
        )
      ],
    );
  }
}
