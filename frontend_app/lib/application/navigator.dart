import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend_app/features/agent/ui/agent_panel.dart';
import 'package:frontend_app/features/user/ui/user_panel.dart';

import '../features/admin/ui/admin_panel.dart';
import '../main.dart';

abstract class AppNavigator {
  static final key = GlobalKey<NavigatorState>();
  static BuildContext get navigatorContext => key.currentState!.context;
  static bool get canPop => key.currentState!.canPop();

  static void popUntilIsFirst() {
    return key.currentState!.popUntil(
      (route) => route.isFirst,
    );
  }

  static Future displayDialog(Widget dialog,
      {Color? barrierColor = Colors.black54}) {
    return showDialog(
        barrierColor: barrierColor,
        context: navigatorContext,
        builder: (context) => dialog);
  }

  static Future pushNamed(String route, {arguments}) {
    return key.currentState!.pushNamed(route, arguments: arguments);
  }

  static Future pushNamedReplacement(String route, {arguments}) {
    return key.currentState!.pushReplacementNamed(route, arguments: arguments);
  }

  static Future pushNamedAndClear(String route, {arguments}) {
    return key.currentState!.pushNamedAndRemoveUntil(
      route,
      (_) => false,
      arguments: arguments,
    );
  }

  static Future<bool> maybePop([result]) {
    return key.currentState!.maybePop(result);
  }

  static void pop([result]) {
    if (canPop) return key.currentState!.pop(result);
  }

  static final ValueNotifier<int> _selectedPanelIndex = ValueNotifier(0);

  static final List<Widget> _panels = [
    const AdminPanel(),
    const UserPanel(),
    const AgentPanel(),
  ];

  static final List<IconData> _panelIcons = [
    Icons.shopping_cart,
    Icons.house,
    Icons.monetization_on,
    Icons.online_prediction_rounded,
    Icons.receipt_long,
    Icons.settings,
    Icons.dashboard
  ];

  // ignore: unused_field
  static const int salesIndex = 0,
      stockIndex = 1,
      ordersIndex = 2,
      recordsIndex = 3,
      settingsIndex = 4,
      depositsIndex = 5,
      dashboardIndex = 6;

  static ValueListenable<int> get selectedIndex => _selectedPanelIndex;

  static Widget getSelectedPanel() {
    return _panels[_selectedPanelIndex.value];
  }

  static void navigateToPanel(int index) {
    _selectedPanelIndex.value = index;
  }

  static void pushMainAppRoute(){
    final mainRoute = MaterialPageRoute(builder: (context) =>  const App());
    key.currentState!.pushReplacement(mainRoute);
  }

  static IconData? getSelectedPanelIcon(int index) => _panelIcons[index];
}
