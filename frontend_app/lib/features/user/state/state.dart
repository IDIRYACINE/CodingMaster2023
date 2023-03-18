import 'package:flutter/material.dart';
import 'package:frontend_app/dataModels/user.dart';
import 'package:frontend_app/features/user/logic/helpers.dart';

class UserState {
  final User user;
  final int selectedIndex;

  final List<Widget> _screens;

  final Widget selectedScreen;

  UserState(
      {required this.user,
      this.selectedIndex = 0,
      required this.selectedScreen,
      required List<Widget> screens})
      : _screens = screens;

  factory UserState.initial() {
    final screens = generateUserSubScreens();
    return UserState(
        user: User.initial(),
        selectedIndex: 0,
        selectedScreen: screens[0],
        screens: screens);
  }

  UserState copyWith({
    User? user,
    int? selectedIndex,
    List<Widget>? screens,
  }) {
    final newScreens = screens ?? _screens;
    return UserState(
      user: user ?? this.user,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      screens: newScreens,
      selectedScreen: newScreens[selectedIndex ?? this.selectedIndex],
    );
  }
}
