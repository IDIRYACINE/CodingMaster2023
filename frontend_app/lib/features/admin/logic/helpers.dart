
import 'package:flutter/material.dart';
import 'package:frontend_app/features/admin/ui/user_stats.dart';
import 'package:frontend_app/features/admin/ui/users_view.dart';

List<Widget> adminSubScreens(){
  return const [
    UsersView(),
    UserStatsView(),
  ];
}

void importUsersFromExcel(BuildContext context){
  
}