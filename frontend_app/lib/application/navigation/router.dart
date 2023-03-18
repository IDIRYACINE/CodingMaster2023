import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_app/features/admin/feature.dart';
import 'package:frontend_app/features/agent/feature.dart';
import 'package:frontend_app/features/login/feature.dart';
import 'package:frontend_app/features/splash/feature.dart';
import 'package:frontend_app/features/user/feature.dart';

abstract class AppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case userRoute:
        return getPageRoute(
          settings: settings,
          view: const UserScreen(),
        );

      case adminRoute:
        return getPageRoute(
          settings: settings,
          view: const AdminScreen(),
        );

      case agentRoute:
        return getPageRoute(
          settings: settings,
          view: const AgentScreen(),
        );

      case loginRoute:
        return getPageRoute(
          settings: settings,
          view: const LoginScreen(),
        );

      default:
        return getPageRoute(
          settings: settings,
          view: const SplashScreen(),
        );
    }
  }

  static PageRoute<dynamic> getPageRoute({
    required RouteSettings settings,
    required Widget view,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(settings: settings, builder: (_) => view)
        : MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}

enum Routes { login, agent, admin, user }

const loginRoute = '/login';
const agentRoute = '/agent';
const userRoute = '/user';
const adminRoute = '/admin';
