import 'package:flutter/material.dart';

Widget defaultFormField({
  @required TextEditingController? controller,
  @required TextInputType? type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,
  @required Function? validate,
  @required String? label,
  @required IconData? prefix,
  IconData? suffix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit!(),
      onChanged: onChange!(),
      validator: validate!(),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? Icon(
                suffix,
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );
