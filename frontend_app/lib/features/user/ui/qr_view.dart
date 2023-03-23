import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/dataModels/user.dart';
import 'package:frontend_app/features/user/feature.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserQrView extends StatelessWidget {
  const UserQrView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Scaffold(
        body: Center(
          child: Card(child: UserQrWidget(user: state.user)),
        ),
      );
    });
  }
}

class UserQrWidget extends StatelessWidget {
  const UserQrWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: user.id.toString(),
      version: QrVersions.auto,
      size: 200.0,
    );
  }
}
