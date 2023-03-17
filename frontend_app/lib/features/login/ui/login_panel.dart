import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/features/login/state/bloc.dart';
import 'package:frontend_app/features/login/state/state.dart';


class LoginPanel extends StatelessWidget {
  const LoginPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Column(
        children: [
          const TextField(
            
          ),
         const TextField(),
         MaterialButton(onPressed: (){
         })
         
         ],
      );
    });
  }
}
