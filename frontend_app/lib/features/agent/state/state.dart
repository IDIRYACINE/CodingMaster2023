
import 'package:flutter/material.dart';
import 'package:frontend_app/dataModels/user.dart';
import 'package:frontend_app/features/agent/logic/helpers.dart';

class AgentState {
  final String userId;
  final String vehiculeId;
  final int screenIndex;
  final List<Widget> screens;
  final Widget selectedScreen;

  final bool isAwaitingResponse ;
  final bool isAcessGranted ;
  final UserTypes userType;

  AgentState({required this.userId,
  required this.isAcessGranted,
  required this.userType,
  required this.isAwaitingResponse, required this.vehiculeId, required this.screenIndex, required this.screens, required this.selectedScreen});


  AgentState copyWith({String? userId,
    bool? isAwaitingResponse,
    bool ? isAcessGranted,
    UserTypes? userType,
   String? vehiculeId, int? screenIndex, List<Widget>? screens}) {
    final newScreens = screens ?? this.screens;
    return AgentState(
      isAcessGranted: isAcessGranted ?? this.isAcessGranted,
      isAwaitingResponse: isAwaitingResponse ?? this.isAwaitingResponse,
      userId: userId ?? this.userId,
      vehiculeId: vehiculeId ?? this.vehiculeId,
      screenIndex: screenIndex ?? this.screenIndex,
      userType: userType ?? this.userType,
      screens: newScreens,
      selectedScreen: newScreens[screenIndex ?? this.screenIndex],
    );
  }

  factory AgentState.initial() {
    final screens = generateAgentSubScreens();
    return AgentState(
      userId: '',
      userType: UserTypes.temporaryUser,
      isAcessGranted: false,
      isAwaitingResponse: false,
      vehiculeId: '',
      screenIndex: 0,
      screens: screens,
      selectedScreen: screens[0],
    );
  }

}

enum AgentScreens{
  scanner,
  verificationUser,
  verificationVehicule,
}