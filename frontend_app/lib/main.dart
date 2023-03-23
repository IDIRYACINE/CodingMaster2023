import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frontend_app/features/login/state/bloc.dart';
import 'package:frontend_app/features/splash/ui/splash_screen.dart';

import 'application/navigation/app_navigation.dart';
import 'features/admin/feature.dart';
import 'features/agent/feature.dart';
import 'features/settings/feature.dart';
import 'features/user/feature.dart';
import 'l10n/app_localizations.dart';
import 'ui/constants.dart';

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
            title: appName,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: SettingsController.instance().supportedLocales,
            locale: SettingsController.instance().locale,
            theme: SettingsController.instance().theme,
            onGenerateRoute: AppRouter.generateRoutes,
            home: const MyHomePage(),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashScreen());
  }
}
