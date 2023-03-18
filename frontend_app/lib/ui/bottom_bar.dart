import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/dataModels/user.dart';
import 'package:frontend_app/features/admin/feature.dart' as admin;
import 'package:frontend_app/features/admin/feature.dart';
import 'package:frontend_app/features/user/feature.dart' as user;
import 'package:frontend_app/features/user/feature.dart';

class UserBottomBar extends StatelessWidget {
  final UserTypes userType;

  const UserBottomBar({super.key, required this.userType});

  List<BottomNavigationBarItem> buildItems(UserTypes userType) {
    return userType == UserTypes.admin ? _adminItems() : _userItems();
  }

  void _onItemTap(int index, BuildContext context) {
    if ((userType == UserTypes.employee) || (userType == UserTypes.student)) {
      BlocProvider.of<user.UserBloc>(context)
          .add(user.NavigateToScreenEvent(index));
      return;
    }
    BlocProvider.of<admin.AdminBloc>(context)
        .add(admin.NavigateToScreenEvent(screnIndex: index));
  }

  @override
  Widget build(BuildContext context) {
    if (userType == UserTypes.employee || userType == UserTypes.student) {
      return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        return BottomNavigationBar(
            currentIndex: state.selectedIndex,
            items: buildItems(userType),
            onTap: (index) => _onItemTap(index, context));
      });
    }
    return BlocBuilder<AdminBloc, AdminState>(builder: (context, state) {
      return BottomNavigationBar(
          currentIndex: state.selectedIndex,
          items: buildItems(userType),
          onTap: (index) => _onItemTap(index, context));
    });
  }
}

List<BottomNavigationBarItem> _adminItems() {
  return [
    const BottomNavigationBarItem(
      icon: Icon(Icons.qr_code),
      label: 'Users',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.info),
      label: 'Stats',
    ),
  ];
}

List<BottomNavigationBarItem> _userItems() {
  return [
    const BottomNavigationBarItem(
      icon: Icon(Icons.qr_code),
      label: 'QR',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.info),
      label: 'Infos',
    ),
  ];
}
