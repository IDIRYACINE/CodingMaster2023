import 'package:flutter/material.dart';
import 'package:frontend_app/dataModels/user.dart';
import 'package:frontend_app/dataModels/user_stats.dart';
import 'package:frontend_app/features/admin/logic/helpers.dart';

class AdminState {
  final List<User> users;

  final bool isImportingUsers;

  final List<UserStats> userStats;

  final int selectedIndex;

  final Widget selectedScreen;

  final List<Widget> screens;

  AdminState( 
      {required this.selectedIndex,
      required this.userStats,
      required this.users,
      required this.screens,
      required this.selectedScreen, 
      required this.isImportingUsers});

  AdminState copyWith(
      {int? selectedIndex,
      List<User>? users,
      bool? isImportingUsers,
      Widget? selectedScreen,
      List<Widget>? screens,
      List<UserStats>? userStats}) {
    return AdminState(
      screens: screens ?? this.screens,
      selectedScreen: selectedScreen ?? this.selectedScreen,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      users: users ?? this.users,
      isImportingUsers: isImportingUsers ?? this.isImportingUsers,
      userStats: userStats ?? this.userStats,
    );
  }

  factory AdminState.initial() {
    final screens = adminSubScreens();
    return AdminState(

      users: [],
      isImportingUsers: false,
      userStats: [],
      selectedIndex: 0, selectedScreen: 
        screens[0]
      , screens: screens,
    );
  }
}
