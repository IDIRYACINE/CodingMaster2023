import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/features/login/feature.dart';
import 'package:frontend_app/features/login/logic/helpers.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = LoginController();

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Material(
          child: Form(
                key: loginController.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Uniway Logo'),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Id',
                        ),
                        onChanged: (value) {
                          loginController.id = value;
                        },
                      ),
                        
                        TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                        onChanged: (value) {
                          loginController.password = value;
                        },
                      ),
                        
                      MaterialButton(
                        onPressed: () {
                          loginController.loginWithCredentials();
                        },
                        child: const Text('Login with credentials'),
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 1,
                        height: 10,
                      )
                      ,
                      MaterialButton(
                        onPressed: () {
                          loginController.loginWithQr();
                        },
                        child: const Text('Login with qr'),
                      ),
                    ],
                  ),
                ),
              ),
        );
      },
    );
  }
}
