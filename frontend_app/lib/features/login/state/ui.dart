import 'package:flutter/material.dart';

import 'composents/textFiels.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var idController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: defaultFormField(
                  controller: idController,
                  label: 'ID',
                  prefix: null,
                  type: TextInputType.number,
                  isPassword: false,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                  onChange: null,
                  onSubmit: (){},
                  suffix: null
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: defaultFormField(
                    controller: idController,
                    label: 'ID',
                    prefix: null,
                    type: TextInputType.number,
                    isPassword: false,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a value';
                      }
                      return null;
                    },
                    onChange: null,
                    onSubmit: () {},
                    suffix: null),
              ),
            )
          ],
        ),
      
    );
  }
}
