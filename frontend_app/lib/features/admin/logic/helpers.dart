import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/dataModels/user.dart';
import 'package:frontend_app/features/admin/feature.dart';
import 'package:frontend_app/features/admin/ui/user_stats.dart';
import 'package:frontend_app/features/admin/ui/users_view.dart';
import 'package:frontend_app/infrastracture/services.dart';

List<Widget> adminSubScreens() {
  return const [
    UsersView(),
    UserStatsView(),
  ];
}

void registerUsers(List<User> users, BuildContext context) {
  final AdminBloc bloc = BlocProvider.of<AdminBloc>(context);
  bloc.add(LoadUsersEvent(users: users));

  ServicesGateway.instance().adminService.registerUsersList(users);
}

Future<List<User>> importUsersFromExcel(BuildContext context) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  final List<User> users = [];

  if (result != null) {
    final file = result.files.single.path!;
    final bytes = File(file).readAsBytesSync();
    final excel = Excel.decodeBytes(bytes);

    final sheet = excel.sheets.entries.first.value;

    for (int rowIndex = 1; rowIndex < sheet.rows.length; rowIndex++) {
      final SharedString name = sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: rowIndex))
          .value;
      final SharedString id = sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: rowIndex))
          .value;
      final SharedString rawUserType = sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: rowIndex))
          .value;

      final user = User(
        name: name.node.lastChild!.innerText,
        id: id.node.lastChild!.innerText,
        startValidity: DateTime.now(),
        endValidity: DateTime.now(),
        userType: _userTypeFromString(rawUserType.node.lastChild!.innerText),
      );

      users.add(user);
    }
  }
  return users;
}

Future<List<User>> importTempUsersFromExcel(BuildContext context) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  final List<User> users = [];

  if (result != null) {
    final file = result.files.single.path!;
    final bytes = File(file).readAsBytesSync();
    final excel = Excel.decodeBytes(bytes);

    final sheet = excel.sheets.entries.first.value;

    final List<User> users = [];

    for (var row in sheet.rows) {
      final user = User(
        name: row[0]!.value as String,
        id: row[1]!.value as String,
        startValidity: DateTime.parse(row[2]!.value as String),
        endValidity: DateTime.parse(row[3]!.value as String),
        userType: UserTypes.temporaryUser,
      );

      users.add(user);
    }
  }
  return users;
}

UserTypes _userTypeFromString(String data) {
  switch (data) {
    case "student":
      return UserTypes.student;
    case "admin":
      return UserTypes.admin;

    default:
      return UserTypes.employee;
  }
}

Future<void> loadAllUsers(AdminBloc bloc) async {
  ServicesGateway.instance().userService.loadAllUsers().then((users) {
    bloc.add(LoadUsersEvent(users: users));
  });
}
