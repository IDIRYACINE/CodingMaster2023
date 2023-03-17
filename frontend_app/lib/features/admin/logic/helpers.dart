import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

import '../../../dataModels/user.dart';

UserType _getUserType(Data? elementAt) {
  late UserType result;

  final String data = elementAt!.value;
  switch (data) {
    case "Employee":
      result = UserType.employee;
      break;
    default:
      result = UserType.student;
  }

  return result;
}

Future<List<User>> loadPermUsers() async {
  List<User> users = [];

  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    File file = File(result.files.single.path!);
    final bytes = file.readAsBytesSync();

    final excel = Excel.decodeBytes(bytes);

    final sheet = excel.tables.entries.first.value;

    for (var row in sheet.rows) {
      final userType = _getUserType(row.elementAt(2));

      final User user =
          User(row.elementAt(0)!.value, row.elementAt(1)!.value, userType);

      users.add(user);
    }
  }
  return users;
}

Future<List<User>> loadTempUsers() async {
  List<User> users = [];

  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    File file = File(result.files.single.path!);
    final bytes = file.readAsBytesSync();

    final excel = Excel.decodeBytes(bytes);

    final sheet = excel.tables.entries.first.value;

    for (var row in sheet.rows) {
      final userType = _getUserType(row.elementAt(2));

      final User user =
          User(row.elementAt(0)!.value, row.elementAt(1)!.value, userType);

      users.add(user);
    }
  }
  return users;
}
