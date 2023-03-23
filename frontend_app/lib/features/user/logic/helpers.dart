import 'package:flutter/material.dart';
import 'package:frontend_app/features/user/ui/infos_view.dart';
import 'package:frontend_app/features/user/ui/qr_view.dart';
import 'package:frontend_app/ui/constants.dart';

List<Widget> generateUserSubScreens() {
  return const [UserQrView(), UserInfosView()];
}

String formatDateTimeForDisplay(DateTime date){
  return "${date.day}/${date.month}/${date.year}";
}

Color getColorByAcessValidity(DateTime date){
  DateTime now = DateTime.now();

  if(now.isAfter(date)){
    return deniedColor;
  }
  return acessGrantedColor;
}