import 'package:flutter/material.dart';
import 'package:frontend_app/ui/themes.dart';

import 'data.dart';

class SettingsController with ChangeNotifier {
  static SettingsController? _instance;

  SettingsController._(){
    _setupThemes();
  }

  factory SettingsController.instance() {
    _instance ??= SettingsController._();
    return _instance!;
  }


  void _setupThemes(){
    themes.add(ThemeEncapsulator(name: 'Admin', themeData: adminTheme, index: 0));
    themes.add(ThemeEncapsulator(name: 'Agent', themeData: agentTheme, index: 1));
    themes.add(ThemeEncapsulator(name: 'User', themeData: userTheme, index: 2));
    _theme = themes[0];
  }

  final List<ThemeEncapsulator> themes = [];

  late ThemeEncapsulator _theme ;

  ThemeData get theme => _theme.themeData;

  void setTheme(ThemeEncapsulator theme){
    _theme = theme;
    notifyListeners();
  }

}
