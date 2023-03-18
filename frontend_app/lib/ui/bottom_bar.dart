import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/dataModels/user.dart';
import 'package:frontend_app/features/admin/feature.dart' as admin;
import 'package:frontend_app/features/user/feature.dart' as user;

class UserBottomBar extends StatelessWidget {
  final UserTypes userType;

  const UserBottomBar({super.key, required this.userType});

  List<BottomNavigationBarItem> buildItems(UserTypes userType) {
    return userType == UserTypes.admin ? _adminItems() : _userItems();
  }

  void _onItemTap(int index, BuildContext context) {
    if (userType == UserTypes.admin) {
      BlocProvider.of<user.UserBloc>(context)
          .add(user.NavigateToScreenEvent(index));
      return;
    }
    BlocProvider.of<admin.AdminBloc>(context)
        .add(admin.NavigateToScreenEvent(screnIndex: index));
  }

  int getCurrentIndex(BuildContext context) {
    if (userType == UserTypes.admin) {
      return BlocProvider.of<user.UserBloc>(context)
          .state.selectedIndex;
    }
    return BlocProvider.of<admin.AdminBloc>(context)
        .state.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex:
            getCurrentIndex(context),
        items: buildItems(userType),
        onTap: (index) => _onItemTap(index, context));
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
