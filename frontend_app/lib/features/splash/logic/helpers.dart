

import 'package:frontend_app/application/navigation/feature.dart';

Future<void> setup() async {
  await Future.delayed(const Duration(seconds: 3));
  AppNavigator.pushNamedReplacement(
    loginRoute,
  );
}