import 'package:flutter/material.dart';
import 'package:frontend_app/features/user/ui/infos_view.dart';
import 'package:frontend_app/features/user/ui/qr_view.dart';

List<Widget> generateUserSubScreens() {
  return const [UserQrView(), UserInfosView()];
}
