import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/features/login/state/bloc.dart';
import 'package:frontend_app/features/splash/ui/splash_screen.dart';

import 'application/navigation/app_navigation.dart';
import 'features/admin/feature.dart';
import 'features/agent/feature.dart';
import 'features/settings/feature.dart';
import 'features/user/feature.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => AdminBloc()),
        BlocProvider(create: (context) => AgentBloc()),
      ],
      child: const Uniway(),
    ),
  );
}

class Uniway extends StatelessWidget {
  const Uniway({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: SettingsController.instance(),
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: AppNavigator.key,
            title: 'Uniway',
            theme: SettingsController.instance().theme,
            onGenerateRoute: AppRouter.generateRoutes,
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashScreen());
  }
}
