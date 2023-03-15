
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/bloc.dart';
import '../state/state.dart';

class UserPanel extends StatelessWidget{
  const UserPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc,UserState>(
      builder: (context,state) {
        return const Text("Empty");
      }
    );
  }
}