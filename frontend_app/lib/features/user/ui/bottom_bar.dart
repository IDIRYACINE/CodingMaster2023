import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/dataModels/user.dart';
import 'package:frontend_app/features/user/feature.dart';

class UserBottomBar extends StatelessWidget {
  final UserTypes userType;

  const UserBottomBar({super.key, required this.userType});

  List<BottomNavigationBarItem> buildItems(UserTypes userType) {
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

  void _onItemTap(int index,BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(NavigateToScreenEvent(index));
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: BlocProvider.of<UserBloc>(context).state.selectedIndex,
      items: buildItems(userType), onTap:(index) => _onItemTap(index,context));
  }
}
